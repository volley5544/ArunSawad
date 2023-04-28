import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_model.dart';
export 'input_model.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late InputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(50.0, 20.0, 50.0, 20.0),
            child: TextFormField(
              controller: _model.textController,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'ใส่จำนวนตั้งแต่ 0 ขึ้นไป',
                hintText: 'ใส่จำนวนตั้งแต่ 0 ขึ้นไป',
                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).black600,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                suffixIcon: _model.textController!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _model.textController?.clear();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: Color(0xFF757575),
                          size: 22.0,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              keyboardType: TextInputType.number,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: FFButtonWidget(
            onPressed: () async {
              if (_model.textController.text != null &&
                  _model.textController.text != '') {
                FFAppState().update(() {
                  FFAppState().counterNum =
                      int.parse(_model.textController.text);
                });
                if (FFAppState().counterNum >= 0) {
                  if (widget.index == 0) {
                    if (FFAppState().counterNum > 1) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('ระบบ'),
                            content: Text('ไม่สามารถใส่จำนวนมากกว่า 1 ได้'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      FFAppState().update(() {
                        FFAppState().counterNum = 0;
                      });
                      return;
                    }
                  } else {
                    if (FFAppState().counterNum > 99999) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('ระบบ'),
                            content:
                                Text('ไม่สามารถใส่จำนวนมากกว่า 99,999 ได้'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      FFAppState().update(() {
                        FFAppState().counterNum = 0;
                      });
                      return;
                    }
                  }
                } else {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('ระบบ'),
                        content: Text('ไม่สามารถใส่จำนวนต่ำกว่า 0 ได้'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  FFAppState().update(() {
                    FFAppState().counterNum = 0;
                  });
                  return;
                }

                FFAppState().update(() {
                  FFAppState().counterNum = 0;
                });
              } else {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('ระบบ'),
                      content: Text('โปรดใส่จำนวนอุปกรณ์'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
                return;
              }

              FFAppState().update(() {
                FFAppState().materialsAmount = functions
                    .updateMatAmountList(FFAppState().materialsAmount.toList(),
                        widget.index, int.tryParse(_model.textController.text))!
                    .toList();
              });
              Navigator.pop(context);
            },
            text: 'ตกลง',
            options: FFButtonOptions(
              width: 130.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFF00CB10),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
