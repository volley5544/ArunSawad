import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'lat_lng.dart' as latlng;

export 'dart:async' show Completer;
export 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
export 'lat_lng.dart' show LatLng;

enum GoogleMapStyle {
  standard,
  silver,
  retro,
  dark,
  night,
  aubergine,
}

enum GoogleMarkerColor {
  red,
  orange,
  yellow,
  green,
  cyan,
  azure,
  blue,
  violet,
  magenta,
  rose,
}

@immutable
class MarkerImage {
  const MarkerImage({
    required this.imagePath,
    required this.isAssetImage,
    this.size = 20.0,
    this.cached = true,
  });
  final String imagePath;
  final bool isAssetImage;
  final double size;

  /// Whether a network image is served from the shared disk cache.
  ///
  /// Ignored by asset images, which never go over the network.
  final bool cached;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarkerImage &&
          imagePath == other.imagePath &&
          isAssetImage == other.isAssetImage &&
          size == other.size &&
          cached == other.cached);

  @override
  int get hashCode => Object.hash(imagePath, isAssetImage, size, cached);
}

class FlutterFlowMarker {
  const FlutterFlowMarker(
    this.markerId,
    this.location, [
    this.onTap,
    this.image,
  ]);
  final String markerId;
  final latlng.LatLng location;
  final Future Function()? onTap;

  /// Overrides the map-wide marker image for this marker alone.
  final MarkerImage? image;
}

/// The image [marker] renders with: its own, else the map-wide one, else none.
MarkerImage? markerImageFor(
  FlutterFlowGoogleMap map,
  FlutterFlowMarker marker,
) =>
    marker.image ?? map.markerImage;

/// Every distinct image the map needs: the map-wide one plus any a single
/// marker overrides it with. Decoding is keyed on this set, so markers sharing
/// an image share one bitmap.
Set<MarkerImage> markerImagesFor(FlutterFlowGoogleMap map) => {
      // Decoded even with no marker drawing it yet, so that markers arriving
      // from a query draw their icon instead of a default pin that pops.
      if (map.markerImage != null) map.markerImage!,
      for (final marker in map.markers)
        if (marker.image != null) marker.image!,
    };

/// How many decode failures one subscription reports before going quiet.
///
/// The failure handler runs per frame now rather than once, so reports are
/// capped rather than latched: a run of failures cannot flood the app's error
/// reporting, and an image that fails only now and then is still heard without
/// reporting on every bad frame for as long as the map is open.
const _maxMarkerImageFailureReports = 3;

/// Feeds every frame [stream] delivers into [cache] for [request].
///
/// Where [MarkerBitmapCache.animateFrames] is set, the subscription outlives
/// the first frame. A BitmapDescriptor is a single still bitmap, so an
/// animated marker only moves while its stream stays attached and each frame
/// replaces the stored bitmap. Detaching once a frame has been stored is what
/// stops a GIF marker dead, so it is not an optimisation to make here.
///
/// The cost is one live listener per distinct marker image, held for as long
/// as a marker draws it and paid for still images too, since nothing says in
/// advance which images have a second frame. It is bounded by what is on
/// screen: [cache] detaches when the image is replaced, when its stream fails
/// or repeatedly cannot be decoded, when it stops being drawn, and — where
/// frames are not wanted at all — after the first one.
void subscribeMarkerBitmapFrames(
  ImageStream stream,
  MarkerBitmapCache cache,
  MarkerBitmapRequest request, {
  required Set<MarkerImage> Function() requiredImages,
  required VoidCallback onFrameStored,
}) {
  final markerImageSize = Size.square(request.image.size);
  var failureReports = 0;
  late final ImageStreamListener listener;
  listener = ImageStreamListener(
    (img, _) async {
      try {
        final stored = await withOwnedImageInfo(
          img,
          () => cache.resolveBitmap(
            request,
            decode: () async {
              final bytes = await img.image.toByteData(
                format: ImageByteFormat.png,
              );
              if (bytes == null) {
                return null;
              }
              return BitmapDescriptor.fromBytes(
                bytes.buffer.asUint8List(),
                size: markerImageSize,
              );
            },
            requiredImages: requiredImages,
          ),
        );
        if (stored) {
          onFrameStored();
        }
      } catch (error, stackTrace) {
        if (failureReports >= _maxMarkerImageFailureReports) {
          return;
        }
        failureReports++;
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: error,
            stack: stackTrace,
            library: 'FlutterFlow Google Map',
            context: ErrorDescription(
              'while decoding a Google Map marker image',
            ),
          ),
        );
      }
    },
    onError: (_, __) => cache.fail(request),
  );
  if (cache.trackListener(request, () => stream.removeListener(listener))) {
    stream.addListener(listener);
  }
}

