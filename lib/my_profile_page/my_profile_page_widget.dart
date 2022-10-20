import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class MyProfilePageWidget extends StatefulWidget {
  const MyProfilePageWidget({Key? key}) : super(key: key);

  @override
  _MyProfilePageWidgetState createState() => _MyProfilePageWidgetState();
}

class _MyProfilePageWidgetState extends State<MyProfilePageWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserLogRecord? createdUserLogProfile;
  bool? checkLatLngProfile;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      setState(() => FFAppState().QRCodeLink =
          'https://lead.srisawadpower.com/survey/regis/${FFAppState().employeeID}');
      checkLatLngProfile = await actions.a8(
        currentUserLocationValue,
      );
      if (!checkLatLngProfile!) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ระบบ'),
              content: Text('กรุณาเปิดGPS ก่อนทำรายการ'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.goNamed('SuperAppPage');

        return;
      }

      final userLogCreateData = createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Profile',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      );
      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(userLogCreateData);
      createdUserLogProfile = UserLogRecord.getDocumentFromData(
          userLogCreateData, userLogRecordReference);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/BG2.jpg',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: StreamBuilder<List<UserCustomRecord>>(
                      stream: queryUserCustomRecord(
                        queryBuilder: (userCustomRecord) =>
                            userCustomRecord.where('employee_id',
                                isEqualTo: FFAppState().employeeID != ''
                                    ? FFAppState().employeeID
                                    : null),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<UserCustomRecord> stackUserCustomRecordList =
                            snapshot.data!;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final stackUserCustomRecord =
                            stackUserCustomRecordList.isNotEmpty
                                ? stackUserCustomRecordList.first
                                : null;
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0.9),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: CachedNetworkImage(
                                                imageUrl: stackUserCustomRecord!
                                                    .imgProfile!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: stackUserCustomRecord!
                                                  .imgProfile!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: stackUserCustomRecord!.imgProfile!,
                                        transitionOnUserGestures: true,
                                        child: Container(
                                          width: 125,
                                          height: 125,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: stackUserCustomRecord!
                                                .imgProfile!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.25, 1),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: FaIcon(
                                      FontAwesomeIcons.camera,
                                      color: Color(0xFF0039E3),
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxWidth: 1000.00,
                                        maxHeight: 1000.00,
                                        imageQuality: 70,
                                        allowPhoto: true,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() => isMediaUploading = true);
                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          isMediaUploading = false;
                                        }
                                        if (downloadUrls.length ==
                                            selectedMedia.length) {
                                          setState(() => uploadedFileUrl =
                                              downloadUrls.first);
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(context,
                                              'Failed to upload media');
                                          return;
                                        }
                                      }

                                      if (!(uploadedFileUrl != null &&
                                          uploadedFileUrl != '')) {
                                        return;
                                      }

                                      final userCustomUpdateData =
                                          createUserCustomRecordData(
                                        imgProfile: uploadedFileUrl,
                                      );
                                      await stackUserCustomRecord!.reference
                                          .update(userCustomUpdateData);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        FFAppState().profileFullName,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF0039E3),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Text(
                    functions.profileShowNickName(FFAppState().userNickname),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0039E3),
                          fontSize: 16,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.birthdayCake,
                          color: Color(0xFF0039E3),
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            dateTimeFormat(
                              'd/M/y',
                              functions
                                  .showClockIn(FFAppState().profileBirthDate),
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0039E3),
                                      fontSize: 16,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Container(
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFD57C),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: Text(
                            FFAppState().profilePositionName,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Color(0x98FFFFFF),
            ),
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 160,
                              height: 160,
                              child: custom_widgets.GenBar(
                                width: 160,
                                height: 160,
                                qrSize: 160.0,
                                qrData: FFAppState().QRCodeLink,
                                qrVersion: 3,
                                qrPadding: 15.0,
                                qrBackgroundColor: Colors.white,
                                qrForegroundColor: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'รหัสพนักงาน: ${FFAppState().employeeID}',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        'สาขา: (${FFAppState().branchCode}) ${FFAppState().profileUnitCodeName}',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      if (FFAppState().branchCode != 'HO')
                        Text(
                          'เขต: ${FFAppState().profileParentUnit}',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      if (FFAppState().branchCode != 'HO')
                        Text(
                          'ภาค: ${FFAppState().profileRegion}',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      Text(
                        'วันเริ่มงาน: ${dateTimeFormat(
                          'd/M/y',
                          functions.showClockIn(FFAppState().profileHiredDate),
                          locale: FFLocalizations.of(context).languageCode,
                        )}',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        'อายุงาน: ${FFAppState().profileServiceDuration}',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      if (FFAppState().profilePositionAge != '-')
                        Text(
                          'อายุตำแหน่ง: ${FFAppState().profilePositionAge}',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Color(0x98FFFFFF),
            ),
          ],
        ),
      ),
    );
  }
}
