import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'find_place_page_model.dart';
export 'find_place_page_model.dart';

class FindPlacePageWidget extends StatefulWidget {
  const FindPlacePageWidget({super.key});

  @override
  State<FindPlacePageWidget> createState() => _FindPlacePageWidgetState();
}

class _FindPlacePageWidgetState extends State<FindPlacePageWidget> {
  late FindPlacePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FindPlacePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FindPlacePage'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).tertiary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FlutterFlowPlacePicker(
                  iOSGoogleMapsApiKey:
                      'AIzaSyDNtjNYdYHsg2FHT_cuzts1LeLMCjQWKwg',
                  androidGoogleMapsApiKey:
                      'AIzaSyDOACtWXC1vzqk2EikhCN0rEdhn_FMQRbk',
                  webGoogleMapsApiKey:
                      'AIzaSyBbHtyznWFezYtHsXJ7ycj_AqgRS9eRfdM',
                  onSelect: (place) async {
                    setState(() => _model.placePickerValue = place);
                  },
                  defaultText: 'Select Location',
                  icon: Icon(
                    Icons.place,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  buttonOptions: FFButtonOptions(
                    width: 200.0,
                    height: 40.0,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await _model.googleMapsController.future.then(
                      (c) => c.animateCamera(
                        CameraUpdate.newLatLng(
                            _model.placePickerValue.latLng.toGoogleMaps()),
                      ),
                    );
                  },
                  text: 'Locate On Map',
                  options: FFButtonOptions(
                    width: 200.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL(
                        'http://maps.google.com/maps?q=${functions.getUserLocation(_model.placePickerValue.latLng)}');
                  },
                  text: 'Open On Google Map',
                  options: FFButtonOptions(
                    width: 200.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: SelectionArea(
                    child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.latLng?.toString(),
                    '[lat,lng]',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SelectionArea(
                    child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.name,
                    '[name]',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SelectionArea(
                    child: Text(
                  valueOrDefault<String>(
                    _model.placePickerValue.zipCode,
                    '[zip_code]',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FlutterFlowGoogleMap(
                    controller: _model.googleMapsController,
                    onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                    initialLocation: _model.googleMapsCenter ??=
                        currentUserLocationValue!,
                    markerColor: GoogleMarkerColor.red,
                    mapType: MapType.normal,
                    style: GoogleMapStyle.standard,
                    initialZoom: 17.0,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: true,
                    showLocation: true,
                    showCompass: false,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