/// The provider [image] is loaded through.
///
/// Assets come from the bundle. A network image is served from the shared disk
/// cache unless it opted out, so artwork that changed behind a stable URL is
/// refetched on the next launch. Within a session the decoded bitmap is still
/// held by [MarkerBitmapCache] and Flutter's own image cache.
ImageProvider<Object> markerImageProvider(MarkerImage image) {
  return switch (image) {
    MarkerImage(isAssetImage: true) => Image.asset(image.imagePath).image,
    MarkerImage(cached: true) => CachedNetworkImageProvider(image.imagePath),
    _ => NetworkImage(image.imagePath),
  };
}

/// Runs [callback] while owning [imageInfo], then releases its native image.
///
/// Every [ImageStreamListener] success receives an owned [ImageInfo] clone.
/// Removing the listener does not dispose that clone, so all exit paths must
/// release it explicitly.
@visibleForTesting
Future<T> withOwnedImageInfo<T>(
  ImageInfo img,
  Future<T> Function() callback,
) async {
  try {
    return await callback();
  } finally {
    img.dispose();
  }
}

/// Decoded marker bitmaps, plus the plain colored pin.
///
/// Split out from the map state so its behaviour can be exercised directly:
/// the state itself cannot be built in a test without a platform view.
class MarkerBitmapCache {
  MarkerBitmapCache({this.animateFrames = !kIsWeb});

  /// Frames an image may fail in a row before its stream is let go.
  static const _maxFrameFailures = 3;

  /// Whether a stored frame keeps its stream attached so the frames after it
  /// can replace it, which is what makes an animated marker move.
  ///
  /// Off on web: google_maps_flutter_web turns every distinct bitmap into an
  /// object URL and never revokes it for markers, so a frame per tick would
  /// leak a Blob per tick for as long as the map is open. Web keeps drawing
  /// the first frame, as it does today.
  final bool animateFrames;

  final Map<MarkerImage, BitmapDescriptor> _images = {};

  /// Generation of the live request for each image, held for as long as its
  /// stream may still deliver frames. An animated image keeps delivering them
  /// after the first, so this outlives the first decode.
  final Map<MarkerImage, int> _liveRequests = {};

  /// Generation of the frame being encoded right now, per image.
  final Map<MarkerImage, int> _decoding = {};

  /// Frames each image has failed in a row, cleared by one that works.
  final Map<MarkerImage, int> _frameFailures = {};

  /// The request whose frame each image is currently drawing. A bitmap kept
  /// from an earlier subscription must not read as this one having drawn.
  final Map<MarkerImage, int> _drawnBy = {};

  /// Images not currently producing usable frames. They keep the bitmap they
  /// last drew, so the marker holds its final frame rather than dropping back
  /// to a plain pin, and [retain] subscribes them again. Cleared by the next
  /// frame that decodes.
  final Set<MarkerImage> _failed = {};
  final Map<MarkerImage, _MarkerBitmapListener> _listeners = {};
  int _nextGeneration = 0;
  GoogleMarkerColor? _color;
  BitmapDescriptor? _colored;

  /// The plain pin for [color], rebuilt only when the color changes.
  ///
  /// BitmapDescriptor has no value equality and Marker compares its icon, so
  /// returning a new instance per call would make every marker look changed on
  /// every rebuild and push a full update over the platform channel.
  BitmapDescriptor colorDescriptor(GoogleMarkerColor color) {
    if (_colored == null || _color != color) {
      _color = color;
      _colored = BitmapDescriptor.defaultMarkerWithHue(
        googleMarkerColorMap[color]!,
      );
    }
    return _colored!;
  }

  BitmapDescriptor? operator [](MarkerImage image) => _images[image];

  bool contains(MarkerImage image) => _images.containsKey(image);

  int get length => _images.length;

