// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as inappWebview;
import 'package:http/http.dart' as http;

//flutter_inappwebview: ^5.7.2+3
//flutter_inappwebview: 6.0.0-beta.22
//flutter_web_browser: ^0.17.1
//flutter_inappwebview: 5.4.0

Future openInAppBrowser(String? token, String? tableauURL) async {
  // Add your function code here!
  String browserUrl = '${tableauURL}/${token}';
  String encodedUrl =
      '${tableauURL!}'; //Uri.encodeFull('${tableauURL}/${token}');
  Map<String, String> headers = {'X-Application': 'ArunSawad'};

  print('tavleauUrl : ${tableauURL}');
  //if (Platform.isAndroid && isOpenAndroidBrowser!) {
  WidgetsFlutterBinding.ensureInitialized();

  final MyInAppBrowser browser = new MyInAppBrowser();
  var options;

  if (Platform.isAndroid) {
    options = inappWebview.InAppBrowserClassSettings(
      browserSettings: inappWebview.InAppBrowserSettings(
        hideUrlBar: true,
        hideToolbarTop: true,
        toolbarTopBackgroundColor: Colors.black,
        toolbarBottomBackgroundColor: Colors.white,
        hideToolbarBottom: true,
        closeButtonCaption: 'ปิด',
      ),
      webViewSettings: inappWebview.InAppWebViewSettings(
        cacheEnabled: false,
        javaScriptEnabled: true,
        allowFileAccessFromFileURLs: true,
        allowUniversalAccessFromFileURLs: true,
        javaScriptCanOpenWindowsAutomatically: true,
        useOnDownloadStart: true,
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        clearCache: true,
        useHybridComposition: true,
        clearSessionCache: true,
        cacheMode: inappWebview.CacheMode.LOAD_NO_CACHE,
        allowsInlineMediaPlayback: true,
        geolocationEnabled: true,
      ),
    );
  } else {
    options = inappWebview.InAppBrowserClassSettings(
      browserSettings: inappWebview.InAppBrowserSettings(
        hideUrlBar: true,
        hideToolbarTop: false,
        toolbarTopBackgroundColor: Colors.black,
        toolbarBottomBackgroundColor: Colors.white,
        hideToolbarBottom: true,
        closeButtonCaption: 'ปิด',
      ),
      webViewSettings: inappWebview.InAppWebViewSettings(
        cacheEnabled: false,
        javaScriptEnabled: true,
        allowFileAccessFromFileURLs: true,
        allowUniversalAccessFromFileURLs: true,
        javaScriptCanOpenWindowsAutomatically: true,
        useOnDownloadStart: true,
        // useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
        clearCache: true,
        // useHybridComposition: false,
        clearSessionCache: true,
        cacheMode: inappWebview.CacheMode.LOAD_NO_CACHE,
        allowsInlineMediaPlayback: true,
        geolocationEnabled: true,
      ),
    );
  }
  await browser.openUrlRequest(
      urlRequest: inappWebview.URLRequest(
          url: WebUri(encodedUrl), method: 'GET', headers: headers),
      settings: options);
  // await inappWebview.AndroidInAppWebViewController
  //     .setWebContentsDebuggingEnabled(true);

  // var options = inappWebview.InAppBrowserClassOptions(
  //     crossPlatform: inappWebview.InAppBrowserOptions(
  //       hideUrlBar: true,
  //       hideToolbarTop: false,
  //       toolbarTopBackgroundColor: Colors.black,
  //     ),
  //     ios: inappWebview.IOSInAppBrowserOptions(
  //       toolbarBottomBackgroundColor: Colors.white,
  //       hideToolbarBottom: true,
  //       closeButtonCaption: 'ปิด',
  //
  //
  //     ),
  //     inAppWebViewGroupOptions: inappWebview.InAppWebViewGroupOptions(
  //         crossPlatform: inappWebview.InAppWebViewOptions(
  //           cacheEnabled: false,
  //           javaScriptEnabled: true,
  //           allowFileAccessFromFileURLs: true,
  //           allowUniversalAccessFromFileURLs: true,
  //           javaScriptCanOpenWindowsAutomatically: true,
  //           useOnDownloadStart: true,
  //           useShouldOverrideUrlLoading: true,
  //           mediaPlaybackRequiresUserGesture: false,
  //           clearCache: true,
  //         ),
  //         android: inappWebview.AndroidInAppWebViewOptions(
  //           useHybridComposition: true,
  //           clearSessionCache: true,
  //           cacheMode: inappWebview.AndroidCacheMode.LOAD_NO_CACHE,
  //
  //         ),
  //         ios: inappWebview.IOSInAppWebViewOptions(
  //           allowsInlineMediaPlayback: true,
  //         )));
  //
  //   await browser.openUrlRequest(
  //       urlRequest: inappWebview.URLRequest(
  //           url: Uri.parse(encodedUrl), method: 'GET', headers: headers),
  //       options: options);

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
  //}
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future<PermissionResponse> onPermissionRequest(request) async {
    return await PermissionResponse(
        resources: request.resources, action: PermissionResponseAction.GRANT);
  }

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
  void onDownloadStartRequest(url) async {
    print('onDownload');
    print("${url.url}");
    final String _url_files = "${url.url}";

    await launchURL(_url_files);
  }

  @override
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(
      navigationAction) async {
    print("\n\nOverride5544 ${navigationAction.request.url}\n\n");
    if (navigationAction.request.url != null &&
        '${navigationAction.request.url}'.contains('tel')) {
      print('in open3CX'); // http://tel:1669/
      await open3CXAction(
          '${'${navigationAction.request.url}'.split(':').last.replaceAll('/', '')}');
      return NavigationActionPolicy
          .CANCEL; // Stop WebView from trying to open it
    }
    // await launchURL(navigationAction.request.url.toString());
    return NavigationActionPolicy.ALLOW;
  }

  @override
  void onExit() {
    print("Browser closed!");
  }

  void closeBrowserOnBackPress(BuildContext context) async {
    print("Browser Pop!");
    await close();
    Navigator.of(context).pop(); // Close the browser and go back to the app
  }
}

Future<bool> open3CXAction(String? phoneNumber) async {
  // Add your function code here!

  final url = 'sip:${Uri.encodeComponent(phoneNumber!)}';
  final urlPhone = 'tel:${Uri.encodeComponent(phoneNumber!)}';
// http://tel:1669/
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
    return true;
  } else {
    await launchUrl(Uri.parse(urlPhone));
    return true;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
