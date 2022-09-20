import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  ArunSawadFirebaseUser? initialUser;
  ArunSawadFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(ArunSawadFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? BioAuthenPageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? BioAuthenPageWidget()
              : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(
                apiURL: params.getParam(
                    'apiURL', ParamType.DocumentReference, 'Key_Storage'),
              ),
            ),
            FFRoute(
              name: 'BioAuthenPage',
              path: 'bioAuthenPage',
              builder: (context, params) => BioAuthenPageWidget(),
            ),
            FFRoute(
              name: 'Dashboard',
              path: 'dashboard',
              builder: (context, params) => DashboardWidget(
                jwtToken: params.getParam('jwtToken', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CheckInPage',
              path: 'checkInPage',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => CheckInPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'SurveyPage',
              path: 'surveyPage',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => SurveyPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                description: params.getParam('description', ParamType.String),
                idCardNumber: params.getParam('idCardNumber', ParamType.String),
                customerName: params.getParam('customerName', ParamType.String),
                landmark: params.getParam('landmark', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'CollectionPage',
              path: 'collectionPage',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => CollectionPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                coordinate: params.getParam('coordinate', ParamType.String),
                idCardNumber: params.getParam('idCardNumber', ParamType.String),
                contNo: params.getParam('contNo', ParamType.String),
                customerName: params.getParam('customerName', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                recordId: params.getParam('recordId', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'MarketingPage',
              path: 'marketingPage',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => MarketingPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                coordinate: params.getParam('coordinate', ParamType.String),
                branchCode: params.getParam('branchCode', ParamType.String),
                area: params.getParam('area', ParamType.String),
                detail: params.getParam('detail', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                recordId: params.getParam('recordId', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'NPApage',
              path: 'nPApage',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => NPApageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                assetId: params.getParam('assetId', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'OPSpage',
              path: 'oPSpage',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => OPSpageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                branchCode: params.getParam('branchCode', ParamType.String),
                asset: params.getParam('asset', ParamType.String),
                assetType: params.getParam('assetType', ParamType.String),
                carPlateNo: params.getParam('carPlateNo', ParamType.String),
                signboardStatus:
                    params.getParam('signboardStatus', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CheckerPage',
              path: 'checkerPage',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => CheckerPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                idCardNumber: params.getParam('idCardNumber', ParamType.String),
                contNo: params.getParam('contNo', ParamType.String),
                customerName: params.getParam('customerName', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'TimeSheetPage',
              path: 'timeSheetPage',
              builder: (context, params) => TimeSheetPageWidget(),
            ),
            FFRoute(
              name: 'ForgotPasswordPage',
              path: 'forgotPasswordPage',
              builder: (context, params) => ForgotPasswordPageWidget(),
            ),
            FFRoute(
              name: 'LeadSurveyRegisPage',
              path: 'leadSurveyRegisPage',
              builder: (context, params) => LeadSurveyRegisPageWidget(),
            ),
            FFRoute(
              name: 'GenQRPage',
              path: 'genQRPage',
              builder: (context, params) => GenQRPageWidget(),
            ),
            FFRoute(
              name: 'SuccessPage',
              path: 'successPage',
              builder: (context, params) => SuccessPageWidget(),
            ),
            FFRoute(
              name: 'CheckInPageCopy',
              path: 'checkInPageCopy',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => CheckInPageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'MarketingPageCopy',
              path: 'marketingPageCopy',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
                'materialID': getDoc('material', MaterialRecord.serializer),
              },
              builder: (context, params) => MarketingPageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
                materialID: params.getParam('materialID', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'NPApageCopy',
              path: 'nPApageCopy',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => NPApageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'OPSpageCopy',
              path: 'oPSpageCopy',
              asyncParams: {
                'location1': getDoc('city', CityRecord.serializer),
              },
              builder: (context, params) => OPSpageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Builder(
                    builder: (context) => Image.asset(
                      'assets/images/splash-port-xxxhdpi.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
