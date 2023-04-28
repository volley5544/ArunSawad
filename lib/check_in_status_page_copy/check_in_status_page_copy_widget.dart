import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_in_status_page_copy_model.dart';
export 'check_in_status_page_copy_model.dart';

class CheckInStatusPageCopyWidget extends StatefulWidget {
  const CheckInStatusPageCopyWidget({
    Key? key,
    this.checkinImage,
  }) : super(key: key);

  final String? checkinImage;

  @override
  _CheckInStatusPageCopyWidgetState createState() =>
      _CheckInStatusPageCopyWidgetState();
}

class _CheckInStatusPageCopyWidgetState
    extends State<CheckInStatusPageCopyWidget> {
  late CheckInStatusPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckInStatusPageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CheckInStatusPageCopy'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6500),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed('DashboardCheckin');
              },
              child: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
          title: Text(
            'เวลาเข้างาน - ออกงาน',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 10.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SelectionArea(
                                child: Text(
                              'วันที่',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                  ),
                            )),
                          ),
                          Expanded(
                            flex: 2,
                            child: SelectionArea(
                                child: Text(
                              'เวลาเข้างาน',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            )),
                          ),
                          Expanded(
                            flex: 2,
                            child: SelectionArea(
                                child: Text(
                              'เวลาออกงาน',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            )),
                          ),
                          Expanded(
                            flex: 3,
                            child: SelectionArea(
                                child: Text(
                              'สถานะ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            )),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).grayIcon,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final checkinActionStatusList =
                        FFAppState().checkinStatusDate.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: checkinActionStatusList.length,
                      itemBuilder: (context, checkinActionStatusListIndex) {
                        final checkinActionStatusListItem =
                            checkinActionStatusList[
                                checkinActionStatusListIndex];
                        return Container(
                          width: 100.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: SelectionArea(
                                      child: Text(
                                    valueOrDefault<String>(
                                      functions.showMatNameInList(
                                          FFAppState()
                                              .checkinStatusAction
                                              .toList(),
                                          checkinActionStatusListIndex),
                                      '[date]',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                        ),
                                  )),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SelectionArea(
                                    child: Text(
                                  valueOrDefault<String>(
                                    functions.showMatNameInList(
                                        FFAppState()
                                            .checkinStatusTimeOut
                                            .toList(),
                                        checkinActionStatusListIndex),
                                    '[time_in]',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
