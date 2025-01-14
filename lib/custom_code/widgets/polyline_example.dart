// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' as ggmap;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui; // Import for custom drawing
import 'dart:typed_data'; // For ByteData

class PolylineExample extends StatefulWidget {
  const PolylineExample({
    super.key,
    this.width,
    this.height,
    this.locations,
  });

  final double? width;
  final double? height;
  final List<LatLng>? locations;

  @override
  State<PolylineExample> createState() => _PolylineExampleState();
}

class _PolylineExampleState extends State<PolylineExample> {
  late ggmap.GoogleMapController _mapController;
  Set<ggmap.Marker> _markers = {};
  Set<ggmap.Polyline> _polylines = {};
  List<ggmap.LatLng> _polylineCoordinates = [];
  final String _googleApiKey =
      "AIzaSyCxgfP7r2FHQ8TZVpKcJqG5x6csoehfDlg"; // Replace with your actual API key

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _addMarkers();
    _drawPolyline();
  }

  void _requestPermissions() async {
    if (await Permission.location.request().isGranted) {
      print('Location Permission granted');
    } else {
      print('Location Permission denied');
    }
  }

  void _addMarkers() async {
    for (int i = 0; i < widget.locations!.length; i++) {
      final location = widget.locations![i];
      final markerLabel = 'Location ${i + 1}';
      final customMarker = await _createCustomMarker(markerLabel);

      _markers.add(
        ggmap.Marker(
          markerId: ggmap.MarkerId(i.toString()),
          position: ggmap.LatLng(location.latitude, location.longitude),
          icon: customMarker,
          onTap: () {
            _launchStreetView(location.latitude, location.longitude);
          },
        ),
      );
    }
  }

  Future<ggmap.BitmapDescriptor> _createCustomMarker(String label) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.blue;
    const double markerWidth = 120;
    const double markerHeight = 60;

    // Draw the marker background
    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, markerWidth, markerHeight),
      const Radius.circular(10),
    );
    canvas.drawRRect(rRect, paint);

    // Add text to the marker
    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: ui.TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (markerWidth - textPainter.width) / 2,
        (markerHeight - textPainter.height) / 2,
      ),
    );

    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(markerWidth.toInt(), markerHeight.toInt());
    final ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);

    return ggmap.BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  void _drawPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = [];

    for (int i = 0; i < widget.locations!.length - 1; i++) {
      final start = widget.locations![i];
      final end = widget.locations![i + 1];

      PolylineResult polylineResult =
          await polylinePoints.getRouteBetweenCoordinates(
        _googleApiKey,
        PointLatLng(start.latitude, start.longitude),
        PointLatLng(end.latitude, end.longitude),
      );

      if (polylineResult.points.isNotEmpty) {
        result.addAll(polylineResult.points);
      }
    }

    setState(() {
      _polylineCoordinates = result
          .map((point) => ggmap.LatLng(point.latitude, point.longitude))
          .toList();

      _polylines.add(
        ggmap.Polyline(
          polylineId: ggmap.PolylineId("route"),
          color: Colors.blue,
          points: _polylineCoordinates,
          width: 5,
        ),
      );
    });
  }

  void _launchStreetView(double lat, double lng) async {
    final String apiKey =
        "AIzaSyCxgfP7r2FHQ8TZVpKcJqG5x6csoehfDlg"; // Replace with your actual API key
    final String metadataUrl =
        "https://maps.googleapis.com/maps/api/streetview/metadata?location=$lat,$lng&key=$apiKey";

    try {
      final response = await http.get(Uri.parse(metadataUrl));
      if (response.statusCode == 200) {
        final metadata = json.decode(response.body);

        if (metadata['status'] == 'OK') {
          print("Street View is available for this location.");
          final streetViewUrl =
              "https://www.google.com/maps?q=&layer=c&cbll=$lat,$lng";
          if (await canLaunch(streetViewUrl)) {
            await launch(streetViewUrl);
          } else {
            throw 'Could not launch $streetViewUrl';
          }
        } else {
          print("Street View is not available. Opening Google Maps.");
          final mapsUrl = "https://www.google.com/maps?q=$lat,$lng";
          if (await canLaunch(mapsUrl)) {
            await launch(mapsUrl);
          } else {
            throw 'Could not launch $mapsUrl';
          }
        }
      } else {
        print('Failed to fetch Street View metadata: ${response.body}');
      }
    } catch (e) {
      print('Error checking Street View availability: $e');
    }
  }

  ggmap.LatLngBounds _getLatLngBounds() {
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLng = double.infinity;
    double maxLng = -double.infinity;

    for (var location in widget.locations!) {
      double lat = location.latitude;
      double lng = location.longitude;

      if (lat < minLat) minLat = lat;
      if (lat > maxLat) maxLat = lat;
      if (lng < minLng) minLng = lng;
      if (lng > maxLng) maxLng = lng;
    }

    return ggmap.LatLngBounds(
      southwest: ggmap.LatLng(minLat, minLng),
      northeast: ggmap.LatLng(maxLat, maxLng),
    );
  }

  void _updateCameraPosition() {
    ggmap.LatLngBounds bounds = _getLatLngBounds();
    _mapController.animateCamera(
      ggmap.CameraUpdate.newLatLngBounds(bounds, 100.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ggmap.GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
          _updateCameraPosition();
        },
        initialCameraPosition: ggmap.CameraPosition(
          target: widget.locations!.isNotEmpty
              ? ggmap.LatLng(
                  widget.locations!.first
                      .latitude, // Convert from ff.LatLng to ggmap.LatLng
                  widget.locations!.first.longitude,
                )
              : ggmap.LatLng(0, 0),
          zoom: 12,
        ),
        mapType: ggmap.MapType.normal,
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}
