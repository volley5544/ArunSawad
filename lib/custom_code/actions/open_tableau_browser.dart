// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as inappWebview;
import 'package:flutter_web_browser/flutter_web_browser.dart' as webBrowser;
import 'package:http/http.dart' as http;

//flutter_inappwebview: ^5.7.2+3
//flutter_inappwebview: 6.0.0-beta.22
//flutter_web_browser: ^0.17.1
//flutter_inappwebview: 5.4.0

Future openTableauBrowser(
    String? token, String? tableauURL, bool? isOpenAndroidBrowser) async {
  // Add your function code here!
  String browserUrl = '${tableauURL}/${token}';
  String encodedUrl = Uri.encodeFull('${tableauURL}/${token}');
  Map<String, String> headers = {'X-Application': 'ArunSawad'};

  if (Platform.isAndroid && isOpenAndroidBrowser!) {
    WidgetsFlutterBinding.ensureInitialized();

    final MyInAppBrowser browser = new MyInAppBrowser();
    await inappWebview.AndroidInAppWebViewController
        .setWebContentsDebuggingEnabled(true);

    var options = inappWebview.InAppBrowserClassOptions(
        crossPlatform: inappWebview.InAppBrowserOptions(
          hideUrlBar: true,
          hideToolbarTop: true,
        ),
        inAppWebViewGroupOptions: inappWebview.InAppWebViewGroupOptions(
            crossPlatform: inappWebview.InAppWebViewOptions(
          javaScriptEnabled: true,
          allowFileAccessFromFileURLs: true,
          allowUniversalAccessFromFileURLs: true,
          javaScriptCanOpenWindowsAutomatically: true,
          useOnDownloadStart: true,
        )));

    await browser.openUrlRequest(
        urlRequest: inappWebview.URLRequest(
            url: Uri.parse(encodedUrl), method: 'GET', headers: headers),
        options: options);

    // use here
    // final ChromeSafariBrowser browser = ChromeSafariBrowser();

    // await browser.open(
    //     url: Uri.parse(encodedUrl),
    //     options: ChromeSafariBrowserClassOptions(
    //         android: AndroidChromeCustomTabsOptions(
    //       shareState: CustomTabsShareState.SHARE_STATE_OFF,
    //       showTitle: false,
    //       toolbarBackgroundColor: Colors.red,
    //       enableUrlBarHiding: true,
    //       isSingleInstance: false,
    //       isTrustedWebActivity: false,
    //       keepAliveEnabled: true,
    //       //shareState: SHARE_STATE_OFF,
    //       // hideToolbarTop: true,
    //       // hideUrlBar: true,
    //     )));

    // not use here
    // await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    // final MyInAppBrowser browser = new MyInAppBrowser();
    // // await browser.openUrlRequest(
    // //     urlRequest: URLRequest(url: WebUri.uri(Uri.parse(encodedUrl))),
    // //     settings: InAppBrowserClassSettings(
    // //       browserSettings: InAppBrowserSettings(
    // //         hideUrlBar: true,
    // //         hideToolbarTop: true,
    // //       ),
    // //     ));

    // await browser.openUrlRequest(
    //     urlRequest: URLRequest(url: Uri.parse(encodedUrl)),
    //     options: InAppBrowserClassOptions(
    //       crossPlatform: InAppBrowserOptions(
    //         hideUrlBar: true,
    //         hideToolbarTop: true,
    //       ),
    //     ));

    // inAppWebViewGroupOptions:
    // InAppWebViewGroupOptions(
    //     crossPlatform: InAppWebViewOptions(
    //   javaScriptEnabled: true,
    //   //disableContextMenu: false,
    //   //javaScriptCanOpenWindowsAutomatically: true,
    // ));

    //await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    //final MyInAppBrowser browser = new MyInAppBrowser();

    // await browser.openUrlRequest(
    //   urlRequest: URLRequest(
    //       url: Uri(
    //           "https://pt.swpfin.com/ssw_mis/mis/tb/mb/EmployeeInsurancePerformance/Top_10_Sales/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80My4yNDkuMTExLjIxOjgwODhcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODcwMDk0MDMsIm5iZiI6MTY4NzAwOTQwMywianRpIjoidkZNVkRtcDh2RDh2WlBXOCIsInN1YiI6Mzk4NjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.I55TRV7sYlGy3t-oRDLv686R2p2WRQIElF2FsKEEAtI")),
    //   settings: InAppBrowserClassSettings(
    //     browserSettings: InAppBrowserSettings(
    //         toolbarTopBackgroundColor: Colors.red,
    //         presentationStyle: ModalPresentationStyle.POPOVER,
    //         hideToolbarTop: true,
    //         hideUrlBar: true),
    //     webViewSettings: InAppWebViewSettings(
    //       // useShouldOverrideUrlLoading: false,
    //       // useOnLoadResource: false,
    //       // isElementFullscreenEnabled: true,
    //       // allowUniversalAccessFromFileURLs: true,
    //       // allowFileAccessFromFileURLs: true,
    //       // disableContextMenu: true,
    //       // javaScriptCanOpenWindowsAutomatically: true,
    //       javaScriptEnabled: true,
    //       // allowContentAccess: true,
    //       // allowFileAccess: true,
    //       // clearCache: true,
    //       // disabledActionModeMenuItems: ActionModeMenuItem.MENU_ITEM_NONE,
    //     ),
    // ),
    //);
  } else {
    //iOS-specific code

    // http.Response response =
    //     await http.get(Uri.parse(encodedUrl), headers: headers);
//response.request!.url.toString(),

    await webBrowser.FlutterWebBrowser.openWebPage(
        url: encodedUrl,
        safariVCOptions: webBrowser.SafariViewControllerOptions(
          barCollapsingEnabled: true,
          preferredBarTintColor: Colors.black,
          preferredControlTintColor: Colors.yellow,
          dismissButtonStyle:
              webBrowser.SafariViewControllerDismissButtonStyle.close,
          modalPresentationCapturesStatusBarAppearance: true,
          modalPresentationStyle:
              webBrowser.UIModalPresentationStyle.currentContext,
        ),
        customTabsOptions: const webBrowser.CustomTabsOptions(
          showTitle: false,
          urlBarHidingEnabled: true,
        ));
  }
}

class MyInAppBrowser extends inappWebview.InAppBrowser {
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