  /// Drops bitmaps no longer needed and returns newly required images to
  /// decode. Images already decoding are not returned a second time, except
  /// where a failure marked them for a fresh subscription.
  List<MarkerBitmapRequest> retain(Set<MarkerImage> required) {
    _listeners.keys
        .where((image) => !required.contains(image))
        .toList()
        .forEach(_releaseCurrentListener);
    _images.removeWhere((image, _) => !required.contains(image));
    _liveRequests.removeWhere((image, _) => !required.contains(image));
    _decoding.removeWhere((image, _) => !required.contains(image));
    _frameFailures.removeWhere((image, _) => !required.contains(image));
    _drawnBy.removeWhere((image, _) => !required.contains(image));
    _failed.removeWhere((image) => !required.contains(image));
    final requests = <MarkerBitmapRequest>[];
    for (final image in required) {
      final isLive = _liveRequests.containsKey(image);
      final hasBitmap = _images.containsKey(image);
      // A marked image is subscribed again even while a stream is attached.
      // That stream has either failed outright or has yet to yield a usable
      // frame, and a fresh subscription is the only way back for a still
      // image, which has no later frame to recover on.
      if (_failed.contains(image) || (!isLive && !hasBitmap)) {
        _releaseCurrentListener(image);
        final request = MarkerBitmapRequest(image, ++_nextGeneration);
        _liveRequests[image] = request.generation;
        _failed.remove(image);
        _decoding.remove(image);
        _frameFailures.remove(image);
        requests.add(request);
      }
    }
    return requests;
  }

  /// Owns the listener for an in-flight decode. Returns false when the image
  /// was pruned before its post-frame decode began.
  bool trackListener(MarkerBitmapRequest request, VoidCallback cancel) {
    if (!_isCurrent(request)) {
      return false;
    }
    _releaseCurrentListener(request.image);
    _listeners[request.image] = _MarkerBitmapListener(
      request.generation,
      cancel,
    );
    return true;
  }

  /// Detaches this request's image stream, ending any animation it drives.
  ///
  /// A stale request must not release a newer listener for the same image.
  bool releaseListener(MarkerBitmapRequest request) {
    final listener = _listeners[request.image];
    if (listener?.generation != request.generation) {
      return false;
    }
    _listeners.remove(request.image);
    listener!.cancel();
    return true;
  }

  /// Stores a decoded frame, unless the image stopped being needed while it
  /// was decoding or a newer request replaced this one.
  ///
  /// Where [animateFrames] is set the request stays live and its stream stays
  /// attached, because an animated image delivers every later frame through
  /// that same stream and each one replaces the bitmap the markers draw with.
  /// Otherwise the first frame is the only one wanted and the stream is let
  /// go here.
  bool store(
    MarkerBitmapRequest request,
    BitmapDescriptor descriptor,
    Set<MarkerImage> required,
  ) {
    if (!_isCurrent(request)) {
      return false;
    }
    if (!required.contains(request.image)) {
      releaseListener(request);
      _liveRequests.remove(request.image);
      _images.remove(request.image);
      _drawnBy.remove(request.image);
      return false;
    }
    _images[request.image] = descriptor;
    _drawnBy[request.image] = request.generation;
    _failed.remove(request.image);
    _frameFailures.remove(request.image);
    if (!animateFrames) {
      releaseListener(request);
      _liveRequests.remove(request.image);
    }
    return true;
  }

  /// Records one frame that could not be decoded.
  ///
  /// The stream stays attached, because it is healthy and the frame after this
  /// one usually is too — tearing it down here would stop an animation dead
  /// over a single bad frame. An image with no further frames coming is left
  /// marked for [retain] to subscribe again.
  void _frameFailed(MarkerBitmapRequest request) {
    if (!_isCurrent(request)) {
      return;
    }
    final failures = (_frameFailures[request.image] ?? 0) + 1;
    _frameFailures[request.image] = failures;
    // Nothing drawn yet means there is no animation to keep alive and no
    // reason to expect another frame — a still image only ever has one. A run
    // this long means the image will not decode at all, and re-encoding it for
    // every frame it delivers, for as long as the map is open, is pure waste.
    // Anything short of that is left to recover on its own next frame.
    final hasDrawn = _drawnBy[request.image] == request.generation;
    if (!hasDrawn || failures >= _maxFrameFailures) {
      fail(request);
    }
  }

