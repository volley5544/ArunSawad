import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'poly_map_widget_component_model.dart';
export 'poly_map_widget_component_model.dart';

class PolyMapWidgetComponentWidget extends StatefulWidget {
  const PolyMapWidgetComponentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final List<String>? parameter1;
  final List<String>? parameter2;
  final List<String>? parameter3;

  @override
  State<PolyMapWidgetComponentWidget> createState() =>
      _PolyMapWidgetComponentWidgetState();
}

class _PolyMapWidgetComponentWidgetState
    extends State<PolyMapWidgetComponentWidget> {
  late PolyMapWidgetComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PolyMapWidgetComponentModel());

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
      child: custom_widgets.PolylineExample(
        width: double.infinity,
        height: double.infinity,
        locations: functions.makeLatLngList(
            widget!.parameter1?.toList(), widget!.parameter2?.toList())!,
        times: widget!.parameter3!,
      ),
    );
  }
}
