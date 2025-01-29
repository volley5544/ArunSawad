import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'image_or_pdf_viewer_component_model.dart';
export 'image_or_pdf_viewer_component_model.dart';

class ImageOrPdfViewerComponentWidget extends StatefulWidget {
  const ImageOrPdfViewerComponentWidget({
    super.key,
    required this.fileType,
    required this.fileByte,
    required this.fileName,
  });

  final String? fileType;
  final FFUploadedFile? fileByte;
  final String? fileName;

  @override
  State<ImageOrPdfViewerComponentWidget> createState() =>
      _ImageOrPdfViewerComponentWidgetState();
}

class _ImageOrPdfViewerComponentWidgetState
    extends State<ImageOrPdfViewerComponentWidget> {
  late ImageOrPdfViewerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageOrPdfViewerComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_outlined,
                            color: Color(0xFFFF0000),
                            size: 40.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        valueOrDefault<String>(
                          widget!.fileName,
                          'file_name',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 1.0,
                        height: 1.0,
                        decoration: BoxDecoration(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (widget!.fileType == 'image') {
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: Image.memory(
                              widget!.fileByte?.bytes ?? Uint8List.fromList([]),
                              fit: BoxFit.contain,
                            ),
                            allowRotation: false,
                            tag: 'imageTag',
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'imageTag',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.memory(
                          widget!.fileByte?.bytes ?? Uint8List.fromList([]),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                } else {
                  return FlutterFlowPdfViewer(
                    fileBytes: widget!.fileByte?.bytes,
                    width: double.infinity,
                    height: double.infinity,
                    horizontalScroll: false,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