  /// Marks the whole image as failed: its stream reported an error and will
  /// deliver nothing more.
  ///
  /// The bitmap already on screen stays; [retain] subscribes again on the next
  /// marker-image update.
  bool fail(MarkerBitmapRequest request) {
    if (!_isCurrent(request)) {
      return false;
    }
    releaseListener(request);
    _liveRequests.remove(request.image);
    _decoding.remove(request.image);
    _frameFailures.remove(request.image);
    _failed.add(request.image);
    return true;
  }

  /// Decodes and stores one request while keeping every failure retryable.
  Future<bool> resolveBitmap(
    MarkerBitmapRequest request, {
    required Future<BitmapDescriptor?> Function() decode,
    required Set<MarkerImage> Function() requiredImages,
  }) async {
    if (!_beginDecode(request)) {
      return false;
    }
    try {
      final descriptor = await decode();
      if (descriptor == null) {
        _frameFailed(request);
        return false;
      }
      return store(request, descriptor, requiredImages());
    } catch (_) {
      _frameFailed(request);
      rethrow;
    } finally {
      _endDecode(request);
    }
  }

  /// Claims the decode slot for this image, or reports one already in flight.
  ///
  /// An animated image can deliver its next frame while the current one is
  /// still encoding. Dropping that frame keeps the stored bitmaps in frame
  /// order and holds the encodes in flight to one per image.
  ///
  /// This bounds the encoding, though not the fan-out behind it: every stored
  /// frame repaints each marker drawing that image and re-sends its bitmap to
  /// the platform, and nothing here throttles the animation when the map is
  /// off screen.
  ///
  /// A dropped frame is simply replaced by the one after it. Encoding a marker
  /// bitmap is far quicker than a frame interval, so this is rare, and the
  /// cost when it happens is that a GIF which does not repeat can come to rest
  /// one frame early.
  bool _beginDecode(MarkerBitmapRequest request) {
    if (!_isCurrent(request) || _decoding.containsKey(request.image)) {
      return false;
    }
    _decoding[request.image] = request.generation;
    return true;
  }

  void _endDecode(MarkerBitmapRequest request) {
    if (_decoding[request.image] == request.generation) {
      _decoding.remove(request.image);
    }
  }

  bool _isCurrent(MarkerBitmapRequest request) =>
      _liveRequests[request.image] == request.generation;

  void _releaseCurrentListener(MarkerImage image) {
    final listener = _listeners.remove(image);
    listener?.cancel();
  }

  void dispose() {
    for (final listener in _listeners.values.toList()) {
      listener.cancel();
    }
    _listeners.clear();
    _liveRequests.clear();
    _decoding.clear();
    _frameFailures.clear();
    _drawnBy.clear();
    _failed.clear();
    _images.clear();
  }
}

@immutable
class MarkerBitmapRequest {
  const MarkerBitmapRequest(this.image, this.generation);

  final MarkerImage image;
  final int generation;
}

class _MarkerBitmapListener {
  const _MarkerBitmapListener(this.generation, this.cancel);

  final int generation;
  final VoidCallback cancel;
}

class FlutterFlowGoogleMap extends StatefulWidget {
  const FlutterFlowGoogleMap({
    required this.controller,
    this.onCameraIdle,
    this.initialLocation,
    this.markers = const [],
    this.markerColor = GoogleMarkerColor.red,
    this.markerImage,
    this.mapType = MapType.normal,
    this.style = GoogleMapStyle.standard,
    this.initialZoom = 12,
    this.allowInteraction = true,
    this.allowZoom = true,
    this.showZoomControls = true,
    this.showLocation = true,
    this.showCompass = false,
    this.showMapToolbar = false,
    this.showTraffic = false,
    this.centerMapOnMarkerTap = false,
    // Whether the map takes gesture preference over the surrounding page.
    // This is useful when the map is inside a scrolling Widget, and you want
    // the gestures within the map to not affect the surrounding page.
    this.mapTakesGesturePreference = false,
    super.key,
  });

  final Completer<GoogleMapController> controller;
  final Function(latlng.LatLng)? onCameraIdle;
  final latlng.LatLng? initialLocation;
  final Iterable<FlutterFlowMarker> markers;
  final GoogleMarkerColor markerColor;
  final MarkerImage? markerImage;
  final MapType mapType;
  final GoogleMapStyle style;
  final double initialZoom;
  final bool allowInteraction;
  final bool allowZoom;
  final bool showZoomControls;
  final bool showLocation;
  final bool showCompass;
  final bool showMapToolbar;
  final bool showTraffic;
  final bool centerMapOnMarkerTap;
  final bool mapTakesGesturePreference;

