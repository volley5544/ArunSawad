// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterInappwebviewWidget extends StatefulWidget {
  const FlutterInappwebviewWidget(
      {super.key, this.width, this.height, this.webUrl});

  final double? width;
  final double? height;
  final String? webUrl;

  @override
  State<FlutterInappwebviewWidget> createState() =>
      FlutterInappwebviewWidgetState();
}

class FlutterInappwebviewWidgetState extends State<FlutterInappwebviewWidget> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    print('frome');
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(children: <Widget>[
        Expanded(
          child: Container(
            child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(widget
                      .webUrl!), // https://vcall.swpfin.com:8888/self-room
                ),
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  print('shouldOverrideUrlLoading');
                  var uri = navigationAction.request.url;
                  print(uri);
                  if (uri != null && uri.scheme == "tel") {
                    try {
                      print('in tel');

                      await open3CXAction('${'${uri}'.split(':').last}');
                    } catch (e) {
                      print("Could not launch ${uri.toString()}: $e");
                    }
                    return NavigationActionPolicy
                        .CANCEL; // Stop WebView from trying to open it
                  }
                  return NavigationActionPolicy.ALLOW;
                },
                initialSettings: InAppWebViewSettings(
                    mediaPlaybackRequiresUserGesture: false,
                    useShouldOverrideUrlLoading: true,
                    clearCache: true,
                    javaScriptEnabled: true,
                    javaScriptCanOpenWindowsAutomatically: true
                    //debuggingEnabled: true,
                    ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                //on
                onDownloadStartRequest: (controller, url) async {
                  print('onDownloadWebview : ${url}');
                  await launchURL(await launchURL('${url}'));
                },
                onPermissionRequest: (controller, request) async {
                  return await PermissionResponse(
                      resources: request.resources,
                      action: PermissionResponseAction.GRANT);
                }),
          ),
        ),
      ]),
    );
  }
}

Future<bool> open3CXAction(String? phoneNumber) async {
  // Add your function code here!

  final url = 'sip:${Uri.encodeComponent(phoneNumber!)}';
  final urlPhone = 'tel:${Uri.encodeComponent(phoneNumber!)}';

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
    return true;
  } else {
    await launchUrl(Uri.parse(urlPhone));
    return true;
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
