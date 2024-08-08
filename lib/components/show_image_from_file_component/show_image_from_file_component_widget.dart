import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'show_image_from_file_component_model.dart';
export 'show_image_from_file_component_model.dart';

class ShowImageFromFileComponentWidget extends StatefulWidget {
  const ShowImageFromFileComponentWidget({
    super.key,
    required this.imgFile,
  });

  final FFUploadedFile? imgFile;

  @override
  State<ShowImageFromFileComponentWidget> createState() =>
      _ShowImageFromFileComponentWidgetState();
}

class _ShowImageFromFileComponentWidgetState
    extends State<ShowImageFromFileComponentWidget> {
  late ShowImageFromFileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowImageFromFileComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
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
                    widget!.imgFile?.bytes ?? Uint8List.fromList([]),
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
                widget!.imgFile?.bytes ?? Uint8List.fromList([]),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).primaryBtnText,
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          fillColor: Color(0x00FFFFFF),
          icon: Icon(
            Icons.close,
            color: FlutterFlowTheme.of(context).error,
            size: 24.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
