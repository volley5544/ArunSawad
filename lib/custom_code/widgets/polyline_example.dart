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

class PolylineExample extends StatefulWidget {
  const PolylineExample({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

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

  List<Map<String, double>> locations = [
    {'lat': 12.6170045, 'lng': 98.8234899}, // Location 1
    {'lat': 12.6710678, 'lng': 98.8577337} // Location 2
    // {'lat': 13.702044, 'lng': 100.545798}, // Location 3
  ];

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _addMarkers();
    _drawPolyline();
  }

  // Request location permissions at runtime
  void _requestPermissions() async {
    if (await Permission.location.request().isGranted) {
      print('Location Permission granted');
    } else {
      print('Location Permission denied');
    }
  }

  void _addMarkers() {
    for (int i = 0; i < locations.length; i++) {
      final location = locations[i];
      _markers.add(
        ggmap.Marker(
          markerId: ggmap.MarkerId(i.toString()),
          position: ggmap.LatLng(location['lat']!, location['lng']!),
          infoWindow: ggmap.InfoWindow(title: 'Location $i'),
          onTap: () {
            _launchStreetView(location['lat']!, location['lng']!);
          },
        ),
      );
    }
  }

  void _drawPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = [];

    for (int i = 0; i < locations.length - 1; i++) {
      final start = locations[i];
      final end = locations[i + 1];

      PolylineResult polylineResult =
          await polylinePoints.getRouteBetweenCoordinates(
        _googleApiKey,
        PointLatLng(start['lat']!, start['lng']!),
        PointLatLng(end['lat']!, end['lng']!),
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
          // Street View is available
          print("Street View is available for this location.");

          // Launch Street View
          final streetViewUrl =
              "https://www.google.com/maps?q=&layer=c&cbll=$lat,$lng";
          if (await canLaunch(streetViewUrl)) {
            await launch(streetViewUrl);
          } else {
            throw 'Could not launch $streetViewUrl';
          }
        } else {
          // Street View is not available, open Google Maps instead
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

  // Function to get LatLngBounds
  ggmap.LatLngBounds _getLatLngBounds() {
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLng = double.infinity;
    double maxLng = -double.infinity;

    for (var location in locations) {
      double lat = location['lat']!;
      double lng = location['lng']!;

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

  // Update the camera position only once when everything is ready
  void _updateCameraPosition() {
    ggmap.LatLngBounds bounds = _getLatLngBounds();
    _mapController.animateCamera(
      ggmap.CameraUpdate.newLatLngBounds(bounds, 100.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Polyline and Markers")),
      body: ggmap.GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
          _updateCameraPosition(); // Update camera after map creation
        },
        initialCameraPosition: ggmap.CameraPosition(
          target: ggmap.LatLng(locations[0]['lat']!, locations[0]['lng']!),
          zoom: 12,
        ),
        mapType: ggmap.MapType.normal,
        markers: _markers,
        polylines: _polylines,
        onCameraMove: (position) {
          // Only update the camera if necessary, to avoid lag
          // Do not update camera position based on user interaction
        },
      ),
    );
  }
}
