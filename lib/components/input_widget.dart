import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(50, 20, 50, 20),
            child: TextFormField(
              controller: textController,
              onChanged: (_) => EasyDebounce.debounce(
                'textController',
                Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'ใส่จำนวนตั้งแต่ 0 ขึ้นไป',
                hintText: 'ใส่จำนวนตั้งแต่ 0 ขึ้นไป',
                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).black600,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).black600,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                suffixIcon: textController!.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          textController?.clear();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.clear,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: FFButtonWidget(
            onPressed: () async {
              if (textController!.text != null && textController!.text != '') {
                setState(() =>
                    FFAppState().counterNum = int.parse(textController!.text));
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
                      setState(() => FFAppState().counterNum = 0);
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
                      setState(() => FFAppState().counterNum = 0);
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
                  setState(() => FFAppState().counterNum = 0);
                  return;
                }

                setState(() => FFAppState().counterNum = 0);
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

              setState(() => FFAppState().materialsAmount = functions
                  .updateMatAmountList(FFAppState().materialsAmount.toList(),
                      widget.index, int.parse(textController!.text))!
                  .toList());
              Navigator.pop(context);
            },
            text: 'ตกลง',
            options: FFButtonOptions(
              width: 130,
              height: 40,
              color: Color(0xFF00CB10),
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
