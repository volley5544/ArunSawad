// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../flutter_flow/flutter_flow_util.dart' as flowggmap;

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart' as ggmap;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

class DrawCircleMap extends StatefulWidget {
  const DrawCircleMap({
    Key? key,
    this.width,
    this.height,
    this.latitude,
    this.longitude,
    this.radiusLo,
    this.currentLoLat,
    this.currentLoLng,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? latitude;
  final double? longitude;
  final double? radiusLo;
  final double? currentLoLat;
  final double? currentLoLng;
  @override
  _DrawCircleMapState createState() => _DrawCircleMapState();
}

class _DrawCircleMapState extends State<DrawCircleMap> {
  //ggmap.LatLng lat = DrawCircleMap().location!;

  final Completer<ggmap.GoogleMapController> _controller =
      Completer<ggmap.GoogleMapController>();

  // Set<Circle> circles = Set.from([
  //   Circle(
  //     circleId: CircleId("1"),
  //     center: ggmap.LatLng(widget.latitude!, widget.longitude!),
  //     fillColor: Colors.blue.shade200.withOpacity(0.3),
  //     strokeColor: Colors.blue.shade50.withOpacity(0.1),
  //     radius: 70,
  //   )
  // ]);
  // Set<Marker> marker() {
  //   return <Marker>[
  //     Marker(
  //       position: ggmap.LatLng(13.8890922, 100.5755919),
  //       markerId: MarkerId("1"),
  //     )
  //   ].toSet();
  // }
  // Future<void> moveCamera() async {
  //   final ggmap.GoogleMapController controller = await _controller.future;
  //   controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //     target: ggmap.LatLng(widget.latitude!, widget.longitude!),
  //     zoom: 18,
  //   )));
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   moveCamera();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ggmap.GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: ggmap.LatLng(widget.currentLoLat!, widget.currentLoLng!),
        zoom: 18,
      ),
      onMapCreated: (ggmap.GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: <Marker>[
        Marker(
          position: ggmap.LatLng(widget.latitude!, widget.longitude!),
          markerId: MarkerId("1"),
        )
      ].toSet(),
      onCameraMove: null,
      circles: Set.from([
        Circle(
          circleId: CircleId("1"),
          center: ggmap.LatLng(widget.latitude!, widget.longitude!),
          fillColor: Colors.blue.shade200.withOpacity(0.3),
          strokeColor: Colors.blue.shade50.withOpacity(0.1),
          radius: widget.radiusLo!,
        )
      ]),
    ));
  }
}
