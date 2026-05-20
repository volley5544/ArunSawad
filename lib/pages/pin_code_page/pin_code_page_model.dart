import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'pin_code_page_widget.dart' show PinCodePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PinCodePageModel extends FlutterFlowModel<PinCodePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a3] action in PinCodePage widget.
  String? androidIMEI1st;
  // Stores action output result for [Custom Action - a4] action in PinCodePage widget.
  String? iOSidentifierForVendor1st;
  // Stores action output result for [Custom Action - a1] action in PinCodePage widget.
  bool? checkDeviceLocSer;
  // Stores action output result for [Custom Action - a2] action in PinCodePage widget.
  bool? checkDeviceLocPer;
  // Stores action output result for [Custom Action - getBuildNumber] action in PinCodePage widget.
  int? getDeviceBuildNumber;
  // Stores action output result for [Custom Action - getBuildVersion] action in PinCodePage widget.
  String? deviceVersion;
  // Stores action output result for [Custom Action - checkStatusFirebase] action in PinCodePage widget.
  bool? checkFirebaseOutput;
  bool bioAuthCheckOnPageLoad = false;
  // Stores action output result for [Custom Action - a1] action in Row widget.
  bool? checkDeviceLocSerLogout;
  // Stores action output result for [Custom Action - a2] action in Row widget.
  bool? checkDeviceLocPerLogout;
  // Stores action output result for [Custom Action - a8] action in Row widget.
  bool? checkLatLngLogout;
  // Stores action output result for [Custom Action - getLocation] action in Row widget.
  LatLng? getLocationLogoutButton;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  UserLogRecord? createdUserLogLogout;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in PinCode widget.
  KeyStorage2Record? keyStorage2ApiUrlPin;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in PinCode widget.
  ApiCallResponse? getUserProfilePin;
  // Stores action output result for [Backend Call - API (getUserInsuranceLicense)] action in PinCode widget.
  ApiCallResponse? getUserInsuranceLicense;
  // Stores action output result for [Action Block - checkToken] action in PinCode widget.
  bool? checkTokenOutput;
  // Stores action output result for [Custom Action - a8] action in PinCode widget.
  bool? checkLatLngBeforeEnterApp;
  // Stores action output result for [Custom Action - getLocation] action in PinCode widget.
  LatLng? getLocationPin1;
  // Stores action output result for [Backend Call - Create Document] action in PinCode widget.
  UserLogRecord? createdUserLogLoginPin;
  // Stores action output result for [Backend Call - Create Document] action in PinCode widget.
  InsuranceNotiDataRecord? createInsuNotidadta;
  // Stores action output result for [Backend Call - Create Document] action in PinCode widget.
  NotificationRecord? createInsuPageNotification;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  KeyStorage2Record? keyStorage2ApiUrlBio;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in IconButton widget.
  ApiCallResponse? getUserProfileBio;
  // Stores action output result for [Backend Call - API (getUserInsuranceLicense)] action in IconButton widget.
  ApiCallResponse? getUserInsuranceLicenseBio;
  // Stores action output result for [Custom Action - a8] action in IconButton widget.
  bool? checkLatLngBeforeEnterAppBio;
  // Stores action output result for [Custom Action - getLocation] action in IconButton widget.
  LatLng? getLocationBioAuthen1;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  UserLogRecord? createdUserLogLoginPinCopy;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  InsuranceNotiDataRecord? createInsuNotidadta2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  NotificationRecord? createInsuPageNotificationBio;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks.
  Future getUserProfilePinPage(BuildContext context) async {
    SplashPageImgRecord? querySplashPageImage;
    SplashPageHolidayImgRecord? querySplashPageHoliday;
    UserCustomRecord? queryProfile;
    AuthorizationRecord? queryKpiMenuAuthorize;
    KeyStorageRecord? keyStorage1ApiUrlActionBloc;
    KeyStorage2Record? keyStorage2ApiUrlActionBloc;
    ApiCallResponse? getUserProfilePinActionBloc;
    UrlLinkStorageRecord? queryLeadUrlLink;
    ApiCallResponse? getUserInsuranceLicenseActionBloc;
    bool? checkLatLngActionBloc;
    LatLng? getLocationPinActionBloc;
    UserLogRecord? createdUserLogLoginPinActionBloc;
    InsuranceNotiDataRecord? queryInsuranceNotiData;
    InsuranceLicenseDataRecord? queryInsuranceLicenseData;
    InsuranceNotiDataRecord? createInsuNotidadta;
    NotificationRecord? createInsuPageNotification;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          ),
        );
      },
    );

    querySplashPageImage = await querySplashPageImgRecordOnce(
      queryBuilder: (splashPageImgRecord) => splashPageImgRecord.where(
        'day',
        isEqualTo: functions.checkDateWeekDay(getCurrentTimestamp),
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    querySplashPageHoliday = await querySplashPageHolidayImgRecordOnce(
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    queryProfile = await queryUserCustomRecordOnce(
      queryBuilder: (userCustomRecord) => userCustomRecord.where(
        'employee_id',
        isEqualTo: FFAppState().employeeID,
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    queryKpiMenuAuthorize = await AuthorizationRecord.getDocumentOnce(
        FFAppState().authorizeationKpiMenuDocRef!);
    if (functions.checkIntFromString(FFAppState().employeeID)!) {
      if (valueOrDefault(currentUserDocument?.employeeId, 0) >= 100000) {
        FFAppState().isFromAuthenPage = true;
        FFAppState().dailyText = functions
            .helloDailyRandomText(querySplashPageImage?.text?.toList());
        FFAppState().update(() {});
        FFAppState().DateHoliday = querySplashPageHoliday?.date;
        FFAppState().DateExpHoliday = querySplashPageHoliday?.dateExp;
        FFAppState().update(() {});
        Navigator.pop(context);

        context.goNamed(SuperAppPageWidget.routeName);

        return;
      }
    }
    FFAppState().userRef = queryProfile?.reference;
    FFAppState().profileImage = queryProfile!.imgProfile;
    FFAppState().adminEMP =
        queryKpiMenuAuthorize!.employeeIdList.toList().cast<String>();
    if (FFAppState().isProductionNew) {
      keyStorage1ApiUrlActionBloc = await KeyStorageRecord.getDocumentOnce(
          FFAppState().keyStorage1DocRef!);
      FFAppState().apiURLLocalState = keyStorage1ApiUrlActionBloc!.apiURL;
      FFAppState().update(() {});
    } else {
      keyStorage2ApiUrlActionBloc = await KeyStorage2Record.getDocumentOnce(
          FFAppState().keyStorage2DocRef!);
      FFAppState().apiURLLocalState = keyStorage2ApiUrlActionBloc!.uatApiUrl;
      FFAppState().update(() {});
    }

    if (FFAppState().isGetDataViaFirebase) {
    } else {
      getUserProfilePinActionBloc = await GetUserProfileAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        projectName: 'SSW_ARUNSAWAD_API',
      );

      if ((getUserProfilePinActionBloc?.statusCode ?? 200) == 200) {
        if (GetUserProfileAPICall.statuslayer1(
              (getUserProfilePinActionBloc?.jsonBody ?? ''),
            ) !=
            200) {
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text('${GetUserProfileAPICall.message(
                    (getUserProfilePinActionBloc?.jsonBody ?? ''),
                  )}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        }
        FFAppState().userNickname = '${GetUserProfileAPICall.profileNickName(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileFullName = '${GetUserProfileAPICall.profileFullName(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().update(() {});
        FFAppState().profileBirthDate =
            '${GetUserProfileAPICall.profileBirthDate(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileUnitCodeName =
            '${GetUserProfileAPICall.profileBranchName(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().update(() {});
        FFAppState().profileParentUnit = '${GetUserProfileAPICall.profileArea(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileRegion = '${GetUserProfileAPICall.profileRegion(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().update(() {});
        FFAppState().profileHiredDate =
            '${GetUserProfileAPICall.profileHiredDate(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileServiceDuration =
            '${functions.profileServiceDuration('${GetUserProfileAPICall.profileServiceDurationYY(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                )}', '${GetUserProfileAPICall.profileServiceDurationMM(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                )}', '${GetUserProfileAPICall.profileServiceDurationDD(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                )}')}';
        FFAppState().update(() {});
        FFAppState().profilePositionAge =
            '${functions.positionAgeText('${GetUserProfileAPICall.profilePositionAgeYY(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                )}', '${GetUserProfileAPICall.profilePositionAgeMM(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                )}', '${GetUserProfileAPICall.profilePositionAgeDD(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                )}')}';
        FFAppState().profilePositionAgeCheck =
            '${GetUserProfileAPICall.profilePositionAgeCheck(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().update(() {});
        queryLeadUrlLink = await UrlLinkStorageRecord.getDocumentOnce(
            FFAppState().leadUrlLinkDocRef!);
        FFAppState().profilePositionName =
            '${GetUserProfileAPICall.profliePositionName(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().QRCodeLink =
            '${queryLeadUrlLink?.urlLink}${FFAppState().employeeID}';
        FFAppState().update(() {});
        FFAppState().ProfilePhoneNumber =
            '${GetUserProfileAPICall.profilePhoneNumber(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileFirstBossEmpID =
            '${GetUserProfileAPICall.profileFirstBossEmpID(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileSecondBossEmpID =
            '${GetUserProfileAPICall.profileSecondBossEmpID(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().insurancePlanNumber =
            '${GetUserProfileAPICall.insurancePlan(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileLevel = '${GetUserProfileAPICall.profileLevel(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileBranch = '${GetUserProfileAPICall.profileBranch(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().update(() {});
        FFAppState().branchCode = '${GetUserProfileAPICall.branchCode(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().userRef = queryProfile?.reference;
        FFAppState().profileFirstName =
            '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'first_name')}';
        FFAppState().profileLastName =
            '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'last_name')}';
        FFAppState().departmentProfile = '${GetUserProfileAPICall.department(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        FFAppState().profileRoleName = '${GetUserProfileAPICall.profileRoleName(
          (getUserProfilePinActionBloc?.jsonBody ?? ''),
        )}';
        getUserInsuranceLicenseActionBloc =
            await GetUserInsuranceLicenseCall.call(
          token: FFAppState().accessToken,
          apiUrl: FFAppState().apiURLLocalState,
        );

        if ((getUserInsuranceLicenseActionBloc?.statusCode ?? 200) == 200) {
          FFAppState().insuranceLicenseStatusCode = functions
              .convertDynamicListToIntList(getJsonField(
                (getUserInsuranceLicenseActionBloc?.jsonBody ?? ''),
                r'''$.dataInfo[*].status''',
                true,
              ))!
              .toList()
              .cast<int>();
          FFAppState().profileInsuLicenseIdCard = FFAppState()
                  .insuranceLicenseStatusCode
                  .contains(FFAppState().statusCodeSuccess)
              ? functions.createSomethingListWithNullValue(
                  FFAppState().insuranceLicenseStatusCode.toList(),
                  GetUserInsuranceLicenseCall.idCard(
                    (getUserInsuranceLicenseActionBloc?.jsonBody ?? ''),
                  )?.toList())!
              : FFAppState().profileInsuLicenseIdCard.toList().cast<String>();
          FFAppState().profileInsuLicenseNumLicense = FFAppState()
                  .insuranceLicenseStatusCode
                  .contains(FFAppState().statusCodeSuccess)
              ? functions.createSomethingListWithNullValue(
                  FFAppState().insuranceLicenseStatusCode.toList(),
                  GetUserInsuranceLicenseCall.licenseNumber(
                    (getUserInsuranceLicenseActionBloc?.jsonBody ?? ''),
                  )?.toList())!
              : FFAppState()
                  .profileInsuLicenseNumLicense
                  .toList()
                  .cast<String>();
          FFAppState().profileInsuLicenseStartDate = FFAppState()
                  .insuranceLicenseStatusCode
                  .contains(FFAppState().statusCodeSuccess)
              ? functions.createSomethingListWithNullValue(
                  FFAppState().insuranceLicenseStatusCode.toList(),
                  GetUserInsuranceLicenseCall.startDate(
                    (getUserInsuranceLicenseActionBloc?.jsonBody ?? ''),
                  )?.toList())!
              : FFAppState()
                  .profileInsuLicenseStartDate
                  .toList()
                  .cast<String>();
          FFAppState().profileInsuLicenseExpireDate = FFAppState()
                  .insuranceLicenseStatusCode
                  .contains(FFAppState().statusCodeSuccess)
              ? functions.createSomethingListWithNullValue(
                  FFAppState().insuranceLicenseStatusCode.toList(),
                  GetUserInsuranceLicenseCall.expireDate(
                    (getUserInsuranceLicenseActionBloc?.jsonBody ?? ''),
                  )?.toList())!
              : FFAppState()
                  .profileInsuLicenseExpireDate
                  .toList()
                  .cast<String>();
          FFAppState().profileInsuLicenseFullName = FFAppState()
                  .insuranceLicenseStatusCode
                  .contains(FFAppState().statusCodeSuccess)
              ? functions.createSomethingListWithNullValue(
                  FFAppState().insuranceLicenseStatusCode.toList(),
                  GetUserInsuranceLicenseCall.fullName(
                    (getUserInsuranceLicenseActionBloc?.jsonBody ?? ''),
                  )?.toList())!
              : FFAppState().profileInsuLicenseFullName.toList().cast<String>();
        }
      } else {
        if (!((GetUserProfileAPICall.message(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                ) ==
                'The token has been blacklisted') ||
            (GetUserProfileAPICall.message(
                  (getUserProfilePinActionBloc?.jsonBody ?? ''),
                ) ==
                'Token Signature could not be verified.'))) {
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาด (${(getUserProfilePinActionBloc?.statusCode ?? 200).toString()})${(getUserProfilePin?.jsonBody ?? '').toString()}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        }
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('Session Loginหมดอายุ'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        FFAppState().loginStateFirebase = '[loginStateFirebase]';
        FFAppState().deleteAccessToken();
        FFAppState().accessToken = 'access_token';

        FFAppState().update(() {});
        FFAppState().deleteEmployeeID();
        FFAppState().employeeID = 'employee_id';

        FFAppState().QRCodeLink = 'qrcode_link';
        FFAppState().update(() {});
        FFAppState().deleteApiURLLocalState();
        FFAppState().apiURLLocalState = 'api_url_local_state';

        FFAppState().deleteBranchCode();
        FFAppState().branchCode = 'branch_code';

        FFAppState().update(() {});
        FFAppState().isFromSetPinPage = false;
        FFAppState().leadChannelColor = [];
        FFAppState().update(() {});
        FFAppState().leadChannelList = [];
        FFAppState().isFromLoginPage = false;
        FFAppState().update(() {});
        FFAppState().deletePinCodeAuthen();
        FFAppState().pinCodeAuthen = '013972';

        FFAppState().isFromAuthenPage = false;
        FFAppState().update(() {});
        FFAppState().deleteDateDoNotShowAgain();
        FFAppState().dateDoNotShowAgain = null;

        FFAppState().deleteDoNotShowAgain();
        FFAppState().doNotShowAgain = false;

        FFAppState().update(() {});
        FFAppState().inAppViaNotification = true;
        FFAppState().isInApp = false;
        FFAppState().update(() {});
        FFAppState().fcmToken = 'fcm_token';
        FFAppState().isPassLoginSection = false;
        FFAppState().update(() {});
        Navigator.pop(context);
        await actions.a22();

        context.goNamed(LoginPageWidget.routeName);

        return;
      }
    }

    checkLatLngActionBloc = await actions.a8(
      'Login_With_Pin',
    );
    if (!checkLatLngActionBloc!) {
      Navigator.pop(context);
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(
                  'กรุณาเปิดGPS และอนุญาตให้อรุณสวัสดิ์เข้าถึงตำแหน่งของคุณ'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
      return;
    }
    getLocationPinActionBloc = await actions.getLocation(
      'Login_With_Pin',
    );

    var userLogRecordReference = UserLogRecord.collection.doc();
    await userLogRecordReference.set(createUserLogRecordData(
      employeeId: FFAppState().employeeID,
      action: 'Login_With_Pin',
      actionTime: getCurrentTimestamp,
      userLocation: getLocationPinActionBloc,
    ));
    createdUserLogLoginPinActionBloc = UserLogRecord.getDocumentFromData(
        createUserLogRecordData(
          employeeId: FFAppState().employeeID,
          action: 'Login_With_Pin',
          actionTime: getCurrentTimestamp,
          userLocation: getLocationPinActionBloc,
        ),
        userLogRecordReference);
    FFAppState().isFromAuthenPage = true;
    FFAppState().dailyText =
        functions.helloDailyRandomText(querySplashPageImage?.text?.toList());
    FFAppState().update(() {});
    FFAppState().DateHoliday = querySplashPageHoliday?.date;
    FFAppState().DateExpHoliday = querySplashPageHoliday?.dateExp;
    FFAppState().update(() {});
    FFAppState().profileInsuExpdateAD = functions
        .stringlistToDateAD(FFAppState().profileInsuLicenseExpireDate.toList())!
        .toList()
        .cast<DateTime>();
    FFAppState().expInsuLessthen30 = functions
        .compareDate30(FFAppState().profileInsuExpdateAD.toList(),
            getCurrentTimestamp.toString())!
        .toList()
        .cast<bool>();
    queryInsuranceNotiData = await queryInsuranceNotiDataRecordOnce(
      queryBuilder: (insuranceNotiDataRecord) => insuranceNotiDataRecord.where(
        'emp_id',
        isEqualTo: functions.checkIntFromString(FFAppState().employeeID)!
            ? (valueOrDefault(currentUserDocument?.employeeId, 0) >= 100000
                ? valueOrDefault(currentUserDocument?.employeeId, 0).toString()
                : FFAppState().employeeID)
            : FFAppState().employeeID,
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    queryInsuranceLicenseData = await queryInsuranceLicenseDataRecordOnce(
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (queryInsuranceNotiData != null) {
      if (!functions.compareListof2Date(
          queryInsuranceNotiData?.expInsuDate?.toList(),
          FFAppState().profileInsuExpdateAD.toList())!) {
        await queryInsuranceNotiData!.reference.update({
          ...mapToFirestore(
            {
              'exp_insu_date': FFAppState().profileInsuExpdateAD,
            },
          ),
        });
      }
      if (queryInsuranceLicenseData?.licenseName?.length !=
          queryInsuranceNotiData?.licenseType?.length) {
        await queryInsuranceNotiData!.reference.update({
          ...mapToFirestore(
            {
              'license_type': queryInsuranceLicenseData?.licenseName,
            },
          ),
        });
      }
      if (queryInsuranceNotiData?.expInsuDate?.length !=
          FFAppState().profileInsuExpdateAD.length) {
        await queryInsuranceNotiData!.reference.update({
          ...mapToFirestore(
            {
              'exp_insu_date': FFAppState().profileInsuExpdateAD,
            },
          ),
        });
      }
    } else {
      var insuranceNotiDataRecordReference =
          InsuranceNotiDataRecord.collection.doc();
      await insuranceNotiDataRecordReference.set({
        ...createInsuranceNotiDataRecordData(
          empId: FFAppState().employeeID,
        ),
        ...mapToFirestore(
          {
            'license_type': queryInsuranceLicenseData?.licenseName,
            'noti_is_sent': FFAppState().defaultlistFalse,
            'exp_insu_date': FFAppState().profileInsuExpdateAD,
          },
        ),
      });
      createInsuNotidadta = InsuranceNotiDataRecord.getDocumentFromData({
        ...createInsuranceNotiDataRecordData(
          empId: FFAppState().employeeID,
        ),
        ...mapToFirestore(
          {
            'license_type': queryInsuranceLicenseData?.licenseName,
            'noti_is_sent': FFAppState().defaultlistFalse,
            'exp_insu_date': FFAppState().profileInsuExpdateAD,
          },
        ),
      }, insuranceNotiDataRecordReference);
      Navigator.pop(context);

      context.goNamed(SuperAppPageWidget.routeName);

      return;
    }

    while (FFAppState().superAppi <=
        functions
            .lengthMinus1(FFAppState().insuranceLicenseStatusCode.toList())!) {
      if (FFAppState()
              .insuranceLicenseStatusCode
              .elementAtOrNull(FFAppState().superAppi) ==
          200) {
        if (FFAppState()
            .expInsuLessthen30
            .elementAtOrNull(FFAppState().superAppi)!) {
          if ((queryInsuranceNotiData?.notiIsSent
                  ?.elementAtOrNull(FFAppState().superAppi)) ==
              false) {
            FFAppState().falselistPersistd = functions
                .changelistFalseToTrue(FFAppState().falselistPersistd.toList(),
                    FFAppState().superAppi)!
                .toList()
                .cast<bool>();

            var notificationRecordReference =
                NotificationRecord.createDoc(queryProfile!.reference);
            await notificationRecordReference.set(createNotificationRecordData(
              notiTime: getCurrentTimestamp,
              notiTitle: 'แจ้งเตือนใบอนุญาตประกัน',
              notiBody:
                  'ใบอนุญาต${queryInsuranceNotiData?.licenseType?.elementAtOrNull(FFAppState().superAppi)}จะหมดอายุใน 30 วัน',
              notiIsRead: false,
              thisNotiIsRead: false,
              notiType: 'insurance',
            ));
            createInsuPageNotification = NotificationRecord.getDocumentFromData(
                createNotificationRecordData(
                  notiTime: getCurrentTimestamp,
                  notiTitle: 'แจ้งเตือนใบอนุญาตประกัน',
                  notiBody:
                      'ใบอนุญาต${queryInsuranceNotiData?.licenseType?.elementAtOrNull(FFAppState().superAppi)}จะหมดอายุใน 30 วัน',
                  notiIsRead: false,
                  thisNotiIsRead: false,
                  notiType: 'insurance',
                ),
                notificationRecordReference);
          }
        }
      }
      FFAppState().superAppi = FFAppState().superAppi + 1;
    }

    await queryInsuranceNotiData!.reference.update({
      ...mapToFirestore(
        {
          'noti_is_sent': FFAppState().falselistPersistd,
        },
      ),
    });
    FFAppState().firstLoginLocation = getLocationPinActionBloc;
    Navigator.pop(context);

    context.goNamed(SuperAppPageWidget.routeName);
  }
}
