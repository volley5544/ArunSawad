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

import '/flutter_flow/flutter_flow_util.dart' as ff_util;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:url_launcher/url_launcher.dart';

class RouteLocation extends StatefulWidget {
  const RouteLocation({
    super.key,
    this.width,
    this.height,
    this.listLocations,
  });

  final double? width;
  final double? height;
  final List<LatLng>? listLocations;

  @override
  State<RouteLocation> createState() => _RouteLocationState();
}

class _RouteLocationState extends State<RouteLocation> {
  late GoogleMapController mapController;
  List<Marker> markers = [];
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    if (widget.listLocations != null) {
      _createMarkers();
      if (widget.listLocations!.length > 1) {
        getPolylinePoints(widget.listLocations!);
      }
    }
  }

  void _createMarkers() {
    for (int i = 0; i < widget.listLocations!.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId('marker_$i'),
          position: widget.listLocations![i],
          infoWindow: InfoWindow(
            title: 'Location $i',
            onTap: () => _openStreetView(widget.listLocations![i]),
          ),
        ),
      );
    }
  }

  void _openStreetView(LatLng latLng) {
    String url =
        'https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=${latLng.latitude},${latLng.longitude}';
    launch(url);
  }

  Future<void> getPolylinePoints(List<LatLng> locations) async {
    PolylinePoints polylinePoints = PolylinePoints();
    for (int i = 0; i < locations.length - 1; i++) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'YOUR_GOOGLE_API_KEY', // Add your Google API key here
        PointLatLng(locations[i].latitude, locations[i].longitude),
        PointLatLng(locations[i + 1].latitude, locations[i + 1].longitude),
      );

      if (result.points.isNotEmpty) {
        polylineCoordinates.addAll(
          result.points.map((point) => LatLng(point.latitude, point.longitude)),
        );
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: widget.listLocations != null && widget.listLocations!.isNotEmpty
          ? GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: widget.listLocations![0],
                zoom: 10,
              ),
              markers: Set<Marker>.of(markers),
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: polylineCoordinates,
                  color: Colors.blue,
                  width: 4,
                ),
              },
            )
          : const Center(
              child: Text(
                'No locations provided',
                style: TextStyle(fontSize: 16),
              ),
            ),
    );
  }
}
