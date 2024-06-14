import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_controller_component_model.dart';
export 'page_controller_component_model.dart';

class PageControllerComponentWidget extends StatefulWidget {
  const PageControllerComponentWidget({super.key});

  @override
  State<PageControllerComponentWidget> createState() =>
      _PageControllerComponentWidgetState();
}

class _PageControllerComponentWidgetState
    extends State<PageControllerComponentWidget> {
  late PageControllerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageControllerComponentModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!FFAppState().previousButtonVisible) Spacer(),
          if (!FFAppState().previousButtonVisible) Spacer(),
          if (FFAppState().previousButtonVisible)
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.choiceChipsValueController?.value = ['1'];
                    });
                    FFAppState().previousButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'previous_button',
                            FFAppState().maxPage)!;
                    FFAppState().nextButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'next_button',
                            FFAppState().maxPage)!;
                    setState(() {});
                  },
                  child: FaIcon(
                    FontAwesomeIcons.fastBackward,
                    color: Color(0xFF2555FF),
                    size: 24.0,
                  ),
                ),
              ),
            ),
          if (FFAppState().previousButtonVisible)
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.choiceChipsValueController?.value = [
                        ((int currentPage) {
                          return '${currentPage - 1}';
                        }(functions.stringToInteger(_model.choiceChipsValue)))
                      ];
                    });
                    FFAppState().previousButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'previous_button',
                            FFAppState().maxPage)!;
                    FFAppState().nextButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'next_button',
                            FFAppState().maxPage)!;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          if (FFAppState().leadID.length > 0)
            Expanded(
              flex: 6,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowChoiceChips(
                  options: FFAppState()
                      .pageSelectionList
                      .map((label) => ChipData(label))
                      .toList(),
                  onChanged: (val) async {
                    setState(() => _model.choiceChipsValue = val?.firstOrNull);
                    FFAppState().reportItemIndexList = functions
                        .setReportItemIndexList(_model.choiceChipsValue)!
                        .toList()
                        .cast<int>();
                    setState(() {});
                    FFAppState().pageSelectionList = functions
                        .generate5CurrentPageNumber(
                            _model.choiceChipsValue, FFAppState().maxPage)!
                        .toList()
                        .cast<String>();
                    setState(() {});
                    FFAppState().previousButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'previous_button',
                            FFAppState().maxPage)!;
                    FFAppState().nextButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'next_button',
                            FFAppState().maxPage)!;
                    setState(() {});
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFF0039E3),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 8.0,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  chipSpacing: 5.0,
                  rowSpacing: 5.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ['1'],
                  ),
                  wrapped: true,
                ),
              ),
            ),
          if (FFAppState().nextButtonVisible)
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.choiceChipsValueController?.value = [
                        ((int currentPage) {
                          return '${currentPage + 1}';
                        }(functions.stringToInteger(_model.choiceChipsValue)))
                      ];
                    });
                    FFAppState().previousButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'previous_button',
                            FFAppState().maxPage)!;
                    FFAppState().nextButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'next_button',
                            FFAppState().maxPage)!;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          if (FFAppState().nextButtonVisible)
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.choiceChipsValueController?.value = [
                        FFAppState().maxPage.toString()
                      ];
                    });
                    FFAppState().previousButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'previous_button',
                            FFAppState().maxPage)!;
                    FFAppState().nextButtonVisible =
                        functions.checkVisiblePreviousForwordButton(
                            _model.choiceChipsValue,
                            'next_button',
                            FFAppState().maxPage)!;
                    setState(() {});
                  },
                  child: FaIcon(
                    FontAwesomeIcons.fastForward,
                    color: Color(0xFF2555FF),
                    size: 24.0,
                  ),
                ),
              ),
            ),
          if (!FFAppState().nextButtonVisible) Spacer(),
          if (!FFAppState().nextButtonVisible) Spacer(),
        ],
      ),
    );
  }
}