  @override
  State<StatefulWidget> createState() => _FlutterFlowGoogleMapState();
}

class _FlutterFlowGoogleMapState extends State<FlutterFlowGoogleMap> {
  double get initialZoom => max(double.minPositive, widget.initialZoom);
  LatLng get initialPosition =>
      widget.initialLocation?.toGoogleMaps() ?? const LatLng(0.0, 0.0);

  late Completer<GoogleMapController> _controller;
  final MarkerBitmapCache _bitmaps = MarkerBitmapCache();
  late LatLng currentMapCenter;

  /// The bitmap for [marker] — its own image, else the map-wide one, falling
  /// back to the plain colored pin while an image is still decoding.
  BitmapDescriptor descriptorFor(FlutterFlowMarker marker) {
    final image = markerImageFor(widget, marker);
    final colored = _bitmaps.colorDescriptor(widget.markerColor);
    return image == null ? colored : (_bitmaps[image] ?? colored);
  }

  void initializeMarkerBitmaps() {
    final pending = _bitmaps.retain(markerImagesFor(widget));
    if (pending.isEmpty) {
      return;
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      pending.forEach(resolveMarkerBitmap);
    });
  }

  void resolveMarkerBitmap(MarkerBitmapRequest request) {
    final markerImage = request.image;
    var imageProvider = markerImageProvider(markerImage);
    if (!kIsWeb) {
      // workaround for https://github.com/flutter/flutter/issues/34657 to
      // enable marker resizing on Android and iOS.
      final targetHeight =
          (markerImage.size * MediaQuery.of(context).devicePixelRatio).toInt();
      imageProvider = ResizeImage(
        imageProvider,
        height: targetHeight,
        policy: ResizeImagePolicy.fit,
        allowUpscaling: true,
      );
    }
    final imageConfiguration = createLocalImageConfiguration(
      context,
      size: Size.square(markerImage.size),
    );
    subscribeMarkerBitmapFrames(
      imageProvider.resolve(imageConfiguration),
      _bitmaps,
      request,
      requiredImages: () => mounted ? markerImagesFor(widget) : const {},
      onFrameStored: () {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  void onCameraIdle() => widget.onCameraIdle?.call(currentMapCenter.toLatLng());

  @override
  void initState() {
    super.initState();
    currentMapCenter = initialPosition;
    _controller = widget.controller;
    initializeMarkerBitmaps();
  }

  @override
  void didUpdateWidget(FlutterFlowGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Cheap identity check first: an unchanged marker list is the common case
    // and building both sets to compare them is not free.
    if (identical(widget.markers, oldWidget.markers) &&
        widget.markerImage == oldWidget.markerImage) {
      return;
    }
    // Rebuild the bitmaps if the set of images the markers need changed.
    if (!setEquals(markerImagesFor(widget), markerImagesFor(oldWidget))) {
      initializeMarkerBitmaps();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _bitmaps.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapHasGesturePreference = widget.mapTakesGesturePreference &&
        widget.allowInteraction &&
        widget.allowZoom;

    final googleMapWidget = AbsorbPointer(
      absorbing: !widget.allowInteraction,
      child: GoogleMap(
        onMapCreated: (controller) async {
          _controller.complete(controller);
          await controller.setMapStyle(googleMapStyleStrings[widget.style]);
        },
        onCameraIdle: onCameraIdle,
        onCameraMove: (position) => currentMapCenter = position.target,
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: initialZoom,
        ),
        mapType: widget.mapType,
        zoomGesturesEnabled: widget.allowZoom,
        zoomControlsEnabled: widget.showZoomControls,
        myLocationEnabled: widget.showLocation,
        compassEnabled: widget.showCompass,
        mapToolbarEnabled: widget.showMapToolbar,
        trafficEnabled: widget.showTraffic,
        markers: widget.markers
            .map(
              (m) => Marker(
                markerId: MarkerId(m.markerId),
                position: m.location.toGoogleMaps(),
                icon: descriptorFor(m),
                onTap: () async {
                  if (widget.centerMapOnMarkerTap) {
                    final controller = await _controller.future;
                    await controller.animateCamera(
                      CameraUpdate.newLatLng(m.location.toGoogleMaps()),
                    );
                    currentMapCenter = m.location.toGoogleMaps();
                    onCameraIdle();
                  }
                  await m.onTap?.call();
                },
              ),
            )
            .toSet(),
        gestureRecognizers: {
          if (mapHasGesturePreference)
            const Factory<OneSequenceGestureRecognizer>(
              EagerGestureRecognizer.new,
            ),
        },
        webGestureHandling:
            mapHasGesturePreference ? WebGestureHandling.cooperative : null,
      ),
    );

    return mapHasGesturePreference
        ? GestureDetector(
            onVerticalDragStart: (_) {},
            behavior: HitTestBehavior.opaque,
            child: googleMapWidget,
          )
        : googleMapWidget;
  }
}

extension ToGoogleMapsLatLng on latlng.LatLng {
  LatLng toGoogleMaps() => LatLng(latitude, longitude);
}

extension GoogleMapsToLatLng on LatLng {
  latlng.LatLng toLatLng() => latlng.LatLng(latitude, longitude);
}

Map<GoogleMapStyle, String> googleMapStyleStrings = {
  GoogleMapStyle.standard: '[]',
  GoogleMapStyle.silver:
      r'[{"elementType":"geometry","stylers":[{"color":"#f5f5f5"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f5f5"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#dadada"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#c9c9c9"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]}]',
  GoogleMapStyle.retro:
      r'[{"elementType":"geometry","stylers":[{"color":"#ebe3cd"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#523735"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f1e6"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#c9b2a6"}]},{"featureType":"administrative.land_parcel","elementType":"geometry.stroke","stylers":[{"color":"#dcd2be"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#ae9e90"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#93817c"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#a5b076"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#447530"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#f5f1e6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#fdfcf8"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#f8c967"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#e9bc62"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"color":"#e98d58"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.stroke","stylers":[{"color":"#db8555"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#806b63"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"transit.line","elementType":"labels.text.fill","stylers":[{"color":"#8f7d77"}]},{"featureType":"transit.line","elementType":"labels.text.stroke","stylers":[{"color":"#ebe3cd"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#dfd2ae"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#b9d3c2"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#92998d"}]}]',
  GoogleMapStyle.dark:
      r'[{"elementType":"geometry","stylers":[{"color":"#212121"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#212121"}]},{"featureType":"administrative","elementType":"geometry","stylers":[{"color":"#757575"}]},{"featureType":"administrative.country","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"administrative.land_parcel","stylers":[{"visibility":"off"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#181818"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"poi.park","elementType":"labels.text.stroke","stylers":[{"color":"#1b1b1b"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#2c2c2c"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#8a8a8a"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#373737"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#3c3c3c"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry","stylers":[{"color":"#4e4e4e"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#3d3d3d"}]}]',
  GoogleMapStyle.night:
      r'[{"elementType":"geometry","stylers":[{"color":"#242f3e"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#746855"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#242f3e"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#263c3f"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#6b9a76"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#38414e"}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#212a37"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#9ca5b3"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#746855"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#1f2835"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#f3d19c"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#2f3948"}]},{"featureType":"transit.station","elementType":"labels.text.fill","stylers":[{"color":"#d59563"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#17263c"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#515c6d"}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"color":"#17263c"}]}]',
  GoogleMapStyle.aubergine:
      r'[{"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#8ec3b9"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#1a3646"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#64779e"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"color":"#334e87"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#6f9ba5"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#023e58"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#3C7680"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#255763"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#b0d5ce"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#023e58"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#283d6a"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#3a4762"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}]',
};

Map<GoogleMarkerColor, double> googleMarkerColorMap = {
  GoogleMarkerColor.red: 0.0,
  GoogleMarkerColor.orange: 30.0,
  GoogleMarkerColor.yellow: 60.0,
  GoogleMarkerColor.green: 120.0,
  GoogleMarkerColor.cyan: 180.0,
  GoogleMarkerColor.azure: 210.0,
  GoogleMarkerColor.blue: 240.0,
  GoogleMarkerColor.violet: 270.0,
  GoogleMarkerColor.magenta: 300.0,
  GoogleMarkerColor.rose: 330.0,
};
