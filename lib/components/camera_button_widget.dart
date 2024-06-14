import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'camera_button_model.dart';
export 'camera_button_model.dart';

class CameraButtonWidget extends StatefulWidget {
  const CameraButtonWidget({super.key});

  @override
  State<CameraButtonWidget> createState() => _CameraButtonWidgetState();
}

class _CameraButtonWidgetState extends State<CameraButtonWidget> {
  late CameraButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: !FFAppState().isFromTimesheetPage,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              var _shouldSetState = false;
              HapticFeedback.mediumImpact();
              if (FFAppState().imgURL.length >= 5) {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        title: Text('ระบบ'),
                        content:
                            Text('ไม่สามารถUploadรูปเพิ่มได้ (สูงสุด5รูป)'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                if (_shouldSetState) setState(() {});
                return;
              }
              final selectedMedia = await selectMediaWithSourceBottomSheet(
                context: context,
                imageQuality: 75,
                allowPhoto: true,
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                textColor: Color(0xFFB71C1C),
                pickerFontFamily: 'Raleway',
              );
              if (selectedMedia != null &&
                  selectedMedia.every(
                      (m) => validateFileFormat(m.storagePath, context))) {
                setState(() => _model.isDataUploading = true);
                var selectedUploadedFiles = <FFUploadedFile>[];

                try {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  selectedUploadedFiles = selectedMedia
                      .map((m) => FFUploadedFile(
                            name: m.storagePath.split('/').last,
                            bytes: m.bytes,
                            height: m.dimensions?.height,
                            width: m.dimensions?.width,
                            blurHash: m.blurHash,
                          ))
                      .toList();
                } finally {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  _model.isDataUploading = false;
                }
                if (selectedUploadedFiles.length == selectedMedia.length) {
                  setState(() {
                    _model.uploadedLocalFile = selectedUploadedFiles.first;
                  });
                  showUploadMessage(context, 'Success!');
                } else {
                  setState(() {});
                  showUploadMessage(context, 'Failed to upload data');
                  return;
                }
              }

              _model.uploadFirebaseStorageAction =
                  await actions.uploadFileFirebaseStorage(
                'BranchView',
                _model.uploadedLocalFile,
              );
              _shouldSetState = true;
              if (!(_model.uploadFirebaseStorageAction != null &&
                  _model.uploadFirebaseStorageAction != '')) {
                Navigator.pop(context);
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content:
                            Text('ไม่สามารถอัพโหลดรูปได้ กรุณาลองอีกครั้ง'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                if (_shouldSetState) setState(() {});
                return;
              }
              FFAppState().addToImgURL(functions
                  .stringToImgPath(_model.uploadFirebaseStorageAction)!);
              FFAppState().update(() {});
              if (_shouldSetState) setState(() {});
            },
            child: FaIcon(
              FontAwesomeIcons.camera,
              color: Color(0xFBFFFFFF),
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
