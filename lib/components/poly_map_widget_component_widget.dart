import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'poly_map_widget_component_model.dart';
export 'poly_map_widget_component_model.dart';

class PolyMapWidgetComponentWidget extends StatefulWidget {
  const PolyMapWidgetComponentWidget({super.key});

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
        locations: [],
        times: [],
      ),
    );
  }
}
