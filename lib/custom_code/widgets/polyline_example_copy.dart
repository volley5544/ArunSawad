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
import 'dart:async'; // For Timer

class PolylineExampleCopy extends StatefulWidget {
  const PolylineExampleCopy({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<PolylineExampleCopy> createState() => _PolylineExampleCopyState();
}

class _PolylineExampleCopyState extends State<PolylineExampleCopy> {
  late ggmap.GoogleMapController _mapController;
  Set<ggmap.Marker> _markers = {};
  Set<ggmap.Polyline> _polylines = {};
  List<ggmap.LatLng> _polylineCoordinates = [];
  List<LatLng> _previousLatLngList = [];
  late Timer _timer;

  final String _googleApiKey =
      "AIzaSyCxgfP7r2FHQ8TZVpKcJqG5x6csoehfDlg"; // Replace with your actual API key

  @override
  void initState() {
    super.initState();
    _previousLatLngList = List.from(FFAppState().polyMapLatLngList);
    _startMonitoringChanges();
    _addMarkers();
    _drawPolyline();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startMonitoringChanges() {
    // Check for changes every 500 milliseconds
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (_hasLatLngListChanged()) {
        setState(() {
          // Update the map whenever the list changes
          _updateMap();
        });
      }
    });
  }

  bool _hasLatLngListChanged() {
    return _previousLatLngList.length !=
            FFAppState().polyMapLatLngList.length ||
        !_previousLatLngList.every((old, index) =>
            old.latitude == FFAppState().polyMapLatLngList[index].latitude &&
            old.longitude == FFAppState().polyMapLatLngList[index].longitude);
  }

  void _updateMap() {
    _previousLatLngList = List.from(FFAppState().polyMapLatLngList);

    // Clear old markers and polylines
    _markers.clear();
    _polylines.clear();
    _polylineCoordinates.clear();

    // Add new markers
    _addMarkers();

    // Draw new polyline
    _drawPolyline();

    // Update camera position if necessary
    if (_previousLatLngList.isNotEmpty) {
      _updateCameraPosition();
    }
  }

  void _addMarkers() {
    for (int i = 0; i < FFAppState().polyMapLatLngList.length; i++) {
      final location = FFAppState().polyMapLatLngList[i];
      _markers.add(
        ggmap.Marker(
          markerId: ggmap.MarkerId(i.toString()),
          position: ggmap.LatLng(location.latitude, location.longitude),
          infoWindow: ggmap.InfoWindow(
            title: 'Location ${i + 1}',
          ),
        ),
      );
    }
  }

  void _drawPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();

    for (int i = 0; i < FFAppState().polyMapLatLngList.length - 1; i++) {
      final start = FFAppState().polyMapLatLngList[i];
      final end = FFAppState().polyMapLatLngList[i + 1];

      PolylineResult polylineResult =
          await polylinePoints.getRouteBetweenCoordinates(
        _googleApiKey,
        PointLatLng(start.latitude, start.longitude),
        PointLatLng(end.latitude, end.longitude),
      );

      if (polylineResult.points.isNotEmpty) {
        _polylineCoordinates.addAll(polylineResult.points.map(
          (point) => ggmap.LatLng(point.latitude, point.longitude),
        ));
      }
    }

    _polylines.add(
      ggmap.Polyline(
        polylineId: ggmap.PolylineId("route"),
        color: Colors.blue,
        points: _polylineCoordinates,
        width: 5,
      ),
    );
  }

  void _updateCameraPosition() {
    if (FFAppState().polyMapLatLngList.isEmpty) return;

    double minLat = FFAppState()
        .polyMapLatLngList
        .map((latLng) => latLng.latitude)
        .reduce((value, element) => value < element ? value : element);
    double maxLat = FFAppState()
        .polyMapLatLngList
        .map((latLng) => latLng.latitude)
        .reduce((value, element) => value > element ? value : element);
    double minLng = FFAppState()
        .polyMapLatLngList
        .map((latLng) => latLng.longitude)
        .reduce((value, element) => value < element ? value : element);
    double maxLng = FFAppState()
        .polyMapLatLngList
        .map((latLng) => latLng.longitude)
        .reduce((value, element) => value > element ? value : element);

    _mapController.animateCamera(
      ggmap.CameraUpdate.newLatLngBounds(
        ggmap.LatLngBounds(
          southwest: ggmap.LatLng(minLat, minLng),
          northeast: ggmap.LatLng(maxLat, maxLng),
        ),
        100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ggmap.GoogleMap(
            onMapCreated: (controller) {
              _mapController = controller;
              _updateCameraPosition();
            },
            initialCameraPosition: ggmap.CameraPosition(
              target: FFAppState().polyMapLatLngList.isNotEmpty
                  ? ggmap.LatLng(
                      FFAppState().polyMapLatLngList.first.latitude,
                      FFAppState().polyMapLatLngList.first.longitude,
                    )
                  : ggmap.LatLng(0, 0),
              zoom: 12,
            ),
            mapType: ggmap.MapType.normal,
            markers: _markers,
            polylines: _polylines,
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                if (FFAppState().polyMapLatLngList.isNotEmpty) {
                  _mapController.animateCamera(
                    ggmap.CameraUpdate.newLatLng(
                      ggmap.LatLng(
                        FFAppState().polyMapLatLngList.first.latitude,
                        FFAppState().polyMapLatLngList.first.longitude,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('No locations available')),
                  );
                }
              },
              child: Icon(Icons.my_location),
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
