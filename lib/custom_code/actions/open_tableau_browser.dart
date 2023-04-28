// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

//flutter_inappwebview: ^5.7.2+3
//flutter_web_browser: ^0.17.1
//flutter_inappwebview: 5.4.0
Future openTableauBrowser(String? token, String? tableauURL) async {
  // Add your function code here!
  String browserUrl = '${tableauURL}/${token}';
  String encodedUrl = Uri.encodeFull('${tableauURL}/${token}');

  if (Platform.isAndroid) {
    final MyInAppBrowser browser = new MyInAppBrowser();

    var options = InAppBrowserClassOptions(
        crossPlatform: InAppBrowserOptions(
          hideUrlBar: false,
          hideToolbarTop: true,
        ),
        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          //disableContextMenu: false,
          //javaScriptCanOpenWindowsAutomatically: true,
        )));

    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    browser.openUrlRequest(
        urlRequest: URLRequest(url: Uri.parse(browserUrl)), options: options);
  } else {
    //iOS-specific code

    FlutterWebBrowser.openWebPage(
      url: encodedUrl,
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.black,
        preferredControlTintColor: Colors.yellow,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
        modalPresentationStyle: UIModalPresentationStyle.currentContext,
      ),
    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}
