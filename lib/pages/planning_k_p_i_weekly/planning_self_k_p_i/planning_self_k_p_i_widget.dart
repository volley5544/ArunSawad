import '/components/planning_k_p_i_component/planning_k_p_i_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'planning_self_k_p_i_model.dart';
export 'planning_self_k_p_i_model.dart';

class PlanningSelfKPIWidget extends StatefulWidget {
  const PlanningSelfKPIWidget({super.key});

  @override
  State<PlanningSelfKPIWidget> createState() => _PlanningSelfKPIWidgetState();
}

class _PlanningSelfKPIWidgetState extends State<PlanningSelfKPIWidget> {
  late PlanningSelfKPIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanningSelfKPIModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PlanningSelfKPI'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'วางแผน KPI รายอาทิต',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).displaySmall,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    'วางแผน KPI ในแต่ละวัน',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: Builder(
              builder: (context) {
                final list = FFAppState().checkinStatusColor.toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, listIndex) {
                    final listItem = list[listIndex];
                    return PlanningKPIComponentWidget(
                      key: Key('Keybnd_${listIndex}_of_${list.length}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
