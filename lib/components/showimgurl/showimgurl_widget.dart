import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'showimgurl_model.dart';
export 'showimgurl_model.dart';

class ShowimgurlWidget extends StatefulWidget {
  const ShowimgurlWidget({
    super.key,
    required this.imgPath,
  });

  final String? imgPath;

  @override
  State<ShowimgurlWidget> createState() => _ShowimgurlWidgetState();
}

class _ShowimgurlWidgetState extends State<ShowimgurlWidget> {
  late ShowimgurlModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowimgurlModel());

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
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.imgPath!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ],
    );
  }
}
