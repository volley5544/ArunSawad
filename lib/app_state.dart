import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _accessToken =
          await secureStorage.getString('ff_accessToken') ?? _accessToken;
    });
    await _safeInitAsync(() async {
      _employeeID =
          await secureStorage.getString('ff_employeeID') ?? _employeeID;
    });
    await _safeInitAsync(() async {
      _apiURLLocalState =
          await secureStorage.getString('ff_apiURLLocalState') ??
              _apiURLLocalState;
    });
    await _safeInitAsync(() async {
      _branchCode =
          await secureStorage.getString('ff_branchCode') ?? _branchCode;
    });
    await _safeInitAsync(() async {
      _doNotShowAgain =
          await secureStorage.getBool('ff_doNotShowAgain') ?? _doNotShowAgain;
    });
    await _safeInitAsync(() async {
      _dateDoNotShowAgain =
          await secureStorage.read(key: 'ff_dateDoNotShowAgain') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_dateDoNotShowAgain'))!)
              : _dateDoNotShowAgain;
    });
    await _safeInitAsync(() async {
      _pinCodeAuthen =
          await secureStorage.getString('ff_pinCodeAuthen') ?? _pinCodeAuthen;
    });
    await _safeInitAsync(() async {
      _userLogRef =
          (await secureStorage.getString('ff_userLogRef'))?.ref ?? _userLogRef;
    });
    await _safeInitAsync(() async {
      _userRef = (await secureStorage.getString('ff_userRef'))?.ref ?? _userRef;
    });
    await _safeInitAsync(() async {
      _userNickname =
          await secureStorage.getString('ff_userNickname') ?? _userNickname;
    });
    await _safeInitAsync(() async {
      _leadIdCalledInApp =
          await secureStorage.getStringList('ff_leadIdCalledInApp') ??
              _leadIdCalledInApp;
    });
    await _safeInitAsync(() async {
      _firstUseApp =
          await secureStorage.getBool('ff_firstUseApp') ?? _firstUseApp;
    });
    await _safeInitAsync(() async {
      _DateHolidayNotShow =
          await secureStorage.read(key: 'ff_DateHolidayNotShow') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_DateHolidayNotShow'))!)
              : _DateHolidayNotShow;
    });
    await _safeInitAsync(() async {
      _firstLogin = await secureStorage.getBool('ff_firstLogin') ?? _firstLogin;
    });
    await _safeInitAsync(() async {
      _brachListNew =
          await secureStorage.getStringList('ff_brachListNew') ?? _brachListNew;
    });
    await _safeInitAsync(() async {
      _brachLatNew =
          await secureStorage.getStringList('ff_brachLatNew') ?? _brachLatNew;
    });
    await _safeInitAsync(() async {
      _brachLngNew =
          await secureStorage.getStringList('ff_brachLngNew') ?? _brachLngNew;
    });
    await _safeInitAsync(() async {
      _BrachRadNew =
          await secureStorage.getStringList('ff_BrachRadNew') ?? _BrachRadNew;
    });
    await _safeInitAsync(() async {
      _brachGroupNew =
          await secureStorage.getString('ff_brachGroupNew') ?? _brachGroupNew;
    });
    await _safeInitAsync(() async {
      _falselistPersistd =
          (await secureStorage.getStringList('ff_falselistPersistd'))
                  ?.map((x) => x == 'true')
                  .toList() ??
              _falselistPersistd;
    });
    await _safeInitAsync(() async {
      _BioAuthCheck =
          await secureStorage.getBool('ff_BioAuthCheck') ?? _BioAuthCheck;
    });
    await _safeInitAsync(() async {
      _profileImage =
          await secureStorage.getString('ff_profileImage') ?? _profileImage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _imei = '123456789012345';
  String get imei => _imei;
  set imei(String value) {
    _imei = value;
  }

  String _accessToken = 'access_token';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    secureStorage.setString('ff_accessToken', value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  String _employeeID = 'employee_id';
  String get employeeID => _employeeID;
  set employeeID(String value) {
    _employeeID = value;
    secureStorage.setString('ff_employeeID', value);
  }

  void deleteEmployeeID() {
    secureStorage.delete(key: 'ff_employeeID');
  }

  String _QRCodeLink = 'qrcode_link';
  String get QRCodeLink => _QRCodeLink;
  set QRCodeLink(String value) {
    _QRCodeLink = value;
  }

  String _apiURLLocalState = 'api_url_local_state';
  String get apiURLLocalState => _apiURLLocalState;
  set apiURLLocalState(String value) {
    _apiURLLocalState = value;
    secureStorage.setString('ff_apiURLLocalState', value);
  }

  void deleteApiURLLocalState() {
    secureStorage.delete(key: 'ff_apiURLLocalState');
  }

  int _counterNum = 0;
  int get counterNum => _counterNum;
  set counterNum(int value) {
    _counterNum = value;
  }

  List<String> _imgURL = [];
  List<String> get imgURL => _imgURL;
  set imgURL(List<String> value) {
    _imgURL = value;
  }

  void addToImgURL(String value) {
    imgURL.add(value);
  }

  void removeFromImgURL(String value) {
    imgURL.remove(value);
  }

  void removeAtIndexFromImgURL(int index) {
    imgURL.removeAt(index);
  }

  void updateImgURLAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imgURL[index] = updateFn(_imgURL[index]);
  }

  void insertAtIndexInImgURL(int index, String value) {
    imgURL.insert(index, value);
  }

  String _imgURLTemp =
      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
  String get imgURLTemp => _imgURLTemp;
  set imgURLTemp(String value) {
    _imgURLTemp = value;
  }

  List<String> _materialRecordId = [];
  List<String> get materialRecordId => _materialRecordId;
  set materialRecordId(List<String> value) {
    _materialRecordId = value;
  }

  void addToMaterialRecordId(String value) {
    materialRecordId.add(value);
  }

  void removeFromMaterialRecordId(String value) {
    materialRecordId.remove(value);
  }

  void removeAtIndexFromMaterialRecordId(int index) {
    materialRecordId.removeAt(index);
  }

  void updateMaterialRecordIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    materialRecordId[index] = updateFn(_materialRecordId[index]);
  }

  void insertAtIndexInMaterialRecordId(int index, String value) {
    materialRecordId.insert(index, value);
  }

  List<int> _materialsAmount = [];
  List<int> get materialsAmount => _materialsAmount;
  set materialsAmount(List<int> value) {
    _materialsAmount = value;
  }

  void addToMaterialsAmount(int value) {
    materialsAmount.add(value);
  }

  void removeFromMaterialsAmount(int value) {
    materialsAmount.remove(value);
  }

  void removeAtIndexFromMaterialsAmount(int index) {
    materialsAmount.removeAt(index);
  }

  void updateMaterialsAmountAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    materialsAmount[index] = updateFn(_materialsAmount[index]);
  }

  void insertAtIndexInMaterialsAmount(int index, int value) {
    materialsAmount.insert(index, value);
  }

  bool _isFromTimesheetPage = false;
  bool get isFromTimesheetPage => _isFromTimesheetPage;
  set isFromTimesheetPage(bool value) {
    _isFromTimesheetPage = value;
  }

  String _branchCode = 'branch_code';
  String get branchCode => _branchCode;
  set branchCode(String value) {
    _branchCode = value;
    secureStorage.setString('ff_branchCode', value);
  }

  void deleteBranchCode() {
    secureStorage.delete(key: 'ff_branchCode');
  }

  String _locationTemp = '';
  String get locationTemp => _locationTemp;
  set locationTemp(String value) {
    _locationTemp = value;
  }

  List<String> _materialNameList = [];
  List<String> get materialNameList => _materialNameList;
  set materialNameList(List<String> value) {
    _materialNameList = value;
  }

  void addToMaterialNameList(String value) {
    materialNameList.add(value);
  }

  void removeFromMaterialNameList(String value) {
    materialNameList.remove(value);
  }

  void removeAtIndexFromMaterialNameList(int index) {
    materialNameList.removeAt(index);
  }

  void updateMaterialNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    materialNameList[index] = updateFn(_materialNameList[index]);
  }

  void insertAtIndexInMaterialNameList(int index, String value) {
    materialNameList.insert(index, value);
  }

  List<String> _materialImgList = [];
  List<String> get materialImgList => _materialImgList;
  set materialImgList(List<String> value) {
    _materialImgList = value;
  }

  void addToMaterialImgList(String value) {
    materialImgList.add(value);
  }

  void removeFromMaterialImgList(String value) {
    materialImgList.remove(value);
  }

  void removeAtIndexFromMaterialImgList(int index) {
    materialImgList.removeAt(index);
  }

  void updateMaterialImgListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    materialImgList[index] = updateFn(_materialImgList[index]);
  }

  void insertAtIndexInMaterialImgList(int index, String value) {
    materialImgList.insert(index, value);
  }

  List<String> _vloanContNoListTemp = [];
  List<String> get vloanContNoListTemp => _vloanContNoListTemp;
  set vloanContNoListTemp(List<String> value) {
    _vloanContNoListTemp = value;
  }

  void addToVloanContNoListTemp(String value) {
    vloanContNoListTemp.add(value);
  }

  void removeFromVloanContNoListTemp(String value) {
    vloanContNoListTemp.remove(value);
  }

  void removeAtIndexFromVloanContNoListTemp(int index) {
    vloanContNoListTemp.removeAt(index);
  }

  void updateVloanContNoListTempAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    vloanContNoListTemp[index] = updateFn(_vloanContNoListTemp[index]);
  }

  void insertAtIndexInVloanContNoListTemp(int index, String value) {
    vloanContNoListTemp.insert(index, value);
  }

  List<String> _vloanCustomerNameListTemp = [];
  List<String> get vloanCustomerNameListTemp => _vloanCustomerNameListTemp;
  set vloanCustomerNameListTemp(List<String> value) {
    _vloanCustomerNameListTemp = value;
  }

  void addToVloanCustomerNameListTemp(String value) {
    vloanCustomerNameListTemp.add(value);
  }

  void removeFromVloanCustomerNameListTemp(String value) {
    vloanCustomerNameListTemp.remove(value);
  }

  void removeAtIndexFromVloanCustomerNameListTemp(int index) {
    vloanCustomerNameListTemp.removeAt(index);
  }

  void updateVloanCustomerNameListTempAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    vloanCustomerNameListTemp[index] =
        updateFn(_vloanCustomerNameListTemp[index]);
  }

  void insertAtIndexInVloanCustomerNameListTemp(int index, String value) {
    vloanCustomerNameListTemp.insert(index, value);
  }

  bool _isGetVloanContract = false;
  bool get isGetVloanContract => _isGetVloanContract;
  set isGetVloanContract(bool value) {
    _isGetVloanContract = value;
  }

  List<String> _vloanServerListTemp = [];
  List<String> get vloanServerListTemp => _vloanServerListTemp;
  set vloanServerListTemp(List<String> value) {
    _vloanServerListTemp = value;
  }

  void addToVloanServerListTemp(String value) {
    vloanServerListTemp.add(value);
  }

  void removeFromVloanServerListTemp(String value) {
    vloanServerListTemp.remove(value);
  }

  void removeAtIndexFromVloanServerListTemp(int index) {
    vloanServerListTemp.removeAt(index);
  }

  void updateVloanServerListTempAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    vloanServerListTemp[index] = updateFn(_vloanServerListTemp[index]);
  }

  void insertAtIndexInVloanServerListTemp(int index, String value) {
    vloanServerListTemp.insert(index, value);
  }

  String _fcmToken = 'fcm_token';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  List<String> _leadID = [];
  List<String> get leadID => _leadID;
  set leadID(List<String> value) {
    _leadID = value;
  }

  void addToLeadID(String value) {
    leadID.add(value);
  }

  void removeFromLeadID(String value) {
    leadID.remove(value);
  }

  void removeAtIndexFromLeadID(int index) {
    leadID.removeAt(index);
  }

  void updateLeadIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadID[index] = updateFn(_leadID[index]);
  }

  void insertAtIndexInLeadID(int index, String value) {
    leadID.insert(index, value);
  }

  List<DateTime> _leadTimeRemainList = [];
  List<DateTime> get leadTimeRemainList => _leadTimeRemainList;
  set leadTimeRemainList(List<DateTime> value) {
    _leadTimeRemainList = value;
  }

  void addToLeadTimeRemainList(DateTime value) {
    leadTimeRemainList.add(value);
  }

  void removeFromLeadTimeRemainList(DateTime value) {
    leadTimeRemainList.remove(value);
  }

  void removeAtIndexFromLeadTimeRemainList(int index) {
    leadTimeRemainList.removeAt(index);
  }

  void updateLeadTimeRemainListAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    leadTimeRemainList[index] = updateFn(_leadTimeRemainList[index]);
  }

  void insertAtIndexInLeadTimeRemainList(int index, DateTime value) {
    leadTimeRemainList.insert(index, value);
  }

  List<String> _leadCustomerNameList = [];
  List<String> get leadCustomerNameList => _leadCustomerNameList;
  set leadCustomerNameList(List<String> value) {
    _leadCustomerNameList = value;
  }

  void addToLeadCustomerNameList(String value) {
    leadCustomerNameList.add(value);
  }

  void removeFromLeadCustomerNameList(String value) {
    leadCustomerNameList.remove(value);
  }

  void removeAtIndexFromLeadCustomerNameList(int index) {
    leadCustomerNameList.removeAt(index);
  }

  void updateLeadCustomerNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCustomerNameList[index] = updateFn(_leadCustomerNameList[index]);
  }

  void insertAtIndexInLeadCustomerNameList(int index, String value) {
    leadCustomerNameList.insert(index, value);
  }

  String _coachURL = 'https://hris.srisawadpower.com/COACH';
  String get coachURL => _coachURL;
  set coachURL(String value) {
    _coachURL = value;
  }

  bool _isInApp = false;
  bool get isInApp => _isInApp;
  set isInApp(bool value) {
    _isInApp = value;
  }

  bool _inAppViaNotification = true;
  bool get inAppViaNotification => _inAppViaNotification;
  set inAppViaNotification(bool value) {
    _inAppViaNotification = value;
  }

  bool _doNotShowAgain = false;
  bool get doNotShowAgain => _doNotShowAgain;
  set doNotShowAgain(bool value) {
    _doNotShowAgain = value;
    secureStorage.setBool('ff_doNotShowAgain', value);
  }

  void deleteDoNotShowAgain() {
    secureStorage.delete(key: 'ff_doNotShowAgain');
  }

  DateTime? _dateDoNotShowAgain;
  DateTime? get dateDoNotShowAgain => _dateDoNotShowAgain;
  set dateDoNotShowAgain(DateTime? value) {
    _dateDoNotShowAgain = value;
    value != null
        ? secureStorage.setInt(
            'ff_dateDoNotShowAgain', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_dateDoNotShowAgain');
  }

  void deleteDateDoNotShowAgain() {
    secureStorage.delete(key: 'ff_dateDoNotShowAgain');
  }

  bool _check = false;
  bool get check => _check;
  set check(bool value) {
    _check = value;
  }

  bool _opsMenuVisible = false;
  bool get opsMenuVisible => _opsMenuVisible;
  set opsMenuVisible(bool value) {
    _opsMenuVisible = value;
  }

  List<String> _bannerSuperAppImgList = [];
  List<String> get bannerSuperAppImgList => _bannerSuperAppImgList;
  set bannerSuperAppImgList(List<String> value) {
    _bannerSuperAppImgList = value;
  }

  void addToBannerSuperAppImgList(String value) {
    bannerSuperAppImgList.add(value);
  }

  void removeFromBannerSuperAppImgList(String value) {
    bannerSuperAppImgList.remove(value);
  }

  void removeAtIndexFromBannerSuperAppImgList(int index) {
    bannerSuperAppImgList.removeAt(index);
  }

  void updateBannerSuperAppImgListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bannerSuperAppImgList[index] = updateFn(_bannerSuperAppImgList[index]);
  }

  void insertAtIndexInBannerSuperAppImgList(int index, String value) {
    bannerSuperAppImgList.insert(index, value);
  }

  int _diffDate = -99;
  int get diffDate => _diffDate;
  set diffDate(int value) {
    _diffDate = value;
  }

  bool _isFromAuthenPage = false;
  bool get isFromAuthenPage => _isFromAuthenPage;
  set isFromAuthenPage(bool value) {
    _isFromAuthenPage = value;
  }

  String _pinCodeAuthen = '013972';
  String get pinCodeAuthen => _pinCodeAuthen;
  set pinCodeAuthen(String value) {
    _pinCodeAuthen = value;
    secureStorage.setString('ff_pinCodeAuthen', value);
  }

  void deletePinCodeAuthen() {
    secureStorage.delete(key: 'ff_pinCodeAuthen');
  }

  bool _isFromLoginPage = false;
  bool get isFromLoginPage => _isFromLoginPage;
  set isFromLoginPage(bool value) {
    _isFromLoginPage = value;
  }

  bool _isGotNoti = false;
  bool get isGotNoti => _isGotNoti;
  set isGotNoti(bool value) {
    _isGotNoti = value;
  }

  String _isGottNoti = '';
  String get isGottNoti => _isGottNoti;
  set isGottNoti(String value) {
    _isGottNoti = value;
  }

  List<String> _leadChannelPairColorList = [];
  List<String> get leadChannelPairColorList => _leadChannelPairColorList;
  set leadChannelPairColorList(List<String> value) {
    _leadChannelPairColorList = value;
  }

  void addToLeadChannelPairColorList(String value) {
    leadChannelPairColorList.add(value);
  }

  void removeFromLeadChannelPairColorList(String value) {
    leadChannelPairColorList.remove(value);
  }

  void removeAtIndexFromLeadChannelPairColorList(int index) {
    leadChannelPairColorList.removeAt(index);
  }

  void updateLeadChannelPairColorListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelPairColorList[index] =
        updateFn(_leadChannelPairColorList[index]);
  }

  void insertAtIndexInLeadChannelPairColorList(int index, String value) {
    leadChannelPairColorList.insert(index, value);
  }

  List<String> _leadChannelList = [];
  List<String> get leadChannelList => _leadChannelList;
  set leadChannelList(List<String> value) {
    _leadChannelList = value;
  }

  void addToLeadChannelList(String value) {
    leadChannelList.add(value);
  }

  void removeFromLeadChannelList(String value) {
    leadChannelList.remove(value);
  }

  void removeAtIndexFromLeadChannelList(int index) {
    leadChannelList.removeAt(index);
  }

  void updateLeadChannelListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelList[index] = updateFn(_leadChannelList[index]);
  }

  void insertAtIndexInLeadChannelList(int index, String value) {
    leadChannelList.insert(index, value);
  }

  List<String> _leadChannelColor = [];
  List<String> get leadChannelColor => _leadChannelColor;
  set leadChannelColor(List<String> value) {
    _leadChannelColor = value;
  }

  void addToLeadChannelColor(String value) {
    leadChannelColor.add(value);
  }

  void removeFromLeadChannelColor(String value) {
    leadChannelColor.remove(value);
  }

  void removeAtIndexFromLeadChannelColor(int index) {
    leadChannelColor.removeAt(index);
  }

  void updateLeadChannelColorAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelColor[index] = updateFn(_leadChannelColor[index]);
  }

  void insertAtIndexInLeadChannelColor(int index, String value) {
    leadChannelColor.insert(index, value);
  }

  bool _isFromSetPinPage = false;
  bool get isFromSetPinPage => _isFromSetPinPage;
  set isFromSetPinPage(bool value) {
    _isFromSetPinPage = value;
  }

  DocumentReference? _userLogRef =
      FirebaseFirestore.instance.doc('/user_log/[user_log]');
  DocumentReference? get userLogRef => _userLogRef;
  set userLogRef(DocumentReference? value) {
    _userLogRef = value;
    value != null
        ? secureStorage.setString('ff_userLogRef', value.path)
        : secureStorage.remove('ff_userLogRef');
  }

  void deleteUserLogRef() {
    secureStorage.delete(key: 'ff_userLogRef');
  }

  DocumentReference? _checkUserRef;
  DocumentReference? get checkUserRef => _checkUserRef;
  set checkUserRef(DocumentReference? value) {
    _checkUserRef = value;
  }

  String _temp1 = '';
  String get temp1 => _temp1;
  set temp1(String value) {
    _temp1 = value;
  }

  String _temp2 = '';
  String get temp2 => _temp2;
  set temp2(String value) {
    _temp2 = value;
  }

  DateTime? _temp3;
  DateTime? get temp3 => _temp3;
  set temp3(DateTime? value) {
    _temp3 = value;
  }

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? value) {
    _userRef = value;
    value != null
        ? secureStorage.setString('ff_userRef', value.path)
        : secureStorage.remove('ff_userRef');
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

  String _loginStateFirebase = '[loginStateFirebase]';
  String get loginStateFirebase => _loginStateFirebase;
  set loginStateFirebase(String value) {
    _loginStateFirebase = value;
  }

  List<String> _leadCreatedTimeList = [];
  List<String> get leadCreatedTimeList => _leadCreatedTimeList;
  set leadCreatedTimeList(List<String> value) {
    _leadCreatedTimeList = value;
  }

  void addToLeadCreatedTimeList(String value) {
    leadCreatedTimeList.add(value);
  }

  void removeFromLeadCreatedTimeList(String value) {
    leadCreatedTimeList.remove(value);
  }

  void removeAtIndexFromLeadCreatedTimeList(int index) {
    leadCreatedTimeList.removeAt(index);
  }

  void updateLeadCreatedTimeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCreatedTimeList[index] = updateFn(_leadCreatedTimeList[index]);
  }

  void insertAtIndexInLeadCreatedTimeList(int index, String value) {
    leadCreatedTimeList.insert(index, value);
  }

  List<String> _leadCallStatus = [];
  List<String> get leadCallStatus => _leadCallStatus;
  set leadCallStatus(List<String> value) {
    _leadCallStatus = value;
  }

  void addToLeadCallStatus(String value) {
    leadCallStatus.add(value);
  }

  void removeFromLeadCallStatus(String value) {
    leadCallStatus.remove(value);
  }

  void removeAtIndexFromLeadCallStatus(int index) {
    leadCallStatus.removeAt(index);
  }

  void updateLeadCallStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCallStatus[index] = updateFn(_leadCallStatus[index]);
  }

  void insertAtIndexInLeadCallStatus(int index, String value) {
    leadCallStatus.insert(index, value);
  }

  List<String> _leadPhoneNumberList = [];
  List<String> get leadPhoneNumberList => _leadPhoneNumberList;
  set leadPhoneNumberList(List<String> value) {
    _leadPhoneNumberList = value;
  }

  void addToLeadPhoneNumberList(String value) {
    leadPhoneNumberList.add(value);
  }

  void removeFromLeadPhoneNumberList(String value) {
    leadPhoneNumberList.remove(value);
  }

  void removeAtIndexFromLeadPhoneNumberList(int index) {
    leadPhoneNumberList.removeAt(index);
  }

  void updateLeadPhoneNumberListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadPhoneNumberList[index] = updateFn(_leadPhoneNumberList[index]);
  }

  void insertAtIndexInLeadPhoneNumberList(int index, String value) {
    leadPhoneNumberList.insert(index, value);
  }

  List<String> _leadEmployeeID = [];
  List<String> get leadEmployeeID => _leadEmployeeID;
  set leadEmployeeID(List<String> value) {
    _leadEmployeeID = value;
  }

  void addToLeadEmployeeID(String value) {
    leadEmployeeID.add(value);
  }

  void removeFromLeadEmployeeID(String value) {
    leadEmployeeID.remove(value);
  }

  void removeAtIndexFromLeadEmployeeID(int index) {
    leadEmployeeID.removeAt(index);
  }

  void updateLeadEmployeeIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadEmployeeID[index] = updateFn(_leadEmployeeID[index]);
  }

  void insertAtIndexInLeadEmployeeID(int index, String value) {
    leadEmployeeID.insert(index, value);
  }

  bool _isPassLoginSection = false;
  bool get isPassLoginSection => _isPassLoginSection;
  set isPassLoginSection(bool value) {
    _isPassLoginSection = value;
  }

  List<Color> _leadChannelLabelColor = [];
  List<Color> get leadChannelLabelColor => _leadChannelLabelColor;
  set leadChannelLabelColor(List<Color> value) {
    _leadChannelLabelColor = value;
  }

  void addToLeadChannelLabelColor(Color value) {
    leadChannelLabelColor.add(value);
  }

  void removeFromLeadChannelLabelColor(Color value) {
    leadChannelLabelColor.remove(value);
  }

  void removeAtIndexFromLeadChannelLabelColor(int index) {
    leadChannelLabelColor.removeAt(index);
  }

  void updateLeadChannelLabelColorAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    leadChannelLabelColor[index] = updateFn(_leadChannelLabelColor[index]);
  }

  void insertAtIndexInLeadChannelLabelColor(int index, Color value) {
    leadChannelLabelColor.insert(index, value);
  }

  String _userNickname = '[user_nickname]';
  String get userNickname => _userNickname;
  set userNickname(String value) {
    _userNickname = value;
    secureStorage.setString('ff_userNickname', value);
  }

  void deleteUserNickname() {
    secureStorage.delete(key: 'ff_userNickname');
  }

  List<String> _leadIdCalledInApp = [];
  List<String> get leadIdCalledInApp => _leadIdCalledInApp;
  set leadIdCalledInApp(List<String> value) {
    _leadIdCalledInApp = value;
    secureStorage.setStringList('ff_leadIdCalledInApp', value);
  }

  void deleteLeadIdCalledInApp() {
    secureStorage.delete(key: 'ff_leadIdCalledInApp');
  }

  void addToLeadIdCalledInApp(String value) {
    leadIdCalledInApp.add(value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeFromLeadIdCalledInApp(String value) {
    leadIdCalledInApp.remove(value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeAtIndexFromLeadIdCalledInApp(int index) {
    leadIdCalledInApp.removeAt(index);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void updateLeadIdCalledInAppAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadIdCalledInApp[index] = updateFn(_leadIdCalledInApp[index]);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void insertAtIndexInLeadIdCalledInApp(int index, String value) {
    leadIdCalledInApp.insert(index, value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  String _profileFullName = '[full_name]';
  String get profileFullName => _profileFullName;
  set profileFullName(String value) {
    _profileFullName = value;
  }

  String _profileBirthDate = '[birth_date]';
  String get profileBirthDate => _profileBirthDate;
  set profileBirthDate(String value) {
    _profileBirthDate = value;
  }

  String _profileUnitCodeName = '[unit_code_name]';
  String get profileUnitCodeName => _profileUnitCodeName;
  set profileUnitCodeName(String value) {
    _profileUnitCodeName = value;
  }

  String _profileParentUnit = '[parent_unit]';
  String get profileParentUnit => _profileParentUnit;
  set profileParentUnit(String value) {
    _profileParentUnit = value;
  }

  String _profileRegion = '[region]';
  String get profileRegion => _profileRegion;
  set profileRegion(String value) {
    _profileRegion = value;
  }

  String _profileHiredDate = '[hired_date]';
  String get profileHiredDate => _profileHiredDate;
  set profileHiredDate(String value) {
    _profileHiredDate = value;
  }

  String _profileServiceDuration = '[service_duration]';
  String get profileServiceDuration => _profileServiceDuration;
  set profileServiceDuration(String value) {
    _profileServiceDuration = value;
  }

  String _profilePositionAge = '[position_age]';
  String get profilePositionAge => _profilePositionAge;
  set profilePositionAge(String value) {
    _profilePositionAge = value;
  }

  String _profilePositionName = '[position_name]';
  String get profilePositionName => _profilePositionName;
  set profilePositionName(String value) {
    _profilePositionName = value;
  }

  List<String> _dailySplashPageText = [
    'จันทร์แล้ว จันทร์จ้า สดใสซาบซ่า รับแต่สิ่งดี ๆ เข้ามาตลอดวัน',
    'สวัสดีวันอังคาร สดชื่นแจ่มใส คิดอะไรก็สมดั่งใจ อย่ามีอันตรายใดมาแผ้วพาน',
    'วันพุธสุดสดชื่น ขอให้มีความรักที่ชื่นมื่น มีแต่ความสุขใจทุกคืนวัน',
    'สวัสดีวันพฤหัสบดี ทักทายยามเช้าที่สดใส ขอให้ทำอะไร อยู่ที่ไหน มีแต่ความสุขกายสบายใจ',
    'สวัสดีวันศุกร์ สุขกาย สุขใจ สุขภาพแข็งแรง ปลอดภัยตลอดวัน',
    'Hello Saturday ขอให้ชีวิตชื่นมื่น ความรักก็ไม่ขมขื่น มีแต่ความเริงรื่นในหัวใจ',
    'สุขสันต์วันอาทิตย์ ขอให้มีสติคิดการณ์ใหญ่ มองเห็นหนทางที่กว้างไกล สู้สร้างฝันต่อไปให้สำเร็จ'
  ];
  List<String> get dailySplashPageText => _dailySplashPageText;
  set dailySplashPageText(List<String> value) {
    _dailySplashPageText = value;
  }

  void addToDailySplashPageText(String value) {
    dailySplashPageText.add(value);
  }

  void removeFromDailySplashPageText(String value) {
    dailySplashPageText.remove(value);
  }

  void removeAtIndexFromDailySplashPageText(int index) {
    dailySplashPageText.removeAt(index);
  }

  void updateDailySplashPageTextAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dailySplashPageText[index] = updateFn(_dailySplashPageText[index]);
  }

  void insertAtIndexInDailySplashPageText(int index, String value) {
    dailySplashPageText.insert(index, value);
  }

  List<String> _leadBranchCode = [];
  List<String> get leadBranchCode => _leadBranchCode;
  set leadBranchCode(List<String> value) {
    _leadBranchCode = value;
  }

  void addToLeadBranchCode(String value) {
    leadBranchCode.add(value);
  }

  void removeFromLeadBranchCode(String value) {
    leadBranchCode.remove(value);
  }

  void removeAtIndexFromLeadBranchCode(int index) {
    leadBranchCode.removeAt(index);
  }

  void updateLeadBranchCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadBranchCode[index] = updateFn(_leadBranchCode[index]);
  }

  void insertAtIndexInLeadBranchCode(int index, String value) {
    leadBranchCode.insert(index, value);
  }

  String _leadUserLevel = 'lead_user_level';
  String get leadUserLevel => _leadUserLevel;
  set leadUserLevel(String value) {
    _leadUserLevel = value;
  }

  List<int> _leadChannelAmountList = [0, 0, 0, 0];
  List<int> get leadChannelAmountList => _leadChannelAmountList;
  set leadChannelAmountList(List<int> value) {
    _leadChannelAmountList = value;
  }

  void addToLeadChannelAmountList(int value) {
    leadChannelAmountList.add(value);
  }

  void removeFromLeadChannelAmountList(int value) {
    leadChannelAmountList.remove(value);
  }

  void removeAtIndexFromLeadChannelAmountList(int index) {
    leadChannelAmountList.removeAt(index);
  }

  void updateLeadChannelAmountListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    leadChannelAmountList[index] = updateFn(_leadChannelAmountList[index]);
  }

  void insertAtIndexInLeadChannelAmountList(int index, int value) {
    leadChannelAmountList.insert(index, value);
  }

  String _leadChannelSelected = 'All';
  String get leadChannelSelected => _leadChannelSelected;
  set leadChannelSelected(String value) {
    _leadChannelSelected = value;
  }

  String _dailyText = 'daily_text';
  String get dailyText => _dailyText;
  set dailyText(String value) {
    _dailyText = value;
  }

  bool _firstUseApp = false;
  bool get firstUseApp => _firstUseApp;
  set firstUseApp(bool value) {
    _firstUseApp = value;
    secureStorage.setBool('ff_firstUseApp', value);
  }

  void deleteFirstUseApp() {
    secureStorage.delete(key: 'ff_firstUseApp');
  }

  int _introPageIndex = 1;
  int get introPageIndex => _introPageIndex;
  set introPageIndex(int value) {
    _introPageIndex = value;
  }

  LatLng? _HOLocation = LatLng(13.888767, 100.575308);
  LatLng? get HOLocation => _HOLocation;
  set HOLocation(LatLng? value) {
    _HOLocation = value;
  }

  List<String> _adminEmployeeID = ['31622', '23328', '30427', '33511'];
  List<String> get adminEmployeeID => _adminEmployeeID;
  set adminEmployeeID(List<String> value) {
    _adminEmployeeID = value;
  }

  void addToAdminEmployeeID(String value) {
    adminEmployeeID.add(value);
  }

  void removeFromAdminEmployeeID(String value) {
    adminEmployeeID.remove(value);
  }

  void removeAtIndexFromAdminEmployeeID(int index) {
    adminEmployeeID.removeAt(index);
  }

  void updateAdminEmployeeIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adminEmployeeID[index] = updateFn(_adminEmployeeID[index]);
  }

  void insertAtIndexInAdminEmployeeID(int index, String value) {
    adminEmployeeID.insert(index, value);
  }

  String _profilePositionAgeCheck = '[position_age_check]';
  String get profilePositionAgeCheck => _profilePositionAgeCheck;
  set profilePositionAgeCheck(String value) {
    _profilePositionAgeCheck = value;
  }

  DateTime? _dcvdf;
  DateTime? get dcvdf => _dcvdf;
  set dcvdf(DateTime? value) {
    _dcvdf = value;
  }

  String _firebaseUserUID = '';
  String get firebaseUserUID => _firebaseUserUID;
  set firebaseUserUID(String value) {
    _firebaseUserUID = value;
  }

  int _RatingNumber = 0;
  int get RatingNumber => _RatingNumber;
  set RatingNumber(int value) {
    _RatingNumber = value;
  }

  List<String> _branchList = [' '];
  List<String> get branchList => _branchList;
  set branchList(List<String> value) {
    _branchList = value;
  }

  void addToBranchList(String value) {
    branchList.add(value);
  }

  void removeFromBranchList(String value) {
    branchList.remove(value);
  }

  void removeAtIndexFromBranchList(int index) {
    branchList.removeAt(index);
  }

  void updateBranchListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchList[index] = updateFn(_branchList[index]);
  }

  void insertAtIndexInBranchList(int index, String value) {
    branchList.insert(index, value);
  }

  String _branchGroup = 'ทั่วไป';
  String get branchGroup => _branchGroup;
  set branchGroup(String value) {
    _branchGroup = value;
  }

  List<String> _branchLat = ['Hello World'];
  List<String> get branchLat => _branchLat;
  set branchLat(List<String> value) {
    _branchLat = value;
  }

  void addToBranchLat(String value) {
    branchLat.add(value);
  }

  void removeFromBranchLat(String value) {
    branchLat.remove(value);
  }

  void removeAtIndexFromBranchLat(int index) {
    branchLat.removeAt(index);
  }

  void updateBranchLatAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchLat[index] = updateFn(_branchLat[index]);
  }

  void insertAtIndexInBranchLat(int index, String value) {
    branchLat.insert(index, value);
  }

  List<String> _branchLng = ['99'];
  List<String> get branchLng => _branchLng;
  set branchLng(List<String> value) {
    _branchLng = value;
  }

  void addToBranchLng(String value) {
    branchLng.add(value);
  }

  void removeFromBranchLng(String value) {
    branchLng.remove(value);
  }

  void removeAtIndexFromBranchLng(int index) {
    branchLng.removeAt(index);
  }

  void updateBranchLngAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchLng[index] = updateFn(_branchLng[index]);
  }

  void insertAtIndexInBranchLng(int index, String value) {
    branchLng.insert(index, value);
  }

  List<String> _branchRad = ['98'];
  List<String> get branchRad => _branchRad;
  set branchRad(List<String> value) {
    _branchRad = value;
  }

  void addToBranchRad(String value) {
    branchRad.add(value);
  }

  void removeFromBranchRad(String value) {
    branchRad.remove(value);
  }

  void removeAtIndexFromBranchRad(int index) {
    branchRad.removeAt(index);
  }

  void updateBranchRadAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchRad[index] = updateFn(_branchRad[index]);
  }

  void insertAtIndexInBranchRad(int index, String value) {
    branchRad.insert(index, value);
  }

  LatLng? _branchLo;
  LatLng? get branchLo => _branchLo;
  set branchLo(LatLng? value) {
    _branchLo = value;
  }

  String _currentTime = '';
  String get currentTime => _currentTime;
  set currentTime(String value) {
    _currentTime = value;
  }

  String _currentDate = '';
  String get currentDate => _currentDate;
  set currentDate(String value) {
    _currentDate = value;
  }

  double _currentRadius = 0.0;
  double get currentRadius => _currentRadius;
  set currentRadius(double value) {
    _currentRadius = value;
  }

  String _flag = '';
  String get flag => _flag;
  set flag(String value) {
    _flag = value;
  }

  String _branchLoString = '';
  String get branchLoString => _branchLoString;
  set branchLoString(String value) {
    _branchLoString = value;
  }

  List<String> _checkinStatusBranch = [];
  List<String> get checkinStatusBranch => _checkinStatusBranch;
  set checkinStatusBranch(List<String> value) {
    _checkinStatusBranch = value;
  }

  void addToCheckinStatusBranch(String value) {
    checkinStatusBranch.add(value);
  }

  void removeFromCheckinStatusBranch(String value) {
    checkinStatusBranch.remove(value);
  }

  void removeAtIndexFromCheckinStatusBranch(int index) {
    checkinStatusBranch.removeAt(index);
  }

  void updateCheckinStatusBranchAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusBranch[index] = updateFn(_checkinStatusBranch[index]);
  }

  void insertAtIndexInCheckinStatusBranch(int index, String value) {
    checkinStatusBranch.insert(index, value);
  }

  List<String> _checkinStatusDate = [];
  List<String> get checkinStatusDate => _checkinStatusDate;
  set checkinStatusDate(List<String> value) {
    _checkinStatusDate = value;
  }

  void addToCheckinStatusDate(String value) {
    checkinStatusDate.add(value);
  }

  void removeFromCheckinStatusDate(String value) {
    checkinStatusDate.remove(value);
  }

  void removeAtIndexFromCheckinStatusDate(int index) {
    checkinStatusDate.removeAt(index);
  }

  void updateCheckinStatusDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusDate[index] = updateFn(_checkinStatusDate[index]);
  }

  void insertAtIndexInCheckinStatusDate(int index, String value) {
    checkinStatusDate.insert(index, value);
  }

  List<String> _checkinStatusTime = [];
  List<String> get checkinStatusTime => _checkinStatusTime;
  set checkinStatusTime(List<String> value) {
    _checkinStatusTime = value;
  }

  void addToCheckinStatusTime(String value) {
    checkinStatusTime.add(value);
  }

  void removeFromCheckinStatusTime(String value) {
    checkinStatusTime.remove(value);
  }

  void removeAtIndexFromCheckinStatusTime(int index) {
    checkinStatusTime.removeAt(index);
  }

  void updateCheckinStatusTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusTime[index] = updateFn(_checkinStatusTime[index]);
  }

  void insertAtIndexInCheckinStatusTime(int index, String value) {
    checkinStatusTime.insert(index, value);
  }

  List<String> _checkinStatusAction = [];
  List<String> get checkinStatusAction => _checkinStatusAction;
  set checkinStatusAction(List<String> value) {
    _checkinStatusAction = value;
  }

  void addToCheckinStatusAction(String value) {
    checkinStatusAction.add(value);
  }

  void removeFromCheckinStatusAction(String value) {
    checkinStatusAction.remove(value);
  }

  void removeAtIndexFromCheckinStatusAction(int index) {
    checkinStatusAction.removeAt(index);
  }

  void updateCheckinStatusActionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusAction[index] = updateFn(_checkinStatusAction[index]);
  }

  void insertAtIndexInCheckinStatusAction(int index, String value) {
    checkinStatusAction.insert(index, value);
  }

  List<String> _checkinStatusTimeIn = [];
  List<String> get checkinStatusTimeIn => _checkinStatusTimeIn;
  set checkinStatusTimeIn(List<String> value) {
    _checkinStatusTimeIn = value;
  }

  void addToCheckinStatusTimeIn(String value) {
    checkinStatusTimeIn.add(value);
  }

  void removeFromCheckinStatusTimeIn(String value) {
    checkinStatusTimeIn.remove(value);
  }

  void removeAtIndexFromCheckinStatusTimeIn(int index) {
    checkinStatusTimeIn.removeAt(index);
  }

  void updateCheckinStatusTimeInAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusTimeIn[index] = updateFn(_checkinStatusTimeIn[index]);
  }

  void insertAtIndexInCheckinStatusTimeIn(int index, String value) {
    checkinStatusTimeIn.insert(index, value);
  }

  List<String> _checkinStatusTimeOut = [];
  List<String> get checkinStatusTimeOut => _checkinStatusTimeOut;
  set checkinStatusTimeOut(List<String> value) {
    _checkinStatusTimeOut = value;
  }

  void addToCheckinStatusTimeOut(String value) {
    checkinStatusTimeOut.add(value);
  }

  void removeFromCheckinStatusTimeOut(String value) {
    checkinStatusTimeOut.remove(value);
  }

  void removeAtIndexFromCheckinStatusTimeOut(int index) {
    checkinStatusTimeOut.removeAt(index);
  }

  void updateCheckinStatusTimeOutAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusTimeOut[index] = updateFn(_checkinStatusTimeOut[index]);
  }

  void insertAtIndexInCheckinStatusTimeOut(int index, String value) {
    checkinStatusTimeOut.insert(index, value);
  }

  List<String> _checkinStatusDateFlag = [];
  List<String> get checkinStatusDateFlag => _checkinStatusDateFlag;
  set checkinStatusDateFlag(List<String> value) {
    _checkinStatusDateFlag = value;
  }

  void addToCheckinStatusDateFlag(String value) {
    checkinStatusDateFlag.add(value);
  }

  void removeFromCheckinStatusDateFlag(String value) {
    checkinStatusDateFlag.remove(value);
  }

  void removeAtIndexFromCheckinStatusDateFlag(int index) {
    checkinStatusDateFlag.removeAt(index);
  }

  void updateCheckinStatusDateFlagAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinStatusDateFlag[index] = updateFn(_checkinStatusDateFlag[index]);
  }

  void insertAtIndexInCheckinStatusDateFlag(int index, String value) {
    checkinStatusDateFlag.insert(index, value);
  }

  List<Color> _checkinStatusColor = [
    Color(4278234623),
    Color(4287996332),
    Color(4278190080),
    Color(4294930688),
    Color(4294901760),
    Color(4294964234),
    Color(4281270016)
  ];
  List<Color> get checkinStatusColor => _checkinStatusColor;
  set checkinStatusColor(List<Color> value) {
    _checkinStatusColor = value;
  }

  void addToCheckinStatusColor(Color value) {
    checkinStatusColor.add(value);
  }

  void removeFromCheckinStatusColor(Color value) {
    checkinStatusColor.remove(value);
  }

  void removeAtIndexFromCheckinStatusColor(int index) {
    checkinStatusColor.removeAt(index);
  }

  void updateCheckinStatusColorAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    checkinStatusColor[index] = updateFn(_checkinStatusColor[index]);
  }

  void insertAtIndexInCheckinStatusColor(int index, Color value) {
    checkinStatusColor.insert(index, value);
  }

  List<String> _teleBrandName = [];
  List<String> get teleBrandName => _teleBrandName;
  set teleBrandName(List<String> value) {
    _teleBrandName = value;
  }

  void addToTeleBrandName(String value) {
    teleBrandName.add(value);
  }

  void removeFromTeleBrandName(String value) {
    teleBrandName.remove(value);
  }

  void removeAtIndexFromTeleBrandName(int index) {
    teleBrandName.removeAt(index);
  }

  void updateTeleBrandNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleBrandName[index] = updateFn(_teleBrandName[index]);
  }

  void insertAtIndexInTeleBrandName(int index, String value) {
    teleBrandName.insert(index, value);
  }

  List<String> _teleBrandType = [];
  List<String> get teleBrandType => _teleBrandType;
  set teleBrandType(List<String> value) {
    _teleBrandType = value;
  }

  void addToTeleBrandType(String value) {
    teleBrandType.add(value);
  }

  void removeFromTeleBrandType(String value) {
    teleBrandType.remove(value);
  }

  void removeAtIndexFromTeleBrandType(int index) {
    teleBrandType.removeAt(index);
  }

  void updateTeleBrandTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleBrandType[index] = updateFn(_teleBrandType[index]);
  }

  void insertAtIndexInTeleBrandType(int index, String value) {
    teleBrandType.insert(index, value);
  }

  List<String> _modelName = [];
  List<String> get modelName => _modelName;
  set modelName(List<String> value) {
    _modelName = value;
  }

  void addToModelName(String value) {
    modelName.add(value);
  }

  void removeFromModelName(String value) {
    modelName.remove(value);
  }

  void removeAtIndexFromModelName(int index) {
    modelName.removeAt(index);
  }

  void updateModelNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    modelName[index] = updateFn(_modelName[index]);
  }

  void insertAtIndexInModelName(int index, String value) {
    modelName.insert(index, value);
  }

  List<String> _teleYearDropdownOption = [
    '2546',
    '2547',
    '2548',
    '2549',
    '2550',
    '2551',
    '2552',
    '2553',
    '2554',
    '2555',
    '2556',
    '2557',
    '2558',
    '2559',
    '2560',
    '2561',
    '2562',
    '2563',
    '2564',
    '2565',
    '2566'
  ];
  List<String> get teleYearDropdownOption => _teleYearDropdownOption;
  set teleYearDropdownOption(List<String> value) {
    _teleYearDropdownOption = value;
  }

  void addToTeleYearDropdownOption(String value) {
    teleYearDropdownOption.add(value);
  }

  void removeFromTeleYearDropdownOption(String value) {
    teleYearDropdownOption.remove(value);
  }

  void removeAtIndexFromTeleYearDropdownOption(int index) {
    teleYearDropdownOption.removeAt(index);
  }

  void updateTeleYearDropdownOptionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleYearDropdownOption[index] = updateFn(_teleYearDropdownOption[index]);
  }

  void insertAtIndexInTeleYearDropdownOption(int index, String value) {
    teleYearDropdownOption.insert(index, value);
  }

  List<String> _teleGetProvince = [];
  List<String> get teleGetProvince => _teleGetProvince;
  set teleGetProvince(List<String> value) {
    _teleGetProvince = value;
  }

  void addToTeleGetProvince(String value) {
    teleGetProvince.add(value);
  }

  void removeFromTeleGetProvince(String value) {
    teleGetProvince.remove(value);
  }

  void removeAtIndexFromTeleGetProvince(int index) {
    teleGetProvince.removeAt(index);
  }

  void updateTeleGetProvinceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleGetProvince[index] = updateFn(_teleGetProvince[index]);
  }

  void insertAtIndexInTeleGetProvince(int index, String value) {
    teleGetProvince.insert(index, value);
  }

  List<String> _teleModelName = [];
  List<String> get teleModelName => _teleModelName;
  set teleModelName(List<String> value) {
    _teleModelName = value;
  }

  void addToTeleModelName(String value) {
    teleModelName.add(value);
  }

  void removeFromTeleModelName(String value) {
    teleModelName.remove(value);
  }

  void removeAtIndexFromTeleModelName(int index) {
    teleModelName.removeAt(index);
  }

  void updateTeleModelNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleModelName[index] = updateFn(_teleModelName[index]);
  }

  void insertAtIndexInTeleModelName(int index, String value) {
    teleModelName.insert(index, value);
  }

  List<String> _coverTypeName = [];
  List<String> get coverTypeName => _coverTypeName;
  set coverTypeName(List<String> value) {
    _coverTypeName = value;
  }

  void addToCoverTypeName(String value) {
    coverTypeName.add(value);
  }

  void removeFromCoverTypeName(String value) {
    coverTypeName.remove(value);
  }

  void removeAtIndexFromCoverTypeName(int index) {
    coverTypeName.removeAt(index);
  }

  void updateCoverTypeNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    coverTypeName[index] = updateFn(_coverTypeName[index]);
  }

  void insertAtIndexInCoverTypeName(int index, String value) {
    coverTypeName.insert(index, value);
  }

  List<String> _coverTypeCode = [];
  List<String> get coverTypeCode => _coverTypeCode;
  set coverTypeCode(List<String> value) {
    _coverTypeCode = value;
  }

  void addToCoverTypeCode(String value) {
    coverTypeCode.add(value);
  }

  void removeFromCoverTypeCode(String value) {
    coverTypeCode.remove(value);
  }

  void removeAtIndexFromCoverTypeCode(int index) {
    coverTypeCode.removeAt(index);
  }

  void updateCoverTypeCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    coverTypeCode[index] = updateFn(_coverTypeCode[index]);
  }

  void insertAtIndexInCoverTypeCode(int index, String value) {
    coverTypeCode.insert(index, value);
  }

  List<String> _insurerFullNameList = [];
  List<String> get insurerFullNameList => _insurerFullNameList;
  set insurerFullNameList(List<String> value) {
    _insurerFullNameList = value;
  }

  void addToInsurerFullNameList(String value) {
    insurerFullNameList.add(value);
  }

  void removeFromInsurerFullNameList(String value) {
    insurerFullNameList.remove(value);
  }

  void removeAtIndexFromInsurerFullNameList(int index) {
    insurerFullNameList.removeAt(index);
  }

  void updateInsurerFullNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insurerFullNameList[index] = updateFn(_insurerFullNameList[index]);
  }

  void insertAtIndexInInsurerFullNameList(int index, String value) {
    insurerFullNameList.insert(index, value);
  }

  String _garageTypeEng = '';
  String get garageTypeEng => _garageTypeEng;
  set garageTypeEng(String value) {
    _garageTypeEng = value;
  }

  List<String> _coverTypeNameChosen = [];
  List<String> get coverTypeNameChosen => _coverTypeNameChosen;
  set coverTypeNameChosen(List<String> value) {
    _coverTypeNameChosen = value;
  }

  void addToCoverTypeNameChosen(String value) {
    coverTypeNameChosen.add(value);
  }

  void removeFromCoverTypeNameChosen(String value) {
    coverTypeNameChosen.remove(value);
  }

  void removeAtIndexFromCoverTypeNameChosen(int index) {
    coverTypeNameChosen.removeAt(index);
  }

  void updateCoverTypeNameChosenAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    coverTypeNameChosen[index] = updateFn(_coverTypeNameChosen[index]);
  }

  void insertAtIndexInCoverTypeNameChosen(int index, String value) {
    coverTypeNameChosen.insert(index, value);
  }

  List<String> _insurerNameChosen = [];
  List<String> get insurerNameChosen => _insurerNameChosen;
  set insurerNameChosen(List<String> value) {
    _insurerNameChosen = value;
  }

  void addToInsurerNameChosen(String value) {
    insurerNameChosen.add(value);
  }

  void removeFromInsurerNameChosen(String value) {
    insurerNameChosen.remove(value);
  }

  void removeAtIndexFromInsurerNameChosen(int index) {
    insurerNameChosen.removeAt(index);
  }

  void updateInsurerNameChosenAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insurerNameChosen[index] = updateFn(_insurerNameChosen[index]);
  }

  void insertAtIndexInInsurerNameChosen(int index, String value) {
    insurerNameChosen.insert(index, value);
  }

  int _sumInsuredChosen = 0;
  int get sumInsuredChosen => _sumInsuredChosen;
  set sumInsuredChosen(int value) {
    _sumInsuredChosen = value;
  }

  List<String> _teleBrandID = [];
  List<String> get teleBrandID => _teleBrandID;
  set teleBrandID(List<String> value) {
    _teleBrandID = value;
  }

  void addToTeleBrandID(String value) {
    teleBrandID.add(value);
  }

  void removeFromTeleBrandID(String value) {
    teleBrandID.remove(value);
  }

  void removeAtIndexFromTeleBrandID(int index) {
    teleBrandID.removeAt(index);
  }

  void updateTeleBrandIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleBrandID[index] = updateFn(_teleBrandID[index]);
  }

  void insertAtIndexInTeleBrandID(int index, String value) {
    teleBrandID.insert(index, value);
  }

  List<String> _teleModelCode = [];
  List<String> get teleModelCode => _teleModelCode;
  set teleModelCode(List<String> value) {
    _teleModelCode = value;
  }

  void addToTeleModelCode(String value) {
    teleModelCode.add(value);
  }

  void removeFromTeleModelCode(String value) {
    teleModelCode.remove(value);
  }

  void removeAtIndexFromTeleModelCode(int index) {
    teleModelCode.removeAt(index);
  }

  void updateTeleModelCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleModelCode[index] = updateFn(_teleModelCode[index]);
  }

  void insertAtIndexInTeleModelCode(int index, String value) {
    teleModelCode.insert(index, value);
  }

  List<String> _teleModelBrandID = [];
  List<String> get teleModelBrandID => _teleModelBrandID;
  set teleModelBrandID(List<String> value) {
    _teleModelBrandID = value;
  }

  void addToTeleModelBrandID(String value) {
    teleModelBrandID.add(value);
  }

  void removeFromTeleModelBrandID(String value) {
    teleModelBrandID.remove(value);
  }

  void removeAtIndexFromTeleModelBrandID(int index) {
    teleModelBrandID.removeAt(index);
  }

  void updateTeleModelBrandIDAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleModelBrandID[index] = updateFn(_teleModelBrandID[index]);
  }

  void insertAtIndexInTeleModelBrandID(int index, String value) {
    teleModelBrandID.insert(index, value);
  }

  List<String> _companyId = [];
  List<String> get companyId => _companyId;
  set companyId(List<String> value) {
    _companyId = value;
  }

  void addToCompanyId(String value) {
    companyId.add(value);
  }

  void removeFromCompanyId(String value) {
    companyId.remove(value);
  }

  void removeAtIndexFromCompanyId(int index) {
    companyId.removeAt(index);
  }

  void updateCompanyIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    companyId[index] = updateFn(_companyId[index]);
  }

  void insertAtIndexInCompanyId(int index, String value) {
    companyId.insert(index, value);
  }

  bool _teleSearchModelState = false;
  bool get teleSearchModelState => _teleSearchModelState;
  set teleSearchModelState(bool value) {
    _teleSearchModelState = value;
  }

  List<String> _searchFullName = [];
  List<String> get searchFullName => _searchFullName;
  set searchFullName(List<String> value) {
    _searchFullName = value;
  }

  void addToSearchFullName(String value) {
    searchFullName.add(value);
  }

  void removeFromSearchFullName(String value) {
    searchFullName.remove(value);
  }

  void removeAtIndexFromSearchFullName(int index) {
    searchFullName.removeAt(index);
  }

  void updateSearchFullNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchFullName[index] = updateFn(_searchFullName[index]);
  }

  void insertAtIndexInSearchFullName(int index, String value) {
    searchFullName.insert(index, value);
  }

  List<String> _searchCoverType = [];
  List<String> get searchCoverType => _searchCoverType;
  set searchCoverType(List<String> value) {
    _searchCoverType = value;
  }

  void addToSearchCoverType(String value) {
    searchCoverType.add(value);
  }

  void removeFromSearchCoverType(String value) {
    searchCoverType.remove(value);
  }

  void removeAtIndexFromSearchCoverType(int index) {
    searchCoverType.removeAt(index);
  }

  void updateSearchCoverTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchCoverType[index] = updateFn(_searchCoverType[index]);
  }

  void insertAtIndexInSearchCoverType(int index, String value) {
    searchCoverType.insert(index, value);
  }

  List<String> _searchGarageType = [];
  List<String> get searchGarageType => _searchGarageType;
  set searchGarageType(List<String> value) {
    _searchGarageType = value;
  }

  void addToSearchGarageType(String value) {
    searchGarageType.add(value);
  }

  void removeFromSearchGarageType(String value) {
    searchGarageType.remove(value);
  }

  void removeAtIndexFromSearchGarageType(int index) {
    searchGarageType.removeAt(index);
  }

  void updateSearchGarageTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchGarageType[index] = updateFn(_searchGarageType[index]);
  }

  void insertAtIndexInSearchGarageType(int index, String value) {
    searchGarageType.insert(index, value);
  }

  List<String> _searchGrossTotal = [];
  List<String> get searchGrossTotal => _searchGrossTotal;
  set searchGrossTotal(List<String> value) {
    _searchGrossTotal = value;
  }

  void addToSearchGrossTotal(String value) {
    searchGrossTotal.add(value);
  }

  void removeFromSearchGrossTotal(String value) {
    searchGrossTotal.remove(value);
  }

  void removeAtIndexFromSearchGrossTotal(int index) {
    searchGrossTotal.removeAt(index);
  }

  void updateSearchGrossTotalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchGrossTotal[index] = updateFn(_searchGrossTotal[index]);
  }

  void insertAtIndexInSearchGrossTotal(int index, String value) {
    searchGrossTotal.insert(index, value);
  }

  List<String> _searchSumInsured = [];
  List<String> get searchSumInsured => _searchSumInsured;
  set searchSumInsured(List<String> value) {
    _searchSumInsured = value;
  }

  void addToSearchSumInsured(String value) {
    searchSumInsured.add(value);
  }

  void removeFromSearchSumInsured(String value) {
    searchSumInsured.remove(value);
  }

  void removeAtIndexFromSearchSumInsured(int index) {
    searchSumInsured.removeAt(index);
  }

  void updateSearchSumInsuredAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchSumInsured[index] = updateFn(_searchSumInsured[index]);
  }

  void insertAtIndexInSearchSumInsured(int index, String value) {
    searchSumInsured.insert(index, value);
  }

  List<String> _searchTppd = [];
  List<String> get searchTppd => _searchTppd;
  set searchTppd(List<String> value) {
    _searchTppd = value;
  }

  void addToSearchTppd(String value) {
    searchTppd.add(value);
  }

  void removeFromSearchTppd(String value) {
    searchTppd.remove(value);
  }

  void removeAtIndexFromSearchTppd(int index) {
    searchTppd.removeAt(index);
  }

  void updateSearchTppdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchTppd[index] = updateFn(_searchTppd[index]);
  }

  void insertAtIndexInSearchTppd(int index, String value) {
    searchTppd.insert(index, value);
  }

  List<String> _searchPa = [];
  List<String> get searchPa => _searchPa;
  set searchPa(List<String> value) {
    _searchPa = value;
  }

  void addToSearchPa(String value) {
    searchPa.add(value);
  }

  void removeFromSearchPa(String value) {
    searchPa.remove(value);
  }

  void removeAtIndexFromSearchPa(int index) {
    searchPa.removeAt(index);
  }

  void updateSearchPaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchPa[index] = updateFn(_searchPa[index]);
  }

  void insertAtIndexInSearchPa(int index, String value) {
    searchPa.insert(index, value);
  }

  List<String> _searchExpDate = [];
  List<String> get searchExpDate => _searchExpDate;
  set searchExpDate(List<String> value) {
    _searchExpDate = value;
  }

  void addToSearchExpDate(String value) {
    searchExpDate.add(value);
  }

  void removeFromSearchExpDate(String value) {
    searchExpDate.remove(value);
  }

  void removeAtIndexFromSearchExpDate(int index) {
    searchExpDate.removeAt(index);
  }

  void updateSearchExpDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchExpDate[index] = updateFn(_searchExpDate[index]);
  }

  void insertAtIndexInSearchExpDate(int index, String value) {
    searchExpDate.insert(index, value);
  }

  String _garageChosen = '';
  String get garageChosen => _garageChosen;
  set garageChosen(String value) {
    _garageChosen = value;
  }

  List<String> _actAmount = [];
  List<String> get actAmount => _actAmount;
  set actAmount(List<String> value) {
    _actAmount = value;
  }

  void addToActAmount(String value) {
    actAmount.add(value);
  }

  void removeFromActAmount(String value) {
    actAmount.remove(value);
  }

  void removeAtIndexFromActAmount(int index) {
    actAmount.removeAt(index);
  }

  void updateActAmountAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    actAmount[index] = updateFn(_actAmount[index]);
  }

  void insertAtIndexInActAmount(int index, String value) {
    actAmount.insert(index, value);
  }

  List<String> _searchActAmount = [];
  List<String> get searchActAmount => _searchActAmount;
  set searchActAmount(List<String> value) {
    _searchActAmount = value;
  }

  void addToSearchActAmount(String value) {
    searchActAmount.add(value);
  }

  void removeFromSearchActAmount(String value) {
    searchActAmount.remove(value);
  }

  void removeAtIndexFromSearchActAmount(int index) {
    searchActAmount.removeAt(index);
  }

  void updateSearchActAmountAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchActAmount[index] = updateFn(_searchActAmount[index]);
  }

  void insertAtIndexInSearchActAmount(int index, String value) {
    searchActAmount.insert(index, value);
  }

  List<String> _teleADYearDropdown = [
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018 ',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023'
  ];
  List<String> get teleADYearDropdown => _teleADYearDropdown;
  set teleADYearDropdown(List<String> value) {
    _teleADYearDropdown = value;
  }

  void addToTeleADYearDropdown(String value) {
    teleADYearDropdown.add(value);
  }

  void removeFromTeleADYearDropdown(String value) {
    teleADYearDropdown.remove(value);
  }

  void removeAtIndexFromTeleADYearDropdown(int index) {
    teleADYearDropdown.removeAt(index);
  }

  void updateTeleADYearDropdownAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleADYearDropdown[index] = updateFn(_teleADYearDropdown[index]);
  }

  void insertAtIndexInTeleADYearDropdown(int index, String value) {
    teleADYearDropdown.insert(index, value);
  }

  List<String> _searchSerialName = [];
  List<String> get searchSerialName => _searchSerialName;
  set searchSerialName(List<String> value) {
    _searchSerialName = value;
  }

  void addToSearchSerialName(String value) {
    searchSerialName.add(value);
  }

  void removeFromSearchSerialName(String value) {
    searchSerialName.remove(value);
  }

  void removeAtIndexFromSearchSerialName(int index) {
    searchSerialName.removeAt(index);
  }

  void updateSearchSerialNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchSerialName[index] = updateFn(_searchSerialName[index]);
  }

  void insertAtIndexInSearchSerialName(int index, String value) {
    searchSerialName.insert(index, value);
  }

  double _sumInsuredChoosenDouble = 0.0;
  double get sumInsuredChoosenDouble => _sumInsuredChoosenDouble;
  set sumInsuredChoosenDouble(double value) {
    _sumInsuredChoosenDouble = value;
  }

  List<String> _kpiProductType = ['M', 'CTV', 'HL'];
  List<String> get kpiProductType => _kpiProductType;
  set kpiProductType(List<String> value) {
    _kpiProductType = value;
  }

  void addToKpiProductType(String value) {
    kpiProductType.add(value);
  }

  void removeFromKpiProductType(String value) {
    kpiProductType.remove(value);
  }

  void removeAtIndexFromKpiProductType(int index) {
    kpiProductType.removeAt(index);
  }

  void updateKpiProductTypeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiProductType[index] = updateFn(_kpiProductType[index]);
  }

  void insertAtIndexInKpiProductType(int index, String value) {
    kpiProductType.insert(index, value);
  }

  List<String> _kpiEmployeePosition = [
    '[position]',
    '[position]',
    '[position]'
  ];
  List<String> get kpiEmployeePosition => _kpiEmployeePosition;
  set kpiEmployeePosition(List<String> value) {
    _kpiEmployeePosition = value;
  }

  void addToKpiEmployeePosition(String value) {
    kpiEmployeePosition.add(value);
  }

  void removeFromKpiEmployeePosition(String value) {
    kpiEmployeePosition.remove(value);
  }

  void removeAtIndexFromKpiEmployeePosition(int index) {
    kpiEmployeePosition.removeAt(index);
  }

  void updateKpiEmployeePositionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiEmployeePosition[index] = updateFn(_kpiEmployeePosition[index]);
  }

  void insertAtIndexInKpiEmployeePosition(int index, String value) {
    kpiEmployeePosition.insert(index, value);
  }

  List<String> _kpiActual = ['0.0', '0.0', '0.0'];
  List<String> get kpiActual => _kpiActual;
  set kpiActual(List<String> value) {
    _kpiActual = value;
  }

  void addToKpiActual(String value) {
    kpiActual.add(value);
  }

  void removeFromKpiActual(String value) {
    kpiActual.remove(value);
  }

  void removeAtIndexFromKpiActual(int index) {
    kpiActual.removeAt(index);
  }

  void updateKpiActualAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiActual[index] = updateFn(_kpiActual[index]);
  }

  void insertAtIndexInKpiActual(int index, String value) {
    kpiActual.insert(index, value);
  }

  List<String> _kpiTargetQuantity = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantity => _kpiTargetQuantity;
  set kpiTargetQuantity(List<String> value) {
    _kpiTargetQuantity = value;
  }

  void addToKpiTargetQuantity(String value) {
    kpiTargetQuantity.add(value);
  }

  void removeFromKpiTargetQuantity(String value) {
    kpiTargetQuantity.remove(value);
  }

  void removeAtIndexFromKpiTargetQuantity(int index) {
    kpiTargetQuantity.removeAt(index);
  }

  void updateKpiTargetQuantityAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiTargetQuantity[index] = updateFn(_kpiTargetQuantity[index]);
  }

  void insertAtIndexInKpiTargetQuantity(int index, String value) {
    kpiTargetQuantity.insert(index, value);
  }

  List<String> _kpiYearMonth = ['2022-12', '2022-12', '2022-12'];
  List<String> get kpiYearMonth => _kpiYearMonth;
  set kpiYearMonth(List<String> value) {
    _kpiYearMonth = value;
  }

  void addToKpiYearMonth(String value) {
    kpiYearMonth.add(value);
  }

  void removeFromKpiYearMonth(String value) {
    kpiYearMonth.remove(value);
  }

  void removeAtIndexFromKpiYearMonth(int index) {
    kpiYearMonth.removeAt(index);
  }

  void updateKpiYearMonthAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiYearMonth[index] = updateFn(_kpiYearMonth[index]);
  }

  void insertAtIndexInKpiYearMonth(int index, String value) {
    kpiYearMonth.insert(index, value);
  }

  String _kpiTargetBudget = '100.00';
  String get kpiTargetBudget => _kpiTargetBudget;
  set kpiTargetBudget(String value) {
    _kpiTargetBudget = value;
  }

  String _kpiActualBudget = '0.00';
  String get kpiActualBudget => _kpiActualBudget;
  set kpiActualBudget(String value) {
    _kpiActualBudget = value;
  }

  DateTime? _DateHoliday;
  DateTime? get DateHoliday => _DateHoliday;
  set DateHoliday(DateTime? value) {
    _DateHoliday = value;
  }

  DateTime? _DateExpHoliday;
  DateTime? get DateExpHoliday => _DateExpHoliday;
  set DateExpHoliday(DateTime? value) {
    _DateExpHoliday = value;
  }

  DateTime? _DateHolidayNotShow;
  DateTime? get DateHolidayNotShow => _DateHolidayNotShow;
  set DateHolidayNotShow(DateTime? value) {
    _DateHolidayNotShow = value;
    value != null
        ? secureStorage.setInt(
            'ff_DateHolidayNotShow', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_DateHolidayNotShow');
  }

  void deleteDateHolidayNotShow() {
    secureStorage.delete(key: 'ff_DateHolidayNotShow');
  }

  bool _isLoadedInsuranceData = false;
  bool get isLoadedInsuranceData => _isLoadedInsuranceData;
  set isLoadedInsuranceData(bool value) {
    _isLoadedInsuranceData = value;
  }

  List<String> _leaveWorkId = [];
  List<String> get leaveWorkId => _leaveWorkId;
  set leaveWorkId(List<String> value) {
    _leaveWorkId = value;
  }

  void addToLeaveWorkId(String value) {
    leaveWorkId.add(value);
  }

  void removeFromLeaveWorkId(String value) {
    leaveWorkId.remove(value);
  }

  void removeAtIndexFromLeaveWorkId(int index) {
    leaveWorkId.removeAt(index);
  }

  void updateLeaveWorkIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveWorkId[index] = updateFn(_leaveWorkId[index]);
  }

  void insertAtIndexInLeaveWorkId(int index, String value) {
    leaveWorkId.insert(index, value);
  }

  List<String> _leaveWorkDay = [];
  List<String> get leaveWorkDay => _leaveWorkDay;
  set leaveWorkDay(List<String> value) {
    _leaveWorkDay = value;
  }

  void addToLeaveWorkDay(String value) {
    leaveWorkDay.add(value);
  }

  void removeFromLeaveWorkDay(String value) {
    leaveWorkDay.remove(value);
  }

  void removeAtIndexFromLeaveWorkDay(int index) {
    leaveWorkDay.removeAt(index);
  }

  void updateLeaveWorkDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveWorkDay[index] = updateFn(_leaveWorkDay[index]);
  }

  void insertAtIndexInLeaveWorkDay(int index, String value) {
    leaveWorkDay.insert(index, value);
  }

  List<String> _checkinLastMonthDate = [];
  List<String> get checkinLastMonthDate => _checkinLastMonthDate;
  set checkinLastMonthDate(List<String> value) {
    _checkinLastMonthDate = value;
  }

  void addToCheckinLastMonthDate(String value) {
    checkinLastMonthDate.add(value);
  }

  void removeFromCheckinLastMonthDate(String value) {
    checkinLastMonthDate.remove(value);
  }

  void removeAtIndexFromCheckinLastMonthDate(int index) {
    checkinLastMonthDate.removeAt(index);
  }

  void updateCheckinLastMonthDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinLastMonthDate[index] = updateFn(_checkinLastMonthDate[index]);
  }

  void insertAtIndexInCheckinLastMonthDate(int index, String value) {
    checkinLastMonthDate.insert(index, value);
  }

  List<String> _checkinLastMonthTimeIn = [];
  List<String> get checkinLastMonthTimeIn => _checkinLastMonthTimeIn;
  set checkinLastMonthTimeIn(List<String> value) {
    _checkinLastMonthTimeIn = value;
  }

  void addToCheckinLastMonthTimeIn(String value) {
    checkinLastMonthTimeIn.add(value);
  }

  void removeFromCheckinLastMonthTimeIn(String value) {
    checkinLastMonthTimeIn.remove(value);
  }

  void removeAtIndexFromCheckinLastMonthTimeIn(int index) {
    checkinLastMonthTimeIn.removeAt(index);
  }

  void updateCheckinLastMonthTimeInAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinLastMonthTimeIn[index] = updateFn(_checkinLastMonthTimeIn[index]);
  }

  void insertAtIndexInCheckinLastMonthTimeIn(int index, String value) {
    checkinLastMonthTimeIn.insert(index, value);
  }

  List<String> _checkinLastMonthTimeOut = [];
  List<String> get checkinLastMonthTimeOut => _checkinLastMonthTimeOut;
  set checkinLastMonthTimeOut(List<String> value) {
    _checkinLastMonthTimeOut = value;
  }

  void addToCheckinLastMonthTimeOut(String value) {
    checkinLastMonthTimeOut.add(value);
  }

  void removeFromCheckinLastMonthTimeOut(String value) {
    checkinLastMonthTimeOut.remove(value);
  }

  void removeAtIndexFromCheckinLastMonthTimeOut(int index) {
    checkinLastMonthTimeOut.removeAt(index);
  }

  void updateCheckinLastMonthTimeOutAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    checkinLastMonthTimeOut[index] = updateFn(_checkinLastMonthTimeOut[index]);
  }

  void insertAtIndexInCheckinLastMonthTimeOut(int index, String value) {
    checkinLastMonthTimeOut.insert(index, value);
  }

  String _endLeaveDayString = '';
  String get endLeaveDayString => _endLeaveDayString;
  set endLeaveDayString(String value) {
    _endLeaveDayString = value;
  }

  List<String> _leaveTypeName = [];
  List<String> get leaveTypeName => _leaveTypeName;
  set leaveTypeName(List<String> value) {
    _leaveTypeName = value;
  }

  void addToLeaveTypeName(String value) {
    leaveTypeName.add(value);
  }

  void removeFromLeaveTypeName(String value) {
    leaveTypeName.remove(value);
  }

  void removeAtIndexFromLeaveTypeName(int index) {
    leaveTypeName.removeAt(index);
  }

  void updateLeaveTypeNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveTypeName[index] = updateFn(_leaveTypeName[index]);
  }

  void insertAtIndexInLeaveTypeName(int index, String value) {
    leaveTypeName.insert(index, value);
  }

  String _areaResponsKPI = '[area_curent_month]';
  String get areaResponsKPI => _areaResponsKPI;
  set areaResponsKPI(String value) {
    _areaResponsKPI = value;
  }

  List<Color> _kpiGaugeColorListMain = [
    Color(4280103167),
    Color(4294960896),
    Color(4287299839)
  ];
  List<Color> get kpiGaugeColorListMain => _kpiGaugeColorListMain;
  set kpiGaugeColorListMain(List<Color> value) {
    _kpiGaugeColorListMain = value;
  }

  void addToKpiGaugeColorListMain(Color value) {
    kpiGaugeColorListMain.add(value);
  }

  void removeFromKpiGaugeColorListMain(Color value) {
    kpiGaugeColorListMain.remove(value);
  }

  void removeAtIndexFromKpiGaugeColorListMain(int index) {
    kpiGaugeColorListMain.removeAt(index);
  }

  void updateKpiGaugeColorListMainAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    kpiGaugeColorListMain[index] = updateFn(_kpiGaugeColorListMain[index]);
  }

  void insertAtIndexInKpiGaugeColorListMain(int index, Color value) {
    kpiGaugeColorListMain.insert(index, value);
  }

  List<Color> _kpiGaugeColorList2 = [
    Color(4278254079),
    Color(4294927616),
    Color(4294793471)
  ];
  List<Color> get kpiGaugeColorList2 => _kpiGaugeColorList2;
  set kpiGaugeColorList2(List<Color> value) {
    _kpiGaugeColorList2 = value;
  }

  void addToKpiGaugeColorList2(Color value) {
    kpiGaugeColorList2.add(value);
  }

  void removeFromKpiGaugeColorList2(Color value) {
    kpiGaugeColorList2.remove(value);
  }

  void removeAtIndexFromKpiGaugeColorList2(int index) {
    kpiGaugeColorList2.removeAt(index);
  }

  void updateKpiGaugeColorList2AtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    kpiGaugeColorList2[index] = updateFn(_kpiGaugeColorList2[index]);
  }

  void insertAtIndexInKpiGaugeColorList2(int index, Color value) {
    kpiGaugeColorList2.insert(index, value);
  }

  bool _checkAllowLeaveDay = false;
  bool get checkAllowLeaveDay => _checkAllowLeaveDay;
  set checkAllowLeaveDay(bool value) {
    _checkAllowLeaveDay = value;
  }

  List<String> _kpiProductTypeLM = ['M', 'CTV', 'HL'];
  List<String> get kpiProductTypeLM => _kpiProductTypeLM;
  set kpiProductTypeLM(List<String> value) {
    _kpiProductTypeLM = value;
  }

  void addToKpiProductTypeLM(String value) {
    kpiProductTypeLM.add(value);
  }

  void removeFromKpiProductTypeLM(String value) {
    kpiProductTypeLM.remove(value);
  }

  void removeAtIndexFromKpiProductTypeLM(int index) {
    kpiProductTypeLM.removeAt(index);
  }

  void updateKpiProductTypeLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiProductTypeLM[index] = updateFn(_kpiProductTypeLM[index]);
  }

  void insertAtIndexInKpiProductTypeLM(int index, String value) {
    kpiProductTypeLM.insert(index, value);
  }

  List<String> _kpiEmployeePositionLM = ['position', 'position', 'position'];
  List<String> get kpiEmployeePositionLM => _kpiEmployeePositionLM;
  set kpiEmployeePositionLM(List<String> value) {
    _kpiEmployeePositionLM = value;
  }

  void addToKpiEmployeePositionLM(String value) {
    kpiEmployeePositionLM.add(value);
  }

  void removeFromKpiEmployeePositionLM(String value) {
    kpiEmployeePositionLM.remove(value);
  }

  void removeAtIndexFromKpiEmployeePositionLM(int index) {
    kpiEmployeePositionLM.removeAt(index);
  }

  void updateKpiEmployeePositionLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiEmployeePositionLM[index] = updateFn(_kpiEmployeePositionLM[index]);
  }

  void insertAtIndexInKpiEmployeePositionLM(int index, String value) {
    kpiEmployeePositionLM.insert(index, value);
  }

  List<String> _kpiActualLM = ['0.0', '0.0', '0.0'];
  List<String> get kpiActualLM => _kpiActualLM;
  set kpiActualLM(List<String> value) {
    _kpiActualLM = value;
  }

  void addToKpiActualLM(String value) {
    kpiActualLM.add(value);
  }

  void removeFromKpiActualLM(String value) {
    kpiActualLM.remove(value);
  }

  void removeAtIndexFromKpiActualLM(int index) {
    kpiActualLM.removeAt(index);
  }

  void updateKpiActualLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiActualLM[index] = updateFn(_kpiActualLM[index]);
  }

  void insertAtIndexInKpiActualLM(int index, String value) {
    kpiActualLM.insert(index, value);
  }

  List<String> _kpiTargetQuantityLM = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantityLM => _kpiTargetQuantityLM;
  set kpiTargetQuantityLM(List<String> value) {
    _kpiTargetQuantityLM = value;
  }

  void addToKpiTargetQuantityLM(String value) {
    kpiTargetQuantityLM.add(value);
  }

  void removeFromKpiTargetQuantityLM(String value) {
    kpiTargetQuantityLM.remove(value);
  }

  void removeAtIndexFromKpiTargetQuantityLM(int index) {
    kpiTargetQuantityLM.removeAt(index);
  }

  void updateKpiTargetQuantityLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiTargetQuantityLM[index] = updateFn(_kpiTargetQuantityLM[index]);
  }

  void insertAtIndexInKpiTargetQuantityLM(int index, String value) {
    kpiTargetQuantityLM.insert(index, value);
  }

  List<String> _kpiYearMonthLM = ['2022-11', '2022-11', '2022-11'];
  List<String> get kpiYearMonthLM => _kpiYearMonthLM;
  set kpiYearMonthLM(List<String> value) {
    _kpiYearMonthLM = value;
  }

  void addToKpiYearMonthLM(String value) {
    kpiYearMonthLM.add(value);
  }

  void removeFromKpiYearMonthLM(String value) {
    kpiYearMonthLM.remove(value);
  }

  void removeAtIndexFromKpiYearMonthLM(int index) {
    kpiYearMonthLM.removeAt(index);
  }

  void updateKpiYearMonthLMAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    kpiYearMonthLM[index] = updateFn(_kpiYearMonthLM[index]);
  }

  void insertAtIndexInKpiYearMonthLM(int index, String value) {
    kpiYearMonthLM.insert(index, value);
  }

  String _kpiTargetBudgetLM = '100.00';
  String get kpiTargetBudgetLM => _kpiTargetBudgetLM;
  set kpiTargetBudgetLM(String value) {
    _kpiTargetBudgetLM = value;
  }

  String _kpiActualBudgetLM = '0.00';
  String get kpiActualBudgetLM => _kpiActualBudgetLM;
  set kpiActualBudgetLM(String value) {
    _kpiActualBudgetLM = value;
  }

  List<String> _countLeave = [];
  List<String> get countLeave => _countLeave;
  set countLeave(List<String> value) {
    _countLeave = value;
  }

  void addToCountLeave(String value) {
    countLeave.add(value);
  }

  void removeFromCountLeave(String value) {
    countLeave.remove(value);
  }

  void removeAtIndexFromCountLeave(int index) {
    countLeave.removeAt(index);
  }

  void updateCountLeaveAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    countLeave[index] = updateFn(_countLeave[index]);
  }

  void insertAtIndexInCountLeave(int index, String value) {
    countLeave.insert(index, value);
  }

  List<String> _totalLeave = [];
  List<String> get totalLeave => _totalLeave;
  set totalLeave(List<String> value) {
    _totalLeave = value;
  }

  void addToTotalLeave(String value) {
    totalLeave.add(value);
  }

  void removeFromTotalLeave(String value) {
    totalLeave.remove(value);
  }

  void removeAtIndexFromTotalLeave(int index) {
    totalLeave.removeAt(index);
  }

  void updateTotalLeaveAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    totalLeave[index] = updateFn(_totalLeave[index]);
  }

  void insertAtIndexInTotalLeave(int index, String value) {
    totalLeave.insert(index, value);
  }

  List<String> _statusCheckCount = [];
  List<String> get statusCheckCount => _statusCheckCount;
  set statusCheckCount(List<String> value) {
    _statusCheckCount = value;
  }

  void addToStatusCheckCount(String value) {
    statusCheckCount.add(value);
  }

  void removeFromStatusCheckCount(String value) {
    statusCheckCount.remove(value);
  }

  void removeAtIndexFromStatusCheckCount(int index) {
    statusCheckCount.removeAt(index);
  }

  void updateStatusCheckCountAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    statusCheckCount[index] = updateFn(_statusCheckCount[index]);
  }

  void insertAtIndexInStatusCheckCount(int index, String value) {
    statusCheckCount.insert(index, value);
  }

  String _kpiAreaResponsLM = '[area_last_month]';
  String get kpiAreaResponsLM => _kpiAreaResponsLM;
  set kpiAreaResponsLM(String value) {
    _kpiAreaResponsLM = value;
  }

  bool _allowFileUpload = false;
  bool get allowFileUpload => _allowFileUpload;
  set allowFileUpload(bool value) {
    _allowFileUpload = value;
  }

  String _leaveDaysLocal = '0.5';
  String get leaveDaysLocal => _leaveDaysLocal;
  set leaveDaysLocal(String value) {
    _leaveDaysLocal = value;
  }

  double _leaveDaysDouble = 0.5;
  double get leaveDaysDouble => _leaveDaysDouble;
  set leaveDaysDouble(double value) {
    _leaveDaysDouble = value;
  }

  String _leaveListID = 'leave_list_id';
  String get leaveListID => _leaveListID;
  set leaveListID(String value) {
    _leaveListID = value;
  }

  String _ProfilePhoneNumber = '';
  String get ProfilePhoneNumber => _ProfilePhoneNumber;
  set ProfilePhoneNumber(String value) {
    _ProfilePhoneNumber = value;
  }

  String _profileFirstBossEmpID = '';
  String get profileFirstBossEmpID => _profileFirstBossEmpID;
  set profileFirstBossEmpID(String value) {
    _profileFirstBossEmpID = value;
  }

  String _profileSecondBossEmpID = '';
  String get profileSecondBossEmpID => _profileSecondBossEmpID;
  set profileSecondBossEmpID(String value) {
    _profileSecondBossEmpID = value;
  }

  List<String> _leaveDocImgPathList = [];
  List<String> get leaveDocImgPathList => _leaveDocImgPathList;
  set leaveDocImgPathList(List<String> value) {
    _leaveDocImgPathList = value;
  }

  void addToLeaveDocImgPathList(String value) {
    leaveDocImgPathList.add(value);
  }

  void removeFromLeaveDocImgPathList(String value) {
    leaveDocImgPathList.remove(value);
  }

  void removeAtIndexFromLeaveDocImgPathList(int index) {
    leaveDocImgPathList.removeAt(index);
  }

  void updateLeaveDocImgPathListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveDocImgPathList[index] = updateFn(_leaveDocImgPathList[index]);
  }

  void insertAtIndexInLeaveDocImgPathList(int index, String value) {
    leaveDocImgPathList.insert(index, value);
  }

  String _positionApprove = '1';
  String get positionApprove => _positionApprove;
  set positionApprove(String value) {
    _positionApprove = value;
  }

  List<String> _disapproveName = [];
  List<String> get disapproveName => _disapproveName;
  set disapproveName(List<String> value) {
    _disapproveName = value;
  }

  void addToDisapproveName(String value) {
    disapproveName.add(value);
  }

  void removeFromDisapproveName(String value) {
    disapproveName.remove(value);
  }

  void removeAtIndexFromDisapproveName(int index) {
    disapproveName.removeAt(index);
  }

  void updateDisapproveNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveName[index] = updateFn(_disapproveName[index]);
  }

  void insertAtIndexInDisapproveName(int index, String value) {
    disapproveName.insert(index, value);
  }

  List<String> _disapproveLeaveName = [];
  List<String> get disapproveLeaveName => _disapproveLeaveName;
  set disapproveLeaveName(List<String> value) {
    _disapproveLeaveName = value;
  }

  void addToDisapproveLeaveName(String value) {
    disapproveLeaveName.add(value);
  }

  void removeFromDisapproveLeaveName(String value) {
    disapproveLeaveName.remove(value);
  }

  void removeAtIndexFromDisapproveLeaveName(int index) {
    disapproveLeaveName.removeAt(index);
  }

  void updateDisapproveLeaveNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveLeaveName[index] = updateFn(_disapproveLeaveName[index]);
  }

  void insertAtIndexInDisapproveLeaveName(int index, String value) {
    disapproveLeaveName.insert(index, value);
  }

  List<String> _disapproveCreatedDate = [];
  List<String> get disapproveCreatedDate => _disapproveCreatedDate;
  set disapproveCreatedDate(List<String> value) {
    _disapproveCreatedDate = value;
  }

  void addToDisapproveCreatedDate(String value) {
    disapproveCreatedDate.add(value);
  }

  void removeFromDisapproveCreatedDate(String value) {
    disapproveCreatedDate.remove(value);
  }

  void removeAtIndexFromDisapproveCreatedDate(int index) {
    disapproveCreatedDate.removeAt(index);
  }

  void updateDisapproveCreatedDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveCreatedDate[index] = updateFn(_disapproveCreatedDate[index]);
  }

  void insertAtIndexInDisapproveCreatedDate(int index, String value) {
    disapproveCreatedDate.insert(index, value);
  }

  List<String> _disapproveLeaveDate = [];
  List<String> get disapproveLeaveDate => _disapproveLeaveDate;
  set disapproveLeaveDate(List<String> value) {
    _disapproveLeaveDate = value;
  }

  void addToDisapproveLeaveDate(String value) {
    disapproveLeaveDate.add(value);
  }

  void removeFromDisapproveLeaveDate(String value) {
    disapproveLeaveDate.remove(value);
  }

  void removeAtIndexFromDisapproveLeaveDate(int index) {
    disapproveLeaveDate.removeAt(index);
  }

  void updateDisapproveLeaveDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveLeaveDate[index] = updateFn(_disapproveLeaveDate[index]);
  }

  void insertAtIndexInDisapproveLeaveDate(int index, String value) {
    disapproveLeaveDate.insert(index, value);
  }

  List<String> _disapproveCountDay = [];
  List<String> get disapproveCountDay => _disapproveCountDay;
  set disapproveCountDay(List<String> value) {
    _disapproveCountDay = value;
  }

  void addToDisapproveCountDay(String value) {
    disapproveCountDay.add(value);
  }

  void removeFromDisapproveCountDay(String value) {
    disapproveCountDay.remove(value);
  }

  void removeAtIndexFromDisapproveCountDay(int index) {
    disapproveCountDay.removeAt(index);
  }

  void updateDisapproveCountDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveCountDay[index] = updateFn(_disapproveCountDay[index]);
  }

  void insertAtIndexInDisapproveCountDay(int index, String value) {
    disapproveCountDay.insert(index, value);
  }

  List<String> _disapproveTimePeriod = [];
  List<String> get disapproveTimePeriod => _disapproveTimePeriod;
  set disapproveTimePeriod(List<String> value) {
    _disapproveTimePeriod = value;
  }

  void addToDisapproveTimePeriod(String value) {
    disapproveTimePeriod.add(value);
  }

  void removeFromDisapproveTimePeriod(String value) {
    disapproveTimePeriod.remove(value);
  }

  void removeAtIndexFromDisapproveTimePeriod(int index) {
    disapproveTimePeriod.removeAt(index);
  }

  void updateDisapproveTimePeriodAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveTimePeriod[index] = updateFn(_disapproveTimePeriod[index]);
  }

  void insertAtIndexInDisapproveTimePeriod(int index, String value) {
    disapproveTimePeriod.insert(index, value);
  }

  List<String> _disapproveReason = [];
  List<String> get disapproveReason => _disapproveReason;
  set disapproveReason(List<String> value) {
    _disapproveReason = value;
  }

  void addToDisapproveReason(String value) {
    disapproveReason.add(value);
  }

  void removeFromDisapproveReason(String value) {
    disapproveReason.remove(value);
  }

  void removeAtIndexFromDisapproveReason(int index) {
    disapproveReason.removeAt(index);
  }

  void updateDisapproveReasonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    disapproveReason[index] = updateFn(_disapproveReason[index]);
  }

  void insertAtIndexInDisapproveReason(int index, String value) {
    disapproveReason.insert(index, value);
  }

  List<String> _provName = ['ProvName'];
  List<String> get provName => _provName;
  set provName(List<String> value) {
    _provName = value;
  }

  void addToProvName(String value) {
    provName.add(value);
  }

  void removeFromProvName(String value) {
    provName.remove(value);
  }

  void removeAtIndexFromProvName(int index) {
    provName.removeAt(index);
  }

  void updateProvNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    provName[index] = updateFn(_provName[index]);
  }

  void insertAtIndexInProvName(int index, String value) {
    provName.insert(index, value);
  }

  List<String> _provCode = ['ProvCode'];
  List<String> get provCode => _provCode;
  set provCode(List<String> value) {
    _provCode = value;
  }

  void addToProvCode(String value) {
    provCode.add(value);
  }

  void removeFromProvCode(String value) {
    provCode.remove(value);
  }

  void removeAtIndexFromProvCode(int index) {
    provCode.removeAt(index);
  }

  void updateProvCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    provCode[index] = updateFn(_provCode[index]);
  }

  void insertAtIndexInProvCode(int index, String value) {
    provCode.insert(index, value);
  }

  List<String> _districtName = ['districtName'];
  List<String> get districtName => _districtName;
  set districtName(List<String> value) {
    _districtName = value;
  }

  void addToDistrictName(String value) {
    districtName.add(value);
  }

  void removeFromDistrictName(String value) {
    districtName.remove(value);
  }

  void removeAtIndexFromDistrictName(int index) {
    districtName.removeAt(index);
  }

  void updateDistrictNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    districtName[index] = updateFn(_districtName[index]);
  }

  void insertAtIndexInDistrictName(int index, String value) {
    districtName.insert(index, value);
  }

  List<String> _districtCode = ['districtCode'];
  List<String> get districtCode => _districtCode;
  set districtCode(List<String> value) {
    _districtCode = value;
  }

  void addToDistrictCode(String value) {
    districtCode.add(value);
  }

  void removeFromDistrictCode(String value) {
    districtCode.remove(value);
  }

  void removeAtIndexFromDistrictCode(int index) {
    districtCode.removeAt(index);
  }

  void updateDistrictCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    districtCode[index] = updateFn(_districtCode[index]);
  }

  void insertAtIndexInDistrictCode(int index, String value) {
    districtCode.insert(index, value);
  }

  List<String> _postCode = ['PostCode'];
  List<String> get postCode => _postCode;
  set postCode(List<String> value) {
    _postCode = value;
  }

  void addToPostCode(String value) {
    postCode.add(value);
  }

  void removeFromPostCode(String value) {
    postCode.remove(value);
  }

  void removeAtIndexFromPostCode(int index) {
    postCode.removeAt(index);
  }

  void updatePostCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    postCode[index] = updateFn(_postCode[index]);
  }

  void insertAtIndexInPostCode(int index, String value) {
    postCode.insert(index, value);
  }

  List<String> _subDistrictName = ['subDistrictName'];
  List<String> get subDistrictName => _subDistrictName;
  set subDistrictName(List<String> value) {
    _subDistrictName = value;
  }

  void addToSubDistrictName(String value) {
    subDistrictName.add(value);
  }

  void removeFromSubDistrictName(String value) {
    subDistrictName.remove(value);
  }

  void removeAtIndexFromSubDistrictName(int index) {
    subDistrictName.removeAt(index);
  }

  void updateSubDistrictNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    subDistrictName[index] = updateFn(_subDistrictName[index]);
  }

  void insertAtIndexInSubDistrictName(int index, String value) {
    subDistrictName.insert(index, value);
  }

  int _leaveDayInt = 0;
  int get leaveDayInt => _leaveDayInt;
  set leaveDayInt(int value) {
    _leaveDayInt = value;
  }

  List<String> _leaveTypeEdit = [];
  List<String> get leaveTypeEdit => _leaveTypeEdit;
  set leaveTypeEdit(List<String> value) {
    _leaveTypeEdit = value;
  }

  void addToLeaveTypeEdit(String value) {
    leaveTypeEdit.add(value);
  }

  void removeFromLeaveTypeEdit(String value) {
    leaveTypeEdit.remove(value);
  }

  void removeAtIndexFromLeaveTypeEdit(int index) {
    leaveTypeEdit.removeAt(index);
  }

  void updateLeaveTypeEditAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveTypeEdit[index] = updateFn(_leaveTypeEdit[index]);
  }

  void insertAtIndexInLeaveTypeEdit(int index, String value) {
    leaveTypeEdit.insert(index, value);
  }

  List<String> _leaveHalfDay = [
    'ลาเต็มวัน',
    'ลาครึ่งวันเช้า',
    'ลาครึ่งวันบ่าย'
  ];
  List<String> get leaveHalfDay => _leaveHalfDay;
  set leaveHalfDay(List<String> value) {
    _leaveHalfDay = value;
  }

  void addToLeaveHalfDay(String value) {
    leaveHalfDay.add(value);
  }

  void removeFromLeaveHalfDay(String value) {
    leaveHalfDay.remove(value);
  }

  void removeAtIndexFromLeaveHalfDay(int index) {
    leaveHalfDay.removeAt(index);
  }

  void updateLeaveHalfDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveHalfDay[index] = updateFn(_leaveHalfDay[index]);
  }

  void insertAtIndexInLeaveHalfDay(int index, String value) {
    leaveHalfDay.insert(index, value);
  }

  List<String> _leaveFullDay = ['ลาเต็มวัน'];
  List<String> get leaveFullDay => _leaveFullDay;
  set leaveFullDay(List<String> value) {
    _leaveFullDay = value;
  }

  void addToLeaveFullDay(String value) {
    leaveFullDay.add(value);
  }

  void removeFromLeaveFullDay(String value) {
    leaveFullDay.remove(value);
  }

  void removeAtIndexFromLeaveFullDay(int index) {
    leaveFullDay.removeAt(index);
  }

  void updateLeaveFullDayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leaveFullDay[index] = updateFn(_leaveFullDay[index]);
  }

  void insertAtIndexInLeaveFullDay(int index, String value) {
    leaveFullDay.insert(index, value);
  }

  bool _leaveReasonEtcVisible = false;
  bool get leaveReasonEtcVisible => _leaveReasonEtcVisible;
  set leaveReasonEtcVisible(bool value) {
    _leaveReasonEtcVisible = value;
  }

  bool _companyAssetReturnEtcVisible = false;
  bool get companyAssetReturnEtcVisible => _companyAssetReturnEtcVisible;
  set companyAssetReturnEtcVisible(bool value) {
    _companyAssetReturnEtcVisible = value;
  }

  List<String> _reasonToLeaveList = [];
  List<String> get reasonToLeaveList => _reasonToLeaveList;
  set reasonToLeaveList(List<String> value) {
    _reasonToLeaveList = value;
  }

  void addToReasonToLeaveList(String value) {
    reasonToLeaveList.add(value);
  }

  void removeFromReasonToLeaveList(String value) {
    reasonToLeaveList.remove(value);
  }

  void removeAtIndexFromReasonToLeaveList(int index) {
    reasonToLeaveList.removeAt(index);
  }

  void updateReasonToLeaveListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    reasonToLeaveList[index] = updateFn(_reasonToLeaveList[index]);
  }

  void insertAtIndexInReasonToLeaveList(int index, String value) {
    reasonToLeaveList.insert(index, value);
  }

  List<String> _assetReturnList = [];
  List<String> get assetReturnList => _assetReturnList;
  set assetReturnList(List<String> value) {
    _assetReturnList = value;
  }

  void addToAssetReturnList(String value) {
    assetReturnList.add(value);
  }

  void removeFromAssetReturnList(String value) {
    assetReturnList.remove(value);
  }

  void removeAtIndexFromAssetReturnList(int index) {
    assetReturnList.removeAt(index);
  }

  void updateAssetReturnListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    assetReturnList[index] = updateFn(_assetReturnList[index]);
  }

  void insertAtIndexInAssetReturnList(int index, String value) {
    assetReturnList.insert(index, value);
  }

  List<String> _insurancePlan1 = [];
  List<String> get insurancePlan1 => _insurancePlan1;
  set insurancePlan1(List<String> value) {
    _insurancePlan1 = value;
  }

  void addToInsurancePlan1(String value) {
    insurancePlan1.add(value);
  }

  void removeFromInsurancePlan1(String value) {
    insurancePlan1.remove(value);
  }

  void removeAtIndexFromInsurancePlan1(int index) {
    insurancePlan1.removeAt(index);
  }

  void updateInsurancePlan1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insurancePlan1[index] = updateFn(_insurancePlan1[index]);
  }

  void insertAtIndexInInsurancePlan1(int index, String value) {
    insurancePlan1.insert(index, value);
  }

  String _insurancePlanNumber = '';
  String get insurancePlanNumber => _insurancePlanNumber;
  set insurancePlanNumber(String value) {
    _insurancePlanNumber = value;
  }

  String _profileLevel = '';
  String get profileLevel => _profileLevel;
  set profileLevel(String value) {
    _profileLevel = value;
  }

  String _profileBranch = '';
  String get profileBranch => _profileBranch;
  set profileBranch(String value) {
    _profileBranch = value;
  }

  List<Color> _welfareKpiStatusTextColorList = [
    Color(4293807906),
    Color(4293837090),
    Color(4286301986),
    Color(4280348415),
    Color(4279118847)
  ];
  List<Color> get welfareKpiStatusTextColorList =>
      _welfareKpiStatusTextColorList;
  set welfareKpiStatusTextColorList(List<Color> value) {
    _welfareKpiStatusTextColorList = value;
  }

  void addToWelfareKpiStatusTextColorList(Color value) {
    welfareKpiStatusTextColorList.add(value);
  }

  void removeFromWelfareKpiStatusTextColorList(Color value) {
    welfareKpiStatusTextColorList.remove(value);
  }

  void removeAtIndexFromWelfareKpiStatusTextColorList(int index) {
    welfareKpiStatusTextColorList.removeAt(index);
  }

  void updateWelfareKpiStatusTextColorListAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    welfareKpiStatusTextColorList[index] =
        updateFn(_welfareKpiStatusTextColorList[index]);
  }

  void insertAtIndexInWelfareKpiStatusTextColorList(int index, Color value) {
    welfareKpiStatusTextColorList.insert(index, value);
  }

  bool _isProduction = true;
  bool get isProduction => _isProduction;
  set isProduction(bool value) {
    _isProduction = value;
  }

  bool _isSelectedBranch = false;
  bool get isSelectedBranch => _isSelectedBranch;
  set isSelectedBranch(bool value) {
    _isSelectedBranch = value;
  }

  bool _isSearchedBranch = false;
  bool get isSearchedBranch => _isSearchedBranch;
  set isSearchedBranch(bool value) {
    _isSearchedBranch = value;
  }

  bool _isEmployeeSearched = false;
  bool get isEmployeeSearched => _isEmployeeSearched;
  set isEmployeeSearched(bool value) {
    _isEmployeeSearched = value;
  }

  bool _isEmployeeSelected = false;
  bool get isEmployeeSelected => _isEmployeeSelected;
  set isEmployeeSelected(bool value) {
    _isEmployeeSelected = value;
  }

  List<int> _welfareCEOStatusList = [5544, 5544];
  List<int> get welfareCEOStatusList => _welfareCEOStatusList;
  set welfareCEOStatusList(List<int> value) {
    _welfareCEOStatusList = value;
  }

  void addToWelfareCEOStatusList(int value) {
    welfareCEOStatusList.add(value);
  }

  void removeFromWelfareCEOStatusList(int value) {
    welfareCEOStatusList.remove(value);
  }

  void removeAtIndexFromWelfareCEOStatusList(int index) {
    welfareCEOStatusList.removeAt(index);
  }

  void updateWelfareCEOStatusListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    welfareCEOStatusList[index] = updateFn(_welfareCEOStatusList[index]);
  }

  void insertAtIndexInWelfareCEOStatusList(int index, int value) {
    welfareCEOStatusList.insert(index, value);
  }

  List<String> _leadCountCalled = [];
  List<String> get leadCountCalled => _leadCountCalled;
  set leadCountCalled(List<String> value) {
    _leadCountCalled = value;
  }

  void addToLeadCountCalled(String value) {
    leadCountCalled.add(value);
  }

  void removeFromLeadCountCalled(String value) {
    leadCountCalled.remove(value);
  }

  void removeAtIndexFromLeadCountCalled(int index) {
    leadCountCalled.removeAt(index);
  }

  void updateLeadCountCalledAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCountCalled[index] = updateFn(_leadCountCalled[index]);
  }

  void insertAtIndexInLeadCountCalled(int index, String value) {
    leadCountCalled.insert(index, value);
  }

  double _branchLatDouble = 0.0;
  double get branchLatDouble => _branchLatDouble;
  set branchLatDouble(double value) {
    _branchLatDouble = value;
  }

  double _branchLngDouble = 0.0;
  double get branchLngDouble => _branchLngDouble;
  set branchLngDouble(double value) {
    _branchLngDouble = value;
  }

  double _currentLatDouble = 0.0;
  double get currentLatDouble => _currentLatDouble;
  set currentLatDouble(double value) {
    _currentLatDouble = value;
  }

  double _currentLngDouble = 0.0;
  double get currentLngDouble => _currentLngDouble;
  set currentLngDouble(double value) {
    _currentLngDouble = value;
  }

  List<String> _leadName2 = [];
  List<String> get leadName2 => _leadName2;
  set leadName2(List<String> value) {
    _leadName2 = value;
  }

  void addToLeadName2(String value) {
    leadName2.add(value);
  }

  void removeFromLeadName2(String value) {
    leadName2.remove(value);
  }

  void removeAtIndexFromLeadName2(int index) {
    leadName2.removeAt(index);
  }

  void updateLeadName2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadName2[index] = updateFn(_leadName2[index]);
  }

  void insertAtIndexInLeadName2(int index, String value) {
    leadName2.insert(index, value);
  }

  List<String> _leadLastname2 = [];
  List<String> get leadLastname2 => _leadLastname2;
  set leadLastname2(List<String> value) {
    _leadLastname2 = value;
  }

  void addToLeadLastname2(String value) {
    leadLastname2.add(value);
  }

  void removeFromLeadLastname2(String value) {
    leadLastname2.remove(value);
  }

  void removeAtIndexFromLeadLastname2(int index) {
    leadLastname2.removeAt(index);
  }

  void updateLeadLastname2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadLastname2[index] = updateFn(_leadLastname2[index]);
  }

  void insertAtIndexInLeadLastname2(int index, String value) {
    leadLastname2.insert(index, value);
  }

  List<String> _leadPhone2 = [];
  List<String> get leadPhone2 => _leadPhone2;
  set leadPhone2(List<String> value) {
    _leadPhone2 = value;
  }

  void addToLeadPhone2(String value) {
    leadPhone2.add(value);
  }

  void removeFromLeadPhone2(String value) {
    leadPhone2.remove(value);
  }

  void removeAtIndexFromLeadPhone2(int index) {
    leadPhone2.removeAt(index);
  }

  void updateLeadPhone2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadPhone2[index] = updateFn(_leadPhone2[index]);
  }

  void insertAtIndexInLeadPhone2(int index, String value) {
    leadPhone2.insert(index, value);
  }

  List<int> _totalSumPoint = [];
  List<int> get totalSumPoint => _totalSumPoint;
  set totalSumPoint(List<int> value) {
    _totalSumPoint = value;
  }

  void addToTotalSumPoint(int value) {
    totalSumPoint.add(value);
  }

  void removeFromTotalSumPoint(int value) {
    totalSumPoint.remove(value);
  }

  void removeAtIndexFromTotalSumPoint(int index) {
    totalSumPoint.removeAt(index);
  }

  void updateTotalSumPointAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    totalSumPoint[index] = updateFn(_totalSumPoint[index]);
  }

  void insertAtIndexInTotalSumPoint(int index, int value) {
    totalSumPoint.insert(index, value);
  }

  List<String> _leadCarVehicleName = [];
  List<String> get leadCarVehicleName => _leadCarVehicleName;
  set leadCarVehicleName(List<String> value) {
    _leadCarVehicleName = value;
  }

  void addToLeadCarVehicleName(String value) {
    leadCarVehicleName.add(value);
  }

  void removeFromLeadCarVehicleName(String value) {
    leadCarVehicleName.remove(value);
  }

  void removeAtIndexFromLeadCarVehicleName(int index) {
    leadCarVehicleName.removeAt(index);
  }

  void updateLeadCarVehicleNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCarVehicleName[index] = updateFn(_leadCarVehicleName[index]);
  }

  void insertAtIndexInLeadCarVehicleName(int index, String value) {
    leadCarVehicleName.insert(index, value);
  }

  List<String> _leadAmountRequest = [];
  List<String> get leadAmountRequest => _leadAmountRequest;
  set leadAmountRequest(List<String> value) {
    _leadAmountRequest = value;
  }

  void addToLeadAmountRequest(String value) {
    leadAmountRequest.add(value);
  }

  void removeFromLeadAmountRequest(String value) {
    leadAmountRequest.remove(value);
  }

  void removeAtIndexFromLeadAmountRequest(int index) {
    leadAmountRequest.removeAt(index);
  }

  void updateLeadAmountRequestAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadAmountRequest[index] = updateFn(_leadAmountRequest[index]);
  }

  void insertAtIndexInLeadAmountRequest(int index, String value) {
    leadAmountRequest.insert(index, value);
  }

  String _changeBranchCode = '';
  String get changeBranchCode => _changeBranchCode;
  set changeBranchCode(String value) {
    _changeBranchCode = value;
  }

  String _changeLat = '';
  String get changeLat => _changeLat;
  set changeLat(String value) {
    _changeLat = value;
  }

  String _changeLng = '';
  String get changeLng => _changeLng;
  set changeLng(String value) {
    _changeLng = value;
  }

  DateTime? _tpbDate;
  DateTime? get tpbDate => _tpbDate;
  set tpbDate(DateTime? value) {
    _tpbDate = value;
  }

  bool _firstLogin = false;
  bool get firstLogin => _firstLogin;
  set firstLogin(bool value) {
    _firstLogin = value;
    secureStorage.setBool('ff_firstLogin', value);
  }

  void deleteFirstLogin() {
    secureStorage.delete(key: 'ff_firstLogin');
  }

  List<String> _brachListNew = [];
  List<String> get brachListNew => _brachListNew;
  set brachListNew(List<String> value) {
    _brachListNew = value;
    secureStorage.setStringList('ff_brachListNew', value);
  }

  void deleteBrachListNew() {
    secureStorage.delete(key: 'ff_brachListNew');
  }

  void addToBrachListNew(String value) {
    brachListNew.add(value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeFromBrachListNew(String value) {
    brachListNew.remove(value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeAtIndexFromBrachListNew(int index) {
    brachListNew.removeAt(index);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void updateBrachListNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    brachListNew[index] = updateFn(_brachListNew[index]);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void insertAtIndexInBrachListNew(int index, String value) {
    brachListNew.insert(index, value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  List<String> _brachLatNew = [];
  List<String> get brachLatNew => _brachLatNew;
  set brachLatNew(List<String> value) {
    _brachLatNew = value;
    secureStorage.setStringList('ff_brachLatNew', value);
  }

  void deleteBrachLatNew() {
    secureStorage.delete(key: 'ff_brachLatNew');
  }

  void addToBrachLatNew(String value) {
    brachLatNew.add(value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeFromBrachLatNew(String value) {
    brachLatNew.remove(value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeAtIndexFromBrachLatNew(int index) {
    brachLatNew.removeAt(index);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void updateBrachLatNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    brachLatNew[index] = updateFn(_brachLatNew[index]);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void insertAtIndexInBrachLatNew(int index, String value) {
    brachLatNew.insert(index, value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  List<String> _brachLngNew = [];
  List<String> get brachLngNew => _brachLngNew;
  set brachLngNew(List<String> value) {
    _brachLngNew = value;
    secureStorage.setStringList('ff_brachLngNew', value);
  }

  void deleteBrachLngNew() {
    secureStorage.delete(key: 'ff_brachLngNew');
  }

  void addToBrachLngNew(String value) {
    brachLngNew.add(value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeFromBrachLngNew(String value) {
    brachLngNew.remove(value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeAtIndexFromBrachLngNew(int index) {
    brachLngNew.removeAt(index);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void updateBrachLngNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    brachLngNew[index] = updateFn(_brachLngNew[index]);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void insertAtIndexInBrachLngNew(int index, String value) {
    brachLngNew.insert(index, value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  List<String> _BrachRadNew = [];
  List<String> get BrachRadNew => _BrachRadNew;
  set BrachRadNew(List<String> value) {
    _BrachRadNew = value;
    secureStorage.setStringList('ff_BrachRadNew', value);
  }

  void deleteBrachRadNew() {
    secureStorage.delete(key: 'ff_BrachRadNew');
  }

  void addToBrachRadNew(String value) {
    BrachRadNew.add(value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeFromBrachRadNew(String value) {
    BrachRadNew.remove(value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeAtIndexFromBrachRadNew(int index) {
    BrachRadNew.removeAt(index);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void updateBrachRadNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    BrachRadNew[index] = updateFn(_BrachRadNew[index]);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void insertAtIndexInBrachRadNew(int index, String value) {
    BrachRadNew.insert(index, value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  String _brachGroupNew = '';
  String get brachGroupNew => _brachGroupNew;
  set brachGroupNew(String value) {
    _brachGroupNew = value;
    secureStorage.setString('ff_brachGroupNew', value);
  }

  void deleteBrachGroupNew() {
    secureStorage.delete(key: 'ff_brachGroupNew');
  }

  List<String> _leadCalledStatusReason = [];
  List<String> get leadCalledStatusReason => _leadCalledStatusReason;
  set leadCalledStatusReason(List<String> value) {
    _leadCalledStatusReason = value;
  }

  void addToLeadCalledStatusReason(String value) {
    leadCalledStatusReason.add(value);
  }

  void removeFromLeadCalledStatusReason(String value) {
    leadCalledStatusReason.remove(value);
  }

  void removeAtIndexFromLeadCalledStatusReason(int index) {
    leadCalledStatusReason.removeAt(index);
  }

  void updateLeadCalledStatusReasonAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCalledStatusReason[index] = updateFn(_leadCalledStatusReason[index]);
  }

  void insertAtIndexInLeadCalledStatusReason(int index, String value) {
    leadCalledStatusReason.insert(index, value);
  }

  List<String> _leadContractStatus = [];
  List<String> get leadContractStatus => _leadContractStatus;
  set leadContractStatus(List<String> value) {
    _leadContractStatus = value;
  }

  void addToLeadContractStatus(String value) {
    leadContractStatus.add(value);
  }

  void removeFromLeadContractStatus(String value) {
    leadContractStatus.remove(value);
  }

  void removeAtIndexFromLeadContractStatus(int index) {
    leadContractStatus.removeAt(index);
  }

  void updateLeadContractStatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractStatus[index] = updateFn(_leadContractStatus[index]);
  }

  void insertAtIndexInLeadContractStatus(int index, String value) {
    leadContractStatus.insert(index, value);
  }

  List<String> _leadContractDate = [];
  List<String> get leadContractDate => _leadContractDate;
  set leadContractDate(List<String> value) {
    _leadContractDate = value;
  }

  void addToLeadContractDate(String value) {
    leadContractDate.add(value);
  }

  void removeFromLeadContractDate(String value) {
    leadContractDate.remove(value);
  }

  void removeAtIndexFromLeadContractDate(int index) {
    leadContractDate.removeAt(index);
  }

  void updateLeadContractDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractDate[index] = updateFn(_leadContractDate[index]);
  }

  void insertAtIndexInLeadContractDate(int index, String value) {
    leadContractDate.insert(index, value);
  }

  List<String> _defaultList1 = [
    'Hello World1',
    'Hello World3',
    'Hello World5',
    'Hello World7',
    'Hello World9'
  ];
  List<String> get defaultList1 => _defaultList1;
  set defaultList1(List<String> value) {
    _defaultList1 = value;
  }

  void addToDefaultList1(String value) {
    defaultList1.add(value);
  }

  void removeFromDefaultList1(String value) {
    defaultList1.remove(value);
  }

  void removeAtIndexFromDefaultList1(int index) {
    defaultList1.removeAt(index);
  }

  void updateDefaultList1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList1[index] = updateFn(_defaultList1[index]);
  }

  void insertAtIndexInDefaultList1(int index, String value) {
    defaultList1.insert(index, value);
  }

  List<String> _defaultList2 = ['Hello World'];
  List<String> get defaultList2 => _defaultList2;
  set defaultList2(List<String> value) {
    _defaultList2 = value;
  }

  void addToDefaultList2(String value) {
    defaultList2.add(value);
  }

  void removeFromDefaultList2(String value) {
    defaultList2.remove(value);
  }

  void removeAtIndexFromDefaultList2(int index) {
    defaultList2.removeAt(index);
  }

  void updateDefaultList2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList2[index] = updateFn(_defaultList2[index]);
  }

  void insertAtIndexInDefaultList2(int index, String value) {
    defaultList2.insert(index, value);
  }

  List<String> _defaultList3 = ['Hello World'];
  List<String> get defaultList3 => _defaultList3;
  set defaultList3(List<String> value) {
    _defaultList3 = value;
  }

  void addToDefaultList3(String value) {
    defaultList3.add(value);
  }

  void removeFromDefaultList3(String value) {
    defaultList3.remove(value);
  }

  void removeAtIndexFromDefaultList3(int index) {
    defaultList3.removeAt(index);
  }

  void updateDefaultList3AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList3[index] = updateFn(_defaultList3[index]);
  }

  void insertAtIndexInDefaultList3(int index, String value) {
    defaultList3.insert(index, value);
  }

  List<String> _defaultList4 = ['Hello World'];
  List<String> get defaultList4 => _defaultList4;
  set defaultList4(List<String> value) {
    _defaultList4 = value;
  }

  void addToDefaultList4(String value) {
    defaultList4.add(value);
  }

  void removeFromDefaultList4(String value) {
    defaultList4.remove(value);
  }

  void removeAtIndexFromDefaultList4(int index) {
    defaultList4.removeAt(index);
  }

  void updateDefaultList4AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList4[index] = updateFn(_defaultList4[index]);
  }

  void insertAtIndexInDefaultList4(int index, String value) {
    defaultList4.insert(index, value);
  }

  List<String> _defaultList5 = ['Hello World'];
  List<String> get defaultList5 => _defaultList5;
  set defaultList5(List<String> value) {
    _defaultList5 = value;
  }

  void addToDefaultList5(String value) {
    defaultList5.add(value);
  }

  void removeFromDefaultList5(String value) {
    defaultList5.remove(value);
  }

  void removeAtIndexFromDefaultList5(int index) {
    defaultList5.removeAt(index);
  }

  void updateDefaultList5AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList5[index] = updateFn(_defaultList5[index]);
  }

  void insertAtIndexInDefaultList5(int index, String value) {
    defaultList5.insert(index, value);
  }

  List<String> _defaultList6 = ['Hello World'];
  List<String> get defaultList6 => _defaultList6;
  set defaultList6(List<String> value) {
    _defaultList6 = value;
  }

  void addToDefaultList6(String value) {
    defaultList6.add(value);
  }

  void removeFromDefaultList6(String value) {
    defaultList6.remove(value);
  }

  void removeAtIndexFromDefaultList6(int index) {
    defaultList6.removeAt(index);
  }

  void updateDefaultList6AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList6[index] = updateFn(_defaultList6[index]);
  }

  void insertAtIndexInDefaultList6(int index, String value) {
    defaultList6.insert(index, value);
  }

  List<String> _defaultList7 = ['Hello World'];
  List<String> get defaultList7 => _defaultList7;
  set defaultList7(List<String> value) {
    _defaultList7 = value;
  }

  void addToDefaultList7(String value) {
    defaultList7.add(value);
  }

  void removeFromDefaultList7(String value) {
    defaultList7.remove(value);
  }

  void removeAtIndexFromDefaultList7(int index) {
    defaultList7.removeAt(index);
  }

  void updateDefaultList7AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    defaultList7[index] = updateFn(_defaultList7[index]);
  }

  void insertAtIndexInDefaultList7(int index, String value) {
    defaultList7.insert(index, value);
  }

  String _profileFirstName = '[first_name]';
  String get profileFirstName => _profileFirstName;
  set profileFirstName(String value) {
    _profileFirstName = value;
  }

  String _profileLastName = '[last_name]';
  String get profileLastName => _profileLastName;
  set profileLastName(String value) {
    _profileLastName = value;
  }

  dynamic _userInsuranceLicense;
  dynamic get userInsuranceLicense => _userInsuranceLicense;
  set userInsuranceLicense(dynamic value) {
    _userInsuranceLicense = value;
  }

  List<String> _insuranceLicenseData = [];
  List<String> get insuranceLicenseData => _insuranceLicenseData;
  set insuranceLicenseData(List<String> value) {
    _insuranceLicenseData = value;
  }

  void addToInsuranceLicenseData(String value) {
    insuranceLicenseData.add(value);
  }

  void removeFromInsuranceLicenseData(String value) {
    insuranceLicenseData.remove(value);
  }

  void removeAtIndexFromInsuranceLicenseData(int index) {
    insuranceLicenseData.removeAt(index);
  }

  void updateInsuranceLicenseDataAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceLicenseData[index] = updateFn(_insuranceLicenseData[index]);
  }

  void insertAtIndexInInsuranceLicenseData(int index, String value) {
    insuranceLicenseData.insert(index, value);
  }

  List<String> _profileInsuLicenseFullName = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get profileInsuLicenseFullName => _profileInsuLicenseFullName;
  set profileInsuLicenseFullName(List<String> value) {
    _profileInsuLicenseFullName = value;
  }

  void addToProfileInsuLicenseFullName(String value) {
    profileInsuLicenseFullName.add(value);
  }

  void removeFromProfileInsuLicenseFullName(String value) {
    profileInsuLicenseFullName.remove(value);
  }

  void removeAtIndexFromProfileInsuLicenseFullName(int index) {
    profileInsuLicenseFullName.removeAt(index);
  }

  void updateProfileInsuLicenseFullNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    profileInsuLicenseFullName[index] =
        updateFn(_profileInsuLicenseFullName[index]);
  }

  void insertAtIndexInProfileInsuLicenseFullName(int index, String value) {
    profileInsuLicenseFullName.insert(index, value);
  }

  List<String> _profileInsuLicenseIdCard = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get profileInsuLicenseIdCard => _profileInsuLicenseIdCard;
  set profileInsuLicenseIdCard(List<String> value) {
    _profileInsuLicenseIdCard = value;
  }

  void addToProfileInsuLicenseIdCard(String value) {
    profileInsuLicenseIdCard.add(value);
  }

  void removeFromProfileInsuLicenseIdCard(String value) {
    profileInsuLicenseIdCard.remove(value);
  }

  void removeAtIndexFromProfileInsuLicenseIdCard(int index) {
    profileInsuLicenseIdCard.removeAt(index);
  }

  void updateProfileInsuLicenseIdCardAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    profileInsuLicenseIdCard[index] =
        updateFn(_profileInsuLicenseIdCard[index]);
  }

  void insertAtIndexInProfileInsuLicenseIdCard(int index, String value) {
    profileInsuLicenseIdCard.insert(index, value);
  }

  List<String> _profileInsuLicenseNumLicense = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get profileInsuLicenseNumLicense =>
      _profileInsuLicenseNumLicense;
  set profileInsuLicenseNumLicense(List<String> value) {
    _profileInsuLicenseNumLicense = value;
  }

  void addToProfileInsuLicenseNumLicense(String value) {
    profileInsuLicenseNumLicense.add(value);
  }

  void removeFromProfileInsuLicenseNumLicense(String value) {
    profileInsuLicenseNumLicense.remove(value);
  }

  void removeAtIndexFromProfileInsuLicenseNumLicense(int index) {
    profileInsuLicenseNumLicense.removeAt(index);
  }

  void updateProfileInsuLicenseNumLicenseAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    profileInsuLicenseNumLicense[index] =
        updateFn(_profileInsuLicenseNumLicense[index]);
  }

  void insertAtIndexInProfileInsuLicenseNumLicense(int index, String value) {
    profileInsuLicenseNumLicense.insert(index, value);
  }

  List<String> _profileInsuLicenseStartDate = [
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World',
    'Hello World'
  ];
  List<String> get profileInsuLicenseStartDate => _profileInsuLicenseStartDate;
  set profileInsuLicenseStartDate(List<String> value) {
    _profileInsuLicenseStartDate = value;
  }

  void addToProfileInsuLicenseStartDate(String value) {
    profileInsuLicenseStartDate.add(value);
  }

  void removeFromProfileInsuLicenseStartDate(String value) {
    profileInsuLicenseStartDate.remove(value);
  }

  void removeAtIndexFromProfileInsuLicenseStartDate(int index) {
    profileInsuLicenseStartDate.removeAt(index);
  }

  void updateProfileInsuLicenseStartDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    profileInsuLicenseStartDate[index] =
        updateFn(_profileInsuLicenseStartDate[index]);
  }

  void insertAtIndexInProfileInsuLicenseStartDate(int index, String value) {
    profileInsuLicenseStartDate.insert(index, value);
  }

  List<String> _profileInsuLicenseExpireDate = [
    '9999-01-01',
    '9999-01-01',
    '9999-01-01',
    '9999-01-01',
    '9999-01-01',
    '9999-01-01',
    '9999-01-01'
  ];
  List<String> get profileInsuLicenseExpireDate =>
      _profileInsuLicenseExpireDate;
  set profileInsuLicenseExpireDate(List<String> value) {
    _profileInsuLicenseExpireDate = value;
  }

  void addToProfileInsuLicenseExpireDate(String value) {
    profileInsuLicenseExpireDate.add(value);
  }

  void removeFromProfileInsuLicenseExpireDate(String value) {
    profileInsuLicenseExpireDate.remove(value);
  }

  void removeAtIndexFromProfileInsuLicenseExpireDate(int index) {
    profileInsuLicenseExpireDate.removeAt(index);
  }

  void updateProfileInsuLicenseExpireDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    profileInsuLicenseExpireDate[index] =
        updateFn(_profileInsuLicenseExpireDate[index]);
  }

  void insertAtIndexInProfileInsuLicenseExpireDate(int index, String value) {
    profileInsuLicenseExpireDate.insert(index, value);
  }

  int _statusCodeSuccess = 200;
  int get statusCodeSuccess => _statusCodeSuccess;
  set statusCodeSuccess(int value) {
    _statusCodeSuccess = value;
  }

  List<int> _insuranceLicenseStatusCode = [404, 404, 404, 404, 404, 404, 404];
  List<int> get insuranceLicenseStatusCode => _insuranceLicenseStatusCode;
  set insuranceLicenseStatusCode(List<int> value) {
    _insuranceLicenseStatusCode = value;
  }

  void addToInsuranceLicenseStatusCode(int value) {
    insuranceLicenseStatusCode.add(value);
  }

  void removeFromInsuranceLicenseStatusCode(int value) {
    insuranceLicenseStatusCode.remove(value);
  }

  void removeAtIndexFromInsuranceLicenseStatusCode(int index) {
    insuranceLicenseStatusCode.removeAt(index);
  }

  void updateInsuranceLicenseStatusCodeAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    insuranceLicenseStatusCode[index] =
        updateFn(_insuranceLicenseStatusCode[index]);
  }

  void insertAtIndexInInsuranceLicenseStatusCode(int index, int value) {
    insuranceLicenseStatusCode.insert(index, value);
  }

  List<DateTime> _profileInsuExpdateAD = [];
  List<DateTime> get profileInsuExpdateAD => _profileInsuExpdateAD;
  set profileInsuExpdateAD(List<DateTime> value) {
    _profileInsuExpdateAD = value;
  }

  void addToProfileInsuExpdateAD(DateTime value) {
    profileInsuExpdateAD.add(value);
  }

  void removeFromProfileInsuExpdateAD(DateTime value) {
    profileInsuExpdateAD.remove(value);
  }

  void removeAtIndexFromProfileInsuExpdateAD(int index) {
    profileInsuExpdateAD.removeAt(index);
  }

  void updateProfileInsuExpdateADAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    profileInsuExpdateAD[index] = updateFn(_profileInsuExpdateAD[index]);
  }

  void insertAtIndexInProfileInsuExpdateAD(int index, DateTime value) {
    profileInsuExpdateAD.insert(index, value);
  }

  List<bool> _expInsuLessthen30 = [];
  List<bool> get expInsuLessthen30 => _expInsuLessthen30;
  set expInsuLessthen30(List<bool> value) {
    _expInsuLessthen30 = value;
  }

  void addToExpInsuLessthen30(bool value) {
    expInsuLessthen30.add(value);
  }

  void removeFromExpInsuLessthen30(bool value) {
    expInsuLessthen30.remove(value);
  }

  void removeAtIndexFromExpInsuLessthen30(int index) {
    expInsuLessthen30.removeAt(index);
  }

  void updateExpInsuLessthen30AtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    expInsuLessthen30[index] = updateFn(_expInsuLessthen30[index]);
  }

  void insertAtIndexInExpInsuLessthen30(int index, bool value) {
    expInsuLessthen30.insert(index, value);
  }

  int _superAppi = 0;
  int get superAppi => _superAppi;
  set superAppi(int value) {
    _superAppi = value;
  }

  List<bool> _defaultlistFalse = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get defaultlistFalse => _defaultlistFalse;
  set defaultlistFalse(List<bool> value) {
    _defaultlistFalse = value;
  }

  void addToDefaultlistFalse(bool value) {
    defaultlistFalse.add(value);
  }

  void removeFromDefaultlistFalse(bool value) {
    defaultlistFalse.remove(value);
  }

  void removeAtIndexFromDefaultlistFalse(int index) {
    defaultlistFalse.removeAt(index);
  }

  void updateDefaultlistFalseAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    defaultlistFalse[index] = updateFn(_defaultlistFalse[index]);
  }

  void insertAtIndexInDefaultlistFalse(int index, bool value) {
    defaultlistFalse.insert(index, value);
  }

  List<bool> _falselistPersistd = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get falselistPersistd => _falselistPersistd;
  set falselistPersistd(List<bool> value) {
    _falselistPersistd = value;
    secureStorage.setStringList(
        'ff_falselistPersistd', value.map((x) => x.toString()).toList());
  }

  void deleteFalselistPersistd() {
    secureStorage.delete(key: 'ff_falselistPersistd');
  }

  void addToFalselistPersistd(bool value) {
    falselistPersistd.add(value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void removeFromFalselistPersistd(bool value) {
    falselistPersistd.remove(value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFalselistPersistd(int index) {
    falselistPersistd.removeAt(index);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void updateFalselistPersistdAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    falselistPersistd[index] = updateFn(_falselistPersistd[index]);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  void insertAtIndexInFalselistPersistd(int index, bool value) {
    falselistPersistd.insert(index, value);
    secureStorage.setStringList('ff_falselistPersistd',
        _falselistPersistd.map((x) => x.toString()).toList());
  }

  List<int> _InsuranceLicenseStatusCodeDefault = [
    404,
    404,
    404,
    404,
    404,
    404,
    404
  ];
  List<int> get InsuranceLicenseStatusCodeDefault =>
      _InsuranceLicenseStatusCodeDefault;
  set InsuranceLicenseStatusCodeDefault(List<int> value) {
    _InsuranceLicenseStatusCodeDefault = value;
  }

  void addToInsuranceLicenseStatusCodeDefault(int value) {
    InsuranceLicenseStatusCodeDefault.add(value);
  }

  void removeFromInsuranceLicenseStatusCodeDefault(int value) {
    InsuranceLicenseStatusCodeDefault.remove(value);
  }

  void removeAtIndexFromInsuranceLicenseStatusCodeDefault(int index) {
    InsuranceLicenseStatusCodeDefault.removeAt(index);
  }

  void updateInsuranceLicenseStatusCodeDefaultAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    InsuranceLicenseStatusCodeDefault[index] =
        updateFn(_InsuranceLicenseStatusCodeDefault[index]);
  }

  void insertAtIndexInInsuranceLicenseStatusCodeDefault(int index, int value) {
    InsuranceLicenseStatusCodeDefault.insert(index, value);
  }

  String _changeBranchName = '[branch_name]';
  String get changeBranchName => _changeBranchName;
  set changeBranchName(String value) {
    _changeBranchName = value;
  }

  bool _isGetDataViaFirebase = false;
  bool get isGetDataViaFirebase => _isGetDataViaFirebase;
  set isGetDataViaFirebase(bool value) {
    _isGetDataViaFirebase = value;
  }

  String _departmentProfile = '';
  String get departmentProfile => _departmentProfile;
  set departmentProfile(String value) {
    _departmentProfile = value;
  }

  List<String> _adminEMP = [];
  List<String> get adminEMP => _adminEMP;
  set adminEMP(List<String> value) {
    _adminEMP = value;
  }

  void addToAdminEMP(String value) {
    adminEMP.add(value);
  }

  void removeFromAdminEMP(String value) {
    adminEMP.remove(value);
  }

  void removeAtIndexFromAdminEMP(int index) {
    adminEMP.removeAt(index);
  }

  void updateAdminEMPAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adminEMP[index] = updateFn(_adminEMP[index]);
  }

  void insertAtIndexInAdminEMP(int index, String value) {
    adminEMP.insert(index, value);
  }

  bool _checkBranchDropdown = false;
  bool get checkBranchDropdown => _checkBranchDropdown;
  set checkBranchDropdown(bool value) {
    _checkBranchDropdown = value;
  }

  bool _BioAuthCheck = false;
  bool get BioAuthCheck => _BioAuthCheck;
  set BioAuthCheck(bool value) {
    _BioAuthCheck = value;
    secureStorage.setBool('ff_BioAuthCheck', value);
  }

  void deleteBioAuthCheck() {
    secureStorage.delete(key: 'ff_BioAuthCheck');
  }

  String _bossCheckFlag = '';
  String get bossCheckFlag => _bossCheckFlag;
  set bossCheckFlag(String value) {
    _bossCheckFlag = value;
  }

  bool _ApproveAllCheck = false;
  bool get ApproveAllCheck => _ApproveAllCheck;
  set ApproveAllCheck(bool value) {
    _ApproveAllCheck = value;
  }

  List<String> _ApproveSelect = [];
  List<String> get ApproveSelect => _ApproveSelect;
  set ApproveSelect(List<String> value) {
    _ApproveSelect = value;
  }

  void addToApproveSelect(String value) {
    ApproveSelect.add(value);
  }

  void removeFromApproveSelect(String value) {
    ApproveSelect.remove(value);
  }

  void removeAtIndexFromApproveSelect(int index) {
    ApproveSelect.removeAt(index);
  }

  void updateApproveSelectAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ApproveSelect[index] = updateFn(_ApproveSelect[index]);
  }

  void insertAtIndexInApproveSelect(int index, String value) {
    ApproveSelect.insert(index, value);
  }

  List<String> _tiktokNameList = [
    'กฤตกนก',
    'สุกัญญา',
    'นันทพร',
    'ชลณัฐ',
    'นรินทร์',
    'ลูกศร',
    'จรัสพร',
    'ปริยา​ภัทร​'
  ];
  List<String> get tiktokNameList => _tiktokNameList;
  set tiktokNameList(List<String> value) {
    _tiktokNameList = value;
  }

  void addToTiktokNameList(String value) {
    tiktokNameList.add(value);
  }

  void removeFromTiktokNameList(String value) {
    tiktokNameList.remove(value);
  }

  void removeAtIndexFromTiktokNameList(int index) {
    tiktokNameList.removeAt(index);
  }

  void updateTiktokNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tiktokNameList[index] = updateFn(_tiktokNameList[index]);
  }

  void insertAtIndexInTiktokNameList(int index, String value) {
    tiktokNameList.insert(index, value);
  }

  List<String> _tiktokLastnameList = [
    'บุรารักษ์',
    'ธรรมนู',
    'วงศ์คำ',
    'ธนเปี่ยมสิริ',
    'เครือม่วง',
    'อังเปรม',
    'ทำกินดี',
    'คำทะลุ​ง'
  ];
  List<String> get tiktokLastnameList => _tiktokLastnameList;
  set tiktokLastnameList(List<String> value) {
    _tiktokLastnameList = value;
  }

  void addToTiktokLastnameList(String value) {
    tiktokLastnameList.add(value);
  }

  void removeFromTiktokLastnameList(String value) {
    tiktokLastnameList.remove(value);
  }

  void removeAtIndexFromTiktokLastnameList(int index) {
    tiktokLastnameList.removeAt(index);
  }

  void updateTiktokLastnameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tiktokLastnameList[index] = updateFn(_tiktokLastnameList[index]);
  }

  void insertAtIndexInTiktokLastnameList(int index, String value) {
    tiktokLastnameList.insert(index, value);
  }

  List<String> _tiktokEmployeeIdList = [
    '32944',
    '30617',
    '27447',
    '24034',
    '13823',
    '20209',
    '7167',
    '14920'
  ];
  List<String> get tiktokEmployeeIdList => _tiktokEmployeeIdList;
  set tiktokEmployeeIdList(List<String> value) {
    _tiktokEmployeeIdList = value;
  }

  void addToTiktokEmployeeIdList(String value) {
    tiktokEmployeeIdList.add(value);
  }

  void removeFromTiktokEmployeeIdList(String value) {
    tiktokEmployeeIdList.remove(value);
  }

  void removeAtIndexFromTiktokEmployeeIdList(int index) {
    tiktokEmployeeIdList.removeAt(index);
  }

  void updateTiktokEmployeeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tiktokEmployeeIdList[index] = updateFn(_tiktokEmployeeIdList[index]);
  }

  void insertAtIndexInTiktokEmployeeIdList(int index, String value) {
    tiktokEmployeeIdList.insert(index, value);
  }

  int _maxPage = 0;
  int get maxPage => _maxPage;
  set maxPage(int value) {
    _maxPage = value;
  }

  List<String> _pageSelectionList = ['1', '2', '3', '4', '5'];
  List<String> get pageSelectionList => _pageSelectionList;
  set pageSelectionList(List<String> value) {
    _pageSelectionList = value;
  }

  void addToPageSelectionList(String value) {
    pageSelectionList.add(value);
  }

  void removeFromPageSelectionList(String value) {
    pageSelectionList.remove(value);
  }

  void removeAtIndexFromPageSelectionList(int index) {
    pageSelectionList.removeAt(index);
  }

  void updatePageSelectionListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    pageSelectionList[index] = updateFn(_pageSelectionList[index]);
  }

  void insertAtIndexInPageSelectionList(int index, String value) {
    pageSelectionList.insert(index, value);
  }

  bool _visible = false;
  bool get visible => _visible;
  set visible(bool value) {
    _visible = value;
  }

  bool _previousButtonVisible = false;
  bool get previousButtonVisible => _previousButtonVisible;
  set previousButtonVisible(bool value) {
    _previousButtonVisible = value;
  }

  bool _nextButtonVisible = false;
  bool get nextButtonVisible => _nextButtonVisible;
  set nextButtonVisible(bool value) {
    _nextButtonVisible = value;
  }

  List<int> _reportItemIndexList = [];
  List<int> get reportItemIndexList => _reportItemIndexList;
  set reportItemIndexList(List<int> value) {
    _reportItemIndexList = value;
  }

  void addToReportItemIndexList(int value) {
    reportItemIndexList.add(value);
  }

  void removeFromReportItemIndexList(int value) {
    reportItemIndexList.remove(value);
  }

  void removeAtIndexFromReportItemIndexList(int index) {
    reportItemIndexList.removeAt(index);
  }

  void updateReportItemIndexListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    reportItemIndexList[index] = updateFn(_reportItemIndexList[index]);
  }

  void insertAtIndexInReportItemIndexList(int index, int value) {
    reportItemIndexList.insert(index, value);
  }

  List<String> _leadIdSurvey = [];
  List<String> get leadIdSurvey => _leadIdSurvey;
  set leadIdSurvey(List<String> value) {
    _leadIdSurvey = value;
  }

  void addToLeadIdSurvey(String value) {
    leadIdSurvey.add(value);
  }

  void removeFromLeadIdSurvey(String value) {
    leadIdSurvey.remove(value);
  }

  void removeAtIndexFromLeadIdSurvey(int index) {
    leadIdSurvey.removeAt(index);
  }

  void updateLeadIdSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadIdSurvey[index] = updateFn(_leadIdSurvey[index]);
  }

  void insertAtIndexInLeadIdSurvey(int index, String value) {
    leadIdSurvey.insert(index, value);
  }

  List<String> _leadCustomerNameSurvey = [];
  List<String> get leadCustomerNameSurvey => _leadCustomerNameSurvey;
  set leadCustomerNameSurvey(List<String> value) {
    _leadCustomerNameSurvey = value;
  }

  void addToLeadCustomerNameSurvey(String value) {
    leadCustomerNameSurvey.add(value);
  }

  void removeFromLeadCustomerNameSurvey(String value) {
    leadCustomerNameSurvey.remove(value);
  }

  void removeAtIndexFromLeadCustomerNameSurvey(int index) {
    leadCustomerNameSurvey.removeAt(index);
  }

  void updateLeadCustomerNameSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCustomerNameSurvey[index] = updateFn(_leadCustomerNameSurvey[index]);
  }

  void insertAtIndexInLeadCustomerNameSurvey(int index, String value) {
    leadCustomerNameSurvey.insert(index, value);
  }

  List<String> _leadCreatedTimeSurvey = [];
  List<String> get leadCreatedTimeSurvey => _leadCreatedTimeSurvey;
  set leadCreatedTimeSurvey(List<String> value) {
    _leadCreatedTimeSurvey = value;
  }

  void addToLeadCreatedTimeSurvey(String value) {
    leadCreatedTimeSurvey.add(value);
  }

  void removeFromLeadCreatedTimeSurvey(String value) {
    leadCreatedTimeSurvey.remove(value);
  }

  void removeAtIndexFromLeadCreatedTimeSurvey(int index) {
    leadCreatedTimeSurvey.removeAt(index);
  }

  void updateLeadCreatedTimeSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCreatedTimeSurvey[index] = updateFn(_leadCreatedTimeSurvey[index]);
  }

  void insertAtIndexInLeadCreatedTimeSurvey(int index, String value) {
    leadCreatedTimeSurvey.insert(index, value);
  }

  List<String> _leadCallStatusSurvey = [];
  List<String> get leadCallStatusSurvey => _leadCallStatusSurvey;
  set leadCallStatusSurvey(List<String> value) {
    _leadCallStatusSurvey = value;
  }

  void addToLeadCallStatusSurvey(String value) {
    leadCallStatusSurvey.add(value);
  }

  void removeFromLeadCallStatusSurvey(String value) {
    leadCallStatusSurvey.remove(value);
  }

  void removeAtIndexFromLeadCallStatusSurvey(int index) {
    leadCallStatusSurvey.removeAt(index);
  }

  void updateLeadCallStatusSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCallStatusSurvey[index] = updateFn(_leadCallStatusSurvey[index]);
  }

  void insertAtIndexInLeadCallStatusSurvey(int index, String value) {
    leadCallStatusSurvey.insert(index, value);
  }

  List<String> _leadPhoneNumberSurvey = [];
  List<String> get leadPhoneNumberSurvey => _leadPhoneNumberSurvey;
  set leadPhoneNumberSurvey(List<String> value) {
    _leadPhoneNumberSurvey = value;
  }

  void addToLeadPhoneNumberSurvey(String value) {
    leadPhoneNumberSurvey.add(value);
  }

  void removeFromLeadPhoneNumberSurvey(String value) {
    leadPhoneNumberSurvey.remove(value);
  }

  void removeAtIndexFromLeadPhoneNumberSurvey(int index) {
    leadPhoneNumberSurvey.removeAt(index);
  }

  void updateLeadPhoneNumberSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadPhoneNumberSurvey[index] = updateFn(_leadPhoneNumberSurvey[index]);
  }

  void insertAtIndexInLeadPhoneNumberSurvey(int index, String value) {
    leadPhoneNumberSurvey.insert(index, value);
  }

  List<String> _leadEmployeeIdSurvey = [];
  List<String> get leadEmployeeIdSurvey => _leadEmployeeIdSurvey;
  set leadEmployeeIdSurvey(List<String> value) {
    _leadEmployeeIdSurvey = value;
  }

  void addToLeadEmployeeIdSurvey(String value) {
    leadEmployeeIdSurvey.add(value);
  }

  void removeFromLeadEmployeeIdSurvey(String value) {
    leadEmployeeIdSurvey.remove(value);
  }

  void removeAtIndexFromLeadEmployeeIdSurvey(int index) {
    leadEmployeeIdSurvey.removeAt(index);
  }

  void updateLeadEmployeeIdSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadEmployeeIdSurvey[index] = updateFn(_leadEmployeeIdSurvey[index]);
  }

  void insertAtIndexInLeadEmployeeIdSurvey(int index, String value) {
    leadEmployeeIdSurvey.insert(index, value);
  }

  List<String> _leadChannelSurvey = [];
  List<String> get leadChannelSurvey => _leadChannelSurvey;
  set leadChannelSurvey(List<String> value) {
    _leadChannelSurvey = value;
  }

  void addToLeadChannelSurvey(String value) {
    leadChannelSurvey.add(value);
  }

  void removeFromLeadChannelSurvey(String value) {
    leadChannelSurvey.remove(value);
  }

  void removeAtIndexFromLeadChannelSurvey(int index) {
    leadChannelSurvey.removeAt(index);
  }

  void updateLeadChannelSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadChannelSurvey[index] = updateFn(_leadChannelSurvey[index]);
  }

  void insertAtIndexInLeadChannelSurvey(int index, String value) {
    leadChannelSurvey.insert(index, value);
  }

  List<String> _leadBranchCodeSurvey = [];
  List<String> get leadBranchCodeSurvey => _leadBranchCodeSurvey;
  set leadBranchCodeSurvey(List<String> value) {
    _leadBranchCodeSurvey = value;
  }

  void addToLeadBranchCodeSurvey(String value) {
    leadBranchCodeSurvey.add(value);
  }

  void removeFromLeadBranchCodeSurvey(String value) {
    leadBranchCodeSurvey.remove(value);
  }

  void removeAtIndexFromLeadBranchCodeSurvey(int index) {
    leadBranchCodeSurvey.removeAt(index);
  }

  void updateLeadBranchCodeSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadBranchCodeSurvey[index] = updateFn(_leadBranchCodeSurvey[index]);
  }

  void insertAtIndexInLeadBranchCodeSurvey(int index, String value) {
    leadBranchCodeSurvey.insert(index, value);
  }

  List<String> _leadUserLevelSurvey = [];
  List<String> get leadUserLevelSurvey => _leadUserLevelSurvey;
  set leadUserLevelSurvey(List<String> value) {
    _leadUserLevelSurvey = value;
  }

  void addToLeadUserLevelSurvey(String value) {
    leadUserLevelSurvey.add(value);
  }

  void removeFromLeadUserLevelSurvey(String value) {
    leadUserLevelSurvey.remove(value);
  }

  void removeAtIndexFromLeadUserLevelSurvey(int index) {
    leadUserLevelSurvey.removeAt(index);
  }

  void updateLeadUserLevelSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadUserLevelSurvey[index] = updateFn(_leadUserLevelSurvey[index]);
  }

  void insertAtIndexInLeadUserLevelSurvey(int index, String value) {
    leadUserLevelSurvey.insert(index, value);
  }

  List<String> _leadCountCalledSurvey = [];
  List<String> get leadCountCalledSurvey => _leadCountCalledSurvey;
  set leadCountCalledSurvey(List<String> value) {
    _leadCountCalledSurvey = value;
  }

  void addToLeadCountCalledSurvey(String value) {
    leadCountCalledSurvey.add(value);
  }

  void removeFromLeadCountCalledSurvey(String value) {
    leadCountCalledSurvey.remove(value);
  }

  void removeAtIndexFromLeadCountCalledSurvey(int index) {
    leadCountCalledSurvey.removeAt(index);
  }

  void updateLeadCountCalledSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCountCalledSurvey[index] = updateFn(_leadCountCalledSurvey[index]);
  }

  void insertAtIndexInLeadCountCalledSurvey(int index, String value) {
    leadCountCalledSurvey.insert(index, value);
  }

  List<String> _leadCarVahicleNameSurvey = [];
  List<String> get leadCarVahicleNameSurvey => _leadCarVahicleNameSurvey;
  set leadCarVahicleNameSurvey(List<String> value) {
    _leadCarVahicleNameSurvey = value;
  }

  void addToLeadCarVahicleNameSurvey(String value) {
    leadCarVahicleNameSurvey.add(value);
  }

  void removeFromLeadCarVahicleNameSurvey(String value) {
    leadCarVahicleNameSurvey.remove(value);
  }

  void removeAtIndexFromLeadCarVahicleNameSurvey(int index) {
    leadCarVahicleNameSurvey.removeAt(index);
  }

  void updateLeadCarVahicleNameSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCarVahicleNameSurvey[index] =
        updateFn(_leadCarVahicleNameSurvey[index]);
  }

  void insertAtIndexInLeadCarVahicleNameSurvey(int index, String value) {
    leadCarVahicleNameSurvey.insert(index, value);
  }

  List<String> _leadAmountRequestSurvey = [];
  List<String> get leadAmountRequestSurvey => _leadAmountRequestSurvey;
  set leadAmountRequestSurvey(List<String> value) {
    _leadAmountRequestSurvey = value;
  }

  void addToLeadAmountRequestSurvey(String value) {
    leadAmountRequestSurvey.add(value);
  }

  void removeFromLeadAmountRequestSurvey(String value) {
    leadAmountRequestSurvey.remove(value);
  }

  void removeAtIndexFromLeadAmountRequestSurvey(int index) {
    leadAmountRequestSurvey.removeAt(index);
  }

  void updateLeadAmountRequestSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadAmountRequestSurvey[index] = updateFn(_leadAmountRequestSurvey[index]);
  }

  void insertAtIndexInLeadAmountRequestSurvey(int index, String value) {
    leadAmountRequestSurvey.insert(index, value);
  }

  List<String> _leadCalledStatusReasonSurvey = [];
  List<String> get leadCalledStatusReasonSurvey =>
      _leadCalledStatusReasonSurvey;
  set leadCalledStatusReasonSurvey(List<String> value) {
    _leadCalledStatusReasonSurvey = value;
  }

  void addToLeadCalledStatusReasonSurvey(String value) {
    leadCalledStatusReasonSurvey.add(value);
  }

  void removeFromLeadCalledStatusReasonSurvey(String value) {
    leadCalledStatusReasonSurvey.remove(value);
  }

  void removeAtIndexFromLeadCalledStatusReasonSurvey(int index) {
    leadCalledStatusReasonSurvey.removeAt(index);
  }

  void updateLeadCalledStatusReasonSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadCalledStatusReasonSurvey[index] =
        updateFn(_leadCalledStatusReasonSurvey[index]);
  }

  void insertAtIndexInLeadCalledStatusReasonSurvey(int index, String value) {
    leadCalledStatusReasonSurvey.insert(index, value);
  }

  List<String> _leadContractStatusSurvey = [];
  List<String> get leadContractStatusSurvey => _leadContractStatusSurvey;
  set leadContractStatusSurvey(List<String> value) {
    _leadContractStatusSurvey = value;
  }

  void addToLeadContractStatusSurvey(String value) {
    leadContractStatusSurvey.add(value);
  }

  void removeFromLeadContractStatusSurvey(String value) {
    leadContractStatusSurvey.remove(value);
  }

  void removeAtIndexFromLeadContractStatusSurvey(int index) {
    leadContractStatusSurvey.removeAt(index);
  }

  void updateLeadContractStatusSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractStatusSurvey[index] =
        updateFn(_leadContractStatusSurvey[index]);
  }

  void insertAtIndexInLeadContractStatusSurvey(int index, String value) {
    leadContractStatusSurvey.insert(index, value);
  }

  List<String> _leadContractDateSurvey = [];
  List<String> get leadContractDateSurvey => _leadContractDateSurvey;
  set leadContractDateSurvey(List<String> value) {
    _leadContractDateSurvey = value;
  }

  void addToLeadContractDateSurvey(String value) {
    leadContractDateSurvey.add(value);
  }

  void removeFromLeadContractDateSurvey(String value) {
    leadContractDateSurvey.remove(value);
  }

  void removeAtIndexFromLeadContractDateSurvey(int index) {
    leadContractDateSurvey.removeAt(index);
  }

  void updateLeadContractDateSurveyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadContractDateSurvey[index] = updateFn(_leadContractDateSurvey[index]);
  }

  void insertAtIndexInLeadContractDateSurvey(int index, String value) {
    leadContractDateSurvey.insert(index, value);
  }

  List<String> _leadListViewItem = [];
  List<String> get leadListViewItem => _leadListViewItem;
  set leadListViewItem(List<String> value) {
    _leadListViewItem = value;
  }

  void addToLeadListViewItem(String value) {
    leadListViewItem.add(value);
  }

  void removeFromLeadListViewItem(String value) {
    leadListViewItem.remove(value);
  }

  void removeAtIndexFromLeadListViewItem(int index) {
    leadListViewItem.removeAt(index);
  }

  void updateLeadListViewItemAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    leadListViewItem[index] = updateFn(_leadListViewItem[index]);
  }

  void insertAtIndexInLeadListViewItem(int index, String value) {
    leadListViewItem.insert(index, value);
  }

  String _profileImage =
      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
  String get profileImage => _profileImage;
  set profileImage(String value) {
    _profileImage = value;
    secureStorage.setString('ff_profileImage', value);
  }

  void deleteProfileImage() {
    secureStorage.delete(key: 'ff_profileImage');
  }

  List<bool> _timeChatIsVisibleList = [];
  List<bool> get timeChatIsVisibleList => _timeChatIsVisibleList;
  set timeChatIsVisibleList(List<bool> value) {
    _timeChatIsVisibleList = value;
  }

  void addToTimeChatIsVisibleList(bool value) {
    timeChatIsVisibleList.add(value);
  }

  void removeFromTimeChatIsVisibleList(bool value) {
    timeChatIsVisibleList.remove(value);
  }

  void removeAtIndexFromTimeChatIsVisibleList(int index) {
    timeChatIsVisibleList.removeAt(index);
  }

  void updateTimeChatIsVisibleListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    timeChatIsVisibleList[index] = updateFn(_timeChatIsVisibleList[index]);
  }

  void insertAtIndexInTimeChatIsVisibleList(int index, bool value) {
    timeChatIsVisibleList.insert(index, value);
  }

  bool _isSendMessageSuccess = false;
  bool get isSendMessageSuccess => _isSendMessageSuccess;
  set isSendMessageSuccess(bool value) {
    _isSendMessageSuccess = value;
  }

  String _chatMessagesTemp = '';
  String get chatMessagesTemp => _chatMessagesTemp;
  set chatMessagesTemp(String value) {
    _chatMessagesTemp = value;
  }

  int _idNumberTemp = 1;
  int get idNumberTemp => _idNumberTemp;
  set idNumberTemp(int value) {
    _idNumberTemp = value;
  }

  List<int> _idNumberListTemp = [];
  List<int> get idNumberListTemp => _idNumberListTemp;
  set idNumberListTemp(List<int> value) {
    _idNumberListTemp = value;
  }

  void addToIdNumberListTemp(int value) {
    idNumberListTemp.add(value);
  }

  void removeFromIdNumberListTemp(int value) {
    idNumberListTemp.remove(value);
  }

  void removeAtIndexFromIdNumberListTemp(int index) {
    idNumberListTemp.removeAt(index);
  }

  void updateIdNumberListTempAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    idNumberListTemp[index] = updateFn(_idNumberListTemp[index]);
  }

  void insertAtIndexInIdNumberListTemp(int index, int value) {
    idNumberListTemp.insert(index, value);
  }

  String _branchLocationTemp = '';
  String get branchLocationTemp => _branchLocationTemp;
  set branchLocationTemp(String value) {
    _branchLocationTemp = value;
  }

  String _branchNameTemp = '';
  String get branchNameTemp => _branchNameTemp;
  set branchNameTemp(String value) {
    _branchNameTemp = value;
  }

  dynamic _test;
  dynamic get test => _test;
  set test(dynamic value) {
    _test = value;
  }

  List<bool> _upLoadedPic = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get upLoadedPic => _upLoadedPic;
  set upLoadedPic(List<bool> value) {
    _upLoadedPic = value;
  }

  void addToUpLoadedPic(bool value) {
    upLoadedPic.add(value);
  }

  void removeFromUpLoadedPic(bool value) {
    upLoadedPic.remove(value);
  }

  void removeAtIndexFromUpLoadedPic(int index) {
    upLoadedPic.removeAt(index);
  }

  void updateUpLoadedPicAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    upLoadedPic[index] = updateFn(_upLoadedPic[index]);
  }

  void insertAtIndexInUpLoadedPic(int index, bool value) {
    upLoadedPic.insert(index, value);
  }

  List<bool> _upLoadedDoc = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get upLoadedDoc => _upLoadedDoc;
  set upLoadedDoc(List<bool> value) {
    _upLoadedDoc = value;
  }

  void addToUpLoadedDoc(bool value) {
    upLoadedDoc.add(value);
  }

  void removeFromUpLoadedDoc(bool value) {
    upLoadedDoc.remove(value);
  }

  void removeAtIndexFromUpLoadedDoc(int index) {
    upLoadedDoc.removeAt(index);
  }

  void updateUpLoadedDocAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    upLoadedDoc[index] = updateFn(_upLoadedDoc[index]);
  }

  void insertAtIndexInUpLoadedDoc(int index, bool value) {
    upLoadedDoc.insert(index, value);
  }

  bool _insuranceRequestState = false;
  bool get insuranceRequestState => _insuranceRequestState;
  set insuranceRequestState(bool value) {
    _insuranceRequestState = value;
  }

  String _operationChoiceChips = 'งานใหม่';
  String get operationChoiceChips => _operationChoiceChips;
  set operationChoiceChips(String value) {
    _operationChoiceChips = value;
  }

  String _customerTypeChoiceChips = 'บุคคลธรรมดา';
  String get customerTypeChoiceChips => _customerTypeChoiceChips;
  set customerTypeChoiceChips(String value) {
    _customerTypeChoiceChips = value;
  }

  String _vehicleTypeDropdown = 'กรุณาเลือก';
  String get vehicleTypeDropdown => _vehicleTypeDropdown;
  set vehicleTypeDropdown(String value) {
    _vehicleTypeDropdown = value;
  }

  String _boxTypeChoiceChips = 'ตู้แห้ง';
  String get boxTypeChoiceChips => _boxTypeChoiceChips;
  set boxTypeChoiceChips(String value) {
    _boxTypeChoiceChips = value;
  }

  bool _isEquipedMetalBox = false;
  bool get isEquipedMetalBox => _isEquipedMetalBox;
  set isEquipedMetalBox(bool value) {
    _isEquipedMetalBox = value;
  }

  String _insuranceBasicCusName = '';
  String get insuranceBasicCusName => _insuranceBasicCusName;
  set insuranceBasicCusName(String value) {
    _insuranceBasicCusName = value;
  }

  String _insuranceBasicCusLastname = '';
  String get insuranceBasicCusLastname => _insuranceBasicCusLastname;
  set insuranceBasicCusLastname(String value) {
    _insuranceBasicCusLastname = value;
  }

  String _insuranceBasicPlateNo = '';
  String get insuranceBasicPlateNo => _insuranceBasicPlateNo;
  set insuranceBasicPlateNo(String value) {
    _insuranceBasicPlateNo = value;
  }

  String _insuranceBasicPlateAdditional = '';
  String get insuranceBasicPlateAdditional => _insuranceBasicPlateAdditional;
  set insuranceBasicPlateAdditional(String value) {
    _insuranceBasicPlateAdditional = value;
  }

  String _insuranceBasicBrandId = '';
  String get insuranceBasicBrandId => _insuranceBasicBrandId;
  set insuranceBasicBrandId(String value) {
    _insuranceBasicBrandId = value;
  }

  String _insuranceBasicBrandCode = '';
  String get insuranceBasicBrandCode => _insuranceBasicBrandCode;
  set insuranceBasicBrandCode(String value) {
    _insuranceBasicBrandCode = value;
  }

  String _insuranceBasicBrandName = '';
  String get insuranceBasicBrandName => _insuranceBasicBrandName;
  set insuranceBasicBrandName(String value) {
    _insuranceBasicBrandName = value;
  }

  String _insuranceBasicModelId = '';
  String get insuranceBasicModelId => _insuranceBasicModelId;
  set insuranceBasicModelId(String value) {
    _insuranceBasicModelId = value;
  }

  String _insuranceBasicModelCode = '';
  String get insuranceBasicModelCode => _insuranceBasicModelCode;
  set insuranceBasicModelCode(String value) {
    _insuranceBasicModelCode = value;
  }

  String _insuranceBasicModelName = '';
  String get insuranceBasicModelName => _insuranceBasicModelName;
  set insuranceBasicModelName(String value) {
    _insuranceBasicModelName = value;
  }

  String _insuranceBasicYear = '';
  String get insuranceBasicYear => _insuranceBasicYear;
  set insuranceBasicYear(String value) {
    _insuranceBasicYear = value;
  }

  String _insuranceBasicProvinceId = '';
  String get insuranceBasicProvinceId => _insuranceBasicProvinceId;
  set insuranceBasicProvinceId(String value) {
    _insuranceBasicProvinceId = value;
  }

  String _insuranceBasicProvinceName = '';
  String get insuranceBasicProvinceName => _insuranceBasicProvinceName;
  set insuranceBasicProvinceName(String value) {
    _insuranceBasicProvinceName = value;
  }

  String _insuranceBasicUsedType = '';
  String get insuranceBasicUsedType => _insuranceBasicUsedType;
  set insuranceBasicUsedType(String value) {
    _insuranceBasicUsedType = value;
  }

  bool _insuranceBasicCarModify = false;
  bool get insuranceBasicCarModify => _insuranceBasicCarModify;
  set insuranceBasicCarModify(bool value) {
    _insuranceBasicCarModify = value;
  }

  String _insuranceBasicAccessoryProtected = '';
  String get insuranceBasicAccessoryProtected =>
      _insuranceBasicAccessoryProtected;
  set insuranceBasicAccessoryProtected(String value) {
    _insuranceBasicAccessoryProtected = value;
  }

  String _insuranceBasicCusPhone = '';
  String get insuranceBasicCusPhone => _insuranceBasicCusPhone;
  set insuranceBasicCusPhone(String value) {
    _insuranceBasicCusPhone = value;
  }

  String _insuranceBasicDriverType = '';
  String get insuranceBasicDriverType => _insuranceBasicDriverType;
  set insuranceBasicDriverType(String value) {
    _insuranceBasicDriverType = value;
  }

  String _insuranceBasicIdCardNo = '';
  String get insuranceBasicIdCardNo => _insuranceBasicIdCardNo;
  set insuranceBasicIdCardNo(String value) {
    _insuranceBasicIdCardNo = value;
  }

  String _insuranceBasicOldLicenseNo = '';
  String get insuranceBasicOldLicenseNo => _insuranceBasicOldLicenseNo;
  set insuranceBasicOldLicenseNo(String value) {
    _insuranceBasicOldLicenseNo = value;
  }

  bool _insuranceBasicMetalBox = false;
  bool get insuranceBasicMetalBox => _insuranceBasicMetalBox;
  set insuranceBasicMetalBox(bool value) {
    _insuranceBasicMetalBox = value;
  }

  bool _insuranceBasicCoop = false;
  bool get insuranceBasicCoop => _insuranceBasicCoop;
  set insuranceBasicCoop(bool value) {
    _insuranceBasicCoop = value;
  }

  String _insuranceBasicPickupBoxType = '';
  String get insuranceBasicPickupBoxType => _insuranceBasicPickupBoxType;
  set insuranceBasicPickupBoxType(String value) {
    _insuranceBasicPickupBoxType = value;
  }

  String _insuranceBasicPickupBoxPrice = '';
  String get insuranceBasicPickupBoxPrice => _insuranceBasicPickupBoxPrice;
  set insuranceBasicPickupBoxPrice(String value) {
    _insuranceBasicPickupBoxPrice = value;
  }

  String _insuranceBasicTruckCurrentPrice = '';
  String get insuranceBasicTruckCurrentPrice =>
      _insuranceBasicTruckCurrentPrice;
  set insuranceBasicTruckCurrentPrice(String value) {
    _insuranceBasicTruckCurrentPrice = value;
  }

  String _insuranceBasicCarryPurpose = '';
  String get insuranceBasicCarryPurpose => _insuranceBasicCarryPurpose;
  set insuranceBasicCarryPurpose(String value) {
    _insuranceBasicCarryPurpose = value;
  }

  bool _insurancePackageInsurer = false;
  bool get insurancePackageInsurer => _insurancePackageInsurer;
  set insurancePackageInsurer(bool value) {
    _insurancePackageInsurer = value;
  }

  String _insuranceBasicMemberType = '';
  String get insuranceBasicMemberType => _insuranceBasicMemberType;
  set insuranceBasicMemberType(String value) {
    _insuranceBasicMemberType = value;
  }

  String _insuranceBasicRemark = '';
  String get insuranceBasicRemark => _insuranceBasicRemark;
  set insuranceBasicRemark(String value) {
    _insuranceBasicRemark = value;
  }

  List<String> _teleProvinceId = [];
  List<String> get teleProvinceId => _teleProvinceId;
  set teleProvinceId(List<String> value) {
    _teleProvinceId = value;
  }

  void addToTeleProvinceId(String value) {
    teleProvinceId.add(value);
  }

  void removeFromTeleProvinceId(String value) {
    teleProvinceId.remove(value);
  }

  void removeAtIndexFromTeleProvinceId(int index) {
    teleProvinceId.removeAt(index);
  }

  void updateTeleProvinceIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    teleProvinceId[index] = updateFn(_teleProvinceId[index]);
  }

  void insertAtIndexInTeleProvinceId(int index, String value) {
    teleProvinceId.insert(index, value);
  }

  bool _insuranceModelIsGenerating = false;
  bool get insuranceModelIsGenerating => _insuranceModelIsGenerating;
  set insuranceModelIsGenerating(bool value) {
    _insuranceModelIsGenerating = value;
  }

  List<String> _insuranceBasicOriginalModelName = [];
  List<String> get insuranceBasicOriginalModelName =>
      _insuranceBasicOriginalModelName;
  set insuranceBasicOriginalModelName(List<String> value) {
    _insuranceBasicOriginalModelName = value;
  }

  void addToInsuranceBasicOriginalModelName(String value) {
    insuranceBasicOriginalModelName.add(value);
  }

  void removeFromInsuranceBasicOriginalModelName(String value) {
    insuranceBasicOriginalModelName.remove(value);
  }

  void removeAtIndexFromInsuranceBasicOriginalModelName(int index) {
    insuranceBasicOriginalModelName.removeAt(index);
  }

  void updateInsuranceBasicOriginalModelNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicOriginalModelName[index] =
        updateFn(_insuranceBasicOriginalModelName[index]);
  }

  void insertAtIndexInInsuranceBasicOriginalModelName(int index, String value) {
    insuranceBasicOriginalModelName.insert(index, value);
  }

  List<String> _insuranceBasicBrandIdList = [];
  List<String> get insuranceBasicBrandIdList => _insuranceBasicBrandIdList;
  set insuranceBasicBrandIdList(List<String> value) {
    _insuranceBasicBrandIdList = value;
  }

  void addToInsuranceBasicBrandIdList(String value) {
    insuranceBasicBrandIdList.add(value);
  }

  void removeFromInsuranceBasicBrandIdList(String value) {
    insuranceBasicBrandIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicBrandIdList(int index) {
    insuranceBasicBrandIdList.removeAt(index);
  }

  void updateInsuranceBasicBrandIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicBrandIdList[index] =
        updateFn(_insuranceBasicBrandIdList[index]);
  }

  void insertAtIndexInInsuranceBasicBrandIdList(int index, String value) {
    insuranceBasicBrandIdList.insert(index, value);
  }

  List<String> _insuranceBasicBrandNameList = [];
  List<String> get insuranceBasicBrandNameList => _insuranceBasicBrandNameList;
  set insuranceBasicBrandNameList(List<String> value) {
    _insuranceBasicBrandNameList = value;
  }

  void addToInsuranceBasicBrandNameList(String value) {
    insuranceBasicBrandNameList.add(value);
  }

  void removeFromInsuranceBasicBrandNameList(String value) {
    insuranceBasicBrandNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicBrandNameList(int index) {
    insuranceBasicBrandNameList.removeAt(index);
  }

  void updateInsuranceBasicBrandNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicBrandNameList[index] =
        updateFn(_insuranceBasicBrandNameList[index]);
  }

  void insertAtIndexInInsuranceBasicBrandNameList(int index, String value) {
    insuranceBasicBrandNameList.insert(index, value);
  }

  List<String> _insuranceBasicModelIdListOriginal = [];
  List<String> get insuranceBasicModelIdListOriginal =>
      _insuranceBasicModelIdListOriginal;
  set insuranceBasicModelIdListOriginal(List<String> value) {
    _insuranceBasicModelIdListOriginal = value;
  }

  void addToInsuranceBasicModelIdListOriginal(String value) {
    insuranceBasicModelIdListOriginal.add(value);
  }

  void removeFromInsuranceBasicModelIdListOriginal(String value) {
    insuranceBasicModelIdListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelIdListOriginal(int index) {
    insuranceBasicModelIdListOriginal.removeAt(index);
  }

  void updateInsuranceBasicModelIdListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelIdListOriginal[index] =
        updateFn(_insuranceBasicModelIdListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicModelIdListOriginal(
      int index, String value) {
    insuranceBasicModelIdListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicModelIdList = [];
  List<String> get insuranceBasicModelIdList => _insuranceBasicModelIdList;
  set insuranceBasicModelIdList(List<String> value) {
    _insuranceBasicModelIdList = value;
  }

  void addToInsuranceBasicModelIdList(String value) {
    insuranceBasicModelIdList.add(value);
  }

  void removeFromInsuranceBasicModelIdList(String value) {
    insuranceBasicModelIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelIdList(int index) {
    insuranceBasicModelIdList.removeAt(index);
  }

  void updateInsuranceBasicModelIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelIdList[index] =
        updateFn(_insuranceBasicModelIdList[index]);
  }

  void insertAtIndexInInsuranceBasicModelIdList(int index, String value) {
    insuranceBasicModelIdList.insert(index, value);
  }

  List<String> _insuranceBasicModelNameListOriginal = [];
  List<String> get insuranceBasicModelNameListOriginal =>
      _insuranceBasicModelNameListOriginal;
  set insuranceBasicModelNameListOriginal(List<String> value) {
    _insuranceBasicModelNameListOriginal = value;
  }

  void addToInsuranceBasicModelNameListOriginal(String value) {
    insuranceBasicModelNameListOriginal.add(value);
  }

  void removeFromInsuranceBasicModelNameListOriginal(String value) {
    insuranceBasicModelNameListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelNameListOriginal(int index) {
    insuranceBasicModelNameListOriginal.removeAt(index);
  }

  void updateInsuranceBasicModelNameListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelNameListOriginal[index] =
        updateFn(_insuranceBasicModelNameListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicModelNameListOriginal(
      int index, String value) {
    insuranceBasicModelNameListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicModelNameList = [];
  List<String> get insuranceBasicModelNameList => _insuranceBasicModelNameList;
  set insuranceBasicModelNameList(List<String> value) {
    _insuranceBasicModelNameList = value;
  }

  void addToInsuranceBasicModelNameList(String value) {
    insuranceBasicModelNameList.add(value);
  }

  void removeFromInsuranceBasicModelNameList(String value) {
    insuranceBasicModelNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelNameList(int index) {
    insuranceBasicModelNameList.removeAt(index);
  }

  void updateInsuranceBasicModelNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelNameList[index] =
        updateFn(_insuranceBasicModelNameList[index]);
  }

  void insertAtIndexInInsuranceBasicModelNameList(int index, String value) {
    insuranceBasicModelNameList.insert(index, value);
  }

  List<String> _insuranceBasicProvinceIdList = [];
  List<String> get insuranceBasicProvinceIdList =>
      _insuranceBasicProvinceIdList;
  set insuranceBasicProvinceIdList(List<String> value) {
    _insuranceBasicProvinceIdList = value;
  }

  void addToInsuranceBasicProvinceIdList(String value) {
    insuranceBasicProvinceIdList.add(value);
  }

  void removeFromInsuranceBasicProvinceIdList(String value) {
    insuranceBasicProvinceIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicProvinceIdList(int index) {
    insuranceBasicProvinceIdList.removeAt(index);
  }

  void updateInsuranceBasicProvinceIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicProvinceIdList[index] =
        updateFn(_insuranceBasicProvinceIdList[index]);
  }

  void insertAtIndexInInsuranceBasicProvinceIdList(int index, String value) {
    insuranceBasicProvinceIdList.insert(index, value);
  }

  List<String> _insuranceBasicProvinceNameList = [];
  List<String> get insuranceBasicProvinceNameList =>
      _insuranceBasicProvinceNameList;
  set insuranceBasicProvinceNameList(List<String> value) {
    _insuranceBasicProvinceNameList = value;
  }

  void addToInsuranceBasicProvinceNameList(String value) {
    insuranceBasicProvinceNameList.add(value);
  }

  void removeFromInsuranceBasicProvinceNameList(String value) {
    insuranceBasicProvinceNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicProvinceNameList(int index) {
    insuranceBasicProvinceNameList.removeAt(index);
  }

  void updateInsuranceBasicProvinceNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicProvinceNameList[index] =
        updateFn(_insuranceBasicProvinceNameList[index]);
  }

  void insertAtIndexInInsuranceBasicProvinceNameList(int index, String value) {
    insuranceBasicProvinceNameList.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeIdList = [];
  List<String> get insuranceBasicVehicleUsedTypeIdList =>
      _insuranceBasicVehicleUsedTypeIdList;
  set insuranceBasicVehicleUsedTypeIdList(List<String> value) {
    _insuranceBasicVehicleUsedTypeIdList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeIdList(String value) {
    insuranceBasicVehicleUsedTypeIdList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeIdList(String value) {
    insuranceBasicVehicleUsedTypeIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeIdList(int index) {
    insuranceBasicVehicleUsedTypeIdList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeIdList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeIdList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeIdList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeIdList.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeNameList = [];
  List<String> get insuranceBasicVehicleUsedTypeNameList =>
      _insuranceBasicVehicleUsedTypeNameList;
  set insuranceBasicVehicleUsedTypeNameList(List<String> value) {
    _insuranceBasicVehicleUsedTypeNameList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeNameList(String value) {
    insuranceBasicVehicleUsedTypeNameList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeNameList(String value) {
    insuranceBasicVehicleUsedTypeNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeNameList(int index) {
    insuranceBasicVehicleUsedTypeNameList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeNameList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeNameList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeNameList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeNameList.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeTypeList = [];
  List<String> get insuranceBasicVehicleUsedTypeTypeList =>
      _insuranceBasicVehicleUsedTypeTypeList;
  set insuranceBasicVehicleUsedTypeTypeList(List<String> value) {
    _insuranceBasicVehicleUsedTypeTypeList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeTypeList(String value) {
    insuranceBasicVehicleUsedTypeTypeList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeTypeList(String value) {
    insuranceBasicVehicleUsedTypeTypeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeTypeList(int index) {
    insuranceBasicVehicleUsedTypeTypeList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeTypeList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeTypeList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeTypeList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeTypeList.insert(index, value);
  }

  List<String> _insuranceBasicModelBrandIdListOriginal = [];
  List<String> get insuranceBasicModelBrandIdListOriginal =>
      _insuranceBasicModelBrandIdListOriginal;
  set insuranceBasicModelBrandIdListOriginal(List<String> value) {
    _insuranceBasicModelBrandIdListOriginal = value;
  }

  void addToInsuranceBasicModelBrandIdListOriginal(String value) {
    insuranceBasicModelBrandIdListOriginal.add(value);
  }

  void removeFromInsuranceBasicModelBrandIdListOriginal(String value) {
    insuranceBasicModelBrandIdListOriginal.remove(value);
  }

  void removeAtIndexFromInsuranceBasicModelBrandIdListOriginal(int index) {
    insuranceBasicModelBrandIdListOriginal.removeAt(index);
  }

  void updateInsuranceBasicModelBrandIdListOriginalAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicModelBrandIdListOriginal[index] =
        updateFn(_insuranceBasicModelBrandIdListOriginal[index]);
  }

  void insertAtIndexInInsuranceBasicModelBrandIdListOriginal(
      int index, String value) {
    insuranceBasicModelBrandIdListOriginal.insert(index, value);
  }

  List<String> _insuranceBasicVehicleUsedTypeCodeList = [];
  List<String> get insuranceBasicVehicleUsedTypeCodeList =>
      _insuranceBasicVehicleUsedTypeCodeList;
  set insuranceBasicVehicleUsedTypeCodeList(List<String> value) {
    _insuranceBasicVehicleUsedTypeCodeList = value;
  }

  void addToInsuranceBasicVehicleUsedTypeCodeList(String value) {
    insuranceBasicVehicleUsedTypeCodeList.add(value);
  }

  void removeFromInsuranceBasicVehicleUsedTypeCodeList(String value) {
    insuranceBasicVehicleUsedTypeCodeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicVehicleUsedTypeCodeList(int index) {
    insuranceBasicVehicleUsedTypeCodeList.removeAt(index);
  }

  void updateInsuranceBasicVehicleUsedTypeCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicVehicleUsedTypeCodeList[index] =
        updateFn(_insuranceBasicVehicleUsedTypeCodeList[index]);
  }

  void insertAtIndexInInsuranceBasicVehicleUsedTypeCodeList(
      int index, String value) {
    insuranceBasicVehicleUsedTypeCodeList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerIdList = [];
  List<String> get insuranceBasicInsurerIdList => _insuranceBasicInsurerIdList;
  set insuranceBasicInsurerIdList(List<String> value) {
    _insuranceBasicInsurerIdList = value;
  }

  void addToInsuranceBasicInsurerIdList(String value) {
    insuranceBasicInsurerIdList.add(value);
  }

  void removeFromInsuranceBasicInsurerIdList(String value) {
    insuranceBasicInsurerIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerIdList(int index) {
    insuranceBasicInsurerIdList.removeAt(index);
  }

  void updateInsuranceBasicInsurerIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerIdList[index] =
        updateFn(_insuranceBasicInsurerIdList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerIdList(int index, String value) {
    insuranceBasicInsurerIdList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerCodeList = [];
  List<String> get insuranceBasicInsurerCodeList =>
      _insuranceBasicInsurerCodeList;
  set insuranceBasicInsurerCodeList(List<String> value) {
    _insuranceBasicInsurerCodeList = value;
  }

  void addToInsuranceBasicInsurerCodeList(String value) {
    insuranceBasicInsurerCodeList.add(value);
  }

  void removeFromInsuranceBasicInsurerCodeList(String value) {
    insuranceBasicInsurerCodeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerCodeList(int index) {
    insuranceBasicInsurerCodeList.removeAt(index);
  }

  void updateInsuranceBasicInsurerCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerCodeList[index] =
        updateFn(_insuranceBasicInsurerCodeList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerCodeList(int index, String value) {
    insuranceBasicInsurerCodeList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerShortNameList = [];
  List<String> get insuranceBasicInsurerShortNameList =>
      _insuranceBasicInsurerShortNameList;
  set insuranceBasicInsurerShortNameList(List<String> value) {
    _insuranceBasicInsurerShortNameList = value;
  }

  void addToInsuranceBasicInsurerShortNameList(String value) {
    insuranceBasicInsurerShortNameList.add(value);
  }

  void removeFromInsuranceBasicInsurerShortNameList(String value) {
    insuranceBasicInsurerShortNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerShortNameList(int index) {
    insuranceBasicInsurerShortNameList.removeAt(index);
  }

  void updateInsuranceBasicInsurerShortNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerShortNameList[index] =
        updateFn(_insuranceBasicInsurerShortNameList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerShortNameList(
      int index, String value) {
    insuranceBasicInsurerShortNameList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerFullNameList = [];
  List<String> get insuranceBasicInsurerFullNameList =>
      _insuranceBasicInsurerFullNameList;
  set insuranceBasicInsurerFullNameList(List<String> value) {
    _insuranceBasicInsurerFullNameList = value;
  }

  void addToInsuranceBasicInsurerFullNameList(String value) {
    insuranceBasicInsurerFullNameList.add(value);
  }

  void removeFromInsuranceBasicInsurerFullNameList(String value) {
    insuranceBasicInsurerFullNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerFullNameList(int index) {
    insuranceBasicInsurerFullNameList.removeAt(index);
  }

  void updateInsuranceBasicInsurerFullNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerFullNameList[index] =
        updateFn(_insuranceBasicInsurerFullNameList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerFullNameList(
      int index, String value) {
    insuranceBasicInsurerFullNameList.insert(index, value);
  }

  String _insuranceBasicTruckPart = '';
  String get insuranceBasicTruckPart => _insuranceBasicTruckPart;
  set insuranceBasicTruckPart(String value) {
    _insuranceBasicTruckPart = value;
  }

  List<bool> _upLoadedPic2 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get upLoadedPic2 => _upLoadedPic2;
  set upLoadedPic2(List<bool> value) {
    _upLoadedPic2 = value;
  }

  void addToUpLoadedPic2(bool value) {
    upLoadedPic2.add(value);
  }

  void removeFromUpLoadedPic2(bool value) {
    upLoadedPic2.remove(value);
  }

  void removeAtIndexFromUpLoadedPic2(int index) {
    upLoadedPic2.removeAt(index);
  }

  void updateUpLoadedPic2AtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    upLoadedPic2[index] = updateFn(_upLoadedPic2[index]);
  }

  void insertAtIndexInUpLoadedPic2(int index, bool value) {
    upLoadedPic2.insert(index, value);
  }

  List<bool> _upLoadedPic3 = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> get upLoadedPic3 => _upLoadedPic3;
  set upLoadedPic3(List<bool> value) {
    _upLoadedPic3 = value;
  }

  void addToUpLoadedPic3(bool value) {
    upLoadedPic3.add(value);
  }

  void removeFromUpLoadedPic3(bool value) {
    upLoadedPic3.remove(value);
  }

  void removeAtIndexFromUpLoadedPic3(int index) {
    upLoadedPic3.removeAt(index);
  }

  void updateUpLoadedPic3AtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    upLoadedPic3[index] = updateFn(_upLoadedPic3[index]);
  }

  void insertAtIndexInUpLoadedPic3(int index, bool value) {
    upLoadedPic3.insert(index, value);
  }

  String _insuranceBasicGarageId = '';
  String get insuranceBasicGarageId => _insuranceBasicGarageId;
  set insuranceBasicGarageId(String value) {
    _insuranceBasicGarageId = value;
  }

  String _insuranceBasicGarageName = '';
  String get insuranceBasicGarageName => _insuranceBasicGarageName;
  set insuranceBasicGarageName(String value) {
    _insuranceBasicGarageName = value;
  }

  String _insuranceBasicCoverTypeId = '';
  String get insuranceBasicCoverTypeId => _insuranceBasicCoverTypeId;
  set insuranceBasicCoverTypeId(String value) {
    _insuranceBasicCoverTypeId = value;
  }

  String _insuranceBasicCoverTypeCode = '';
  String get insuranceBasicCoverTypeCode => _insuranceBasicCoverTypeCode;
  set insuranceBasicCoverTypeCode(String value) {
    _insuranceBasicCoverTypeCode = value;
  }

  String _insuranceBasicCoverTypeName = '';
  String get insuranceBasicCoverTypeName => _insuranceBasicCoverTypeName;
  set insuranceBasicCoverTypeName(String value) {
    _insuranceBasicCoverTypeName = value;
  }

  List<String> _insuranceBasicCoverTypeIdList = [];
  List<String> get insuranceBasicCoverTypeIdList =>
      _insuranceBasicCoverTypeIdList;
  set insuranceBasicCoverTypeIdList(List<String> value) {
    _insuranceBasicCoverTypeIdList = value;
  }

  void addToInsuranceBasicCoverTypeIdList(String value) {
    insuranceBasicCoverTypeIdList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeIdList(String value) {
    insuranceBasicCoverTypeIdList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeIdList(int index) {
    insuranceBasicCoverTypeIdList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeIdListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeIdList[index] =
        updateFn(_insuranceBasicCoverTypeIdList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeIdList(int index, String value) {
    insuranceBasicCoverTypeIdList.insert(index, value);
  }

  List<String> _insuranceBasicCoverTypeCodeList = [];
  List<String> get insuranceBasicCoverTypeCodeList =>
      _insuranceBasicCoverTypeCodeList;
  set insuranceBasicCoverTypeCodeList(List<String> value) {
    _insuranceBasicCoverTypeCodeList = value;
  }

  void addToInsuranceBasicCoverTypeCodeList(String value) {
    insuranceBasicCoverTypeCodeList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeCodeList(String value) {
    insuranceBasicCoverTypeCodeList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeCodeList(int index) {
    insuranceBasicCoverTypeCodeList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeCodeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeCodeList[index] =
        updateFn(_insuranceBasicCoverTypeCodeList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeCodeList(int index, String value) {
    insuranceBasicCoverTypeCodeList.insert(index, value);
  }

  List<String> _insuranceBasicCoverTypeNameList = [];
  List<String> get insuranceBasicCoverTypeNameList =>
      _insuranceBasicCoverTypeNameList;
  set insuranceBasicCoverTypeNameList(List<String> value) {
    _insuranceBasicCoverTypeNameList = value;
  }

  void addToInsuranceBasicCoverTypeNameList(String value) {
    insuranceBasicCoverTypeNameList.add(value);
  }

  void removeFromInsuranceBasicCoverTypeNameList(String value) {
    insuranceBasicCoverTypeNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicCoverTypeNameList(int index) {
    insuranceBasicCoverTypeNameList.removeAt(index);
  }

  void updateInsuranceBasicCoverTypeNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicCoverTypeNameList[index] =
        updateFn(_insuranceBasicCoverTypeNameList[index]);
  }

  void insertAtIndexInInsuranceBasicCoverTypeNameList(int index, String value) {
    insuranceBasicCoverTypeNameList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerIdOutput = [];
  List<String> get insuranceBasicInsurerIdOutput =>
      _insuranceBasicInsurerIdOutput;
  set insuranceBasicInsurerIdOutput(List<String> value) {
    _insuranceBasicInsurerIdOutput = value;
  }

  void addToInsuranceBasicInsurerIdOutput(String value) {
    insuranceBasicInsurerIdOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerIdOutput(String value) {
    insuranceBasicInsurerIdOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerIdOutput(int index) {
    insuranceBasicInsurerIdOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerIdOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerIdOutput[index] =
        updateFn(_insuranceBasicInsurerIdOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerIdOutput(int index, String value) {
    insuranceBasicInsurerIdOutput.insert(index, value);
  }

  List<String> _insuranceBasicInsurerCodeOutput = [];
  List<String> get insuranceBasicInsurerCodeOutput =>
      _insuranceBasicInsurerCodeOutput;
  set insuranceBasicInsurerCodeOutput(List<String> value) {
    _insuranceBasicInsurerCodeOutput = value;
  }

  void addToInsuranceBasicInsurerCodeOutput(String value) {
    insuranceBasicInsurerCodeOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerCodeOutput(String value) {
    insuranceBasicInsurerCodeOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerCodeOutput(int index) {
    insuranceBasicInsurerCodeOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerCodeOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerCodeOutput[index] =
        updateFn(_insuranceBasicInsurerCodeOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerCodeOutput(int index, String value) {
    insuranceBasicInsurerCodeOutput.insert(index, value);
  }

  List<String> _insuranceBasicInsurerShortNameOutput = [];
  List<String> get insuranceBasicInsurerShortNameOutput =>
      _insuranceBasicInsurerShortNameOutput;
  set insuranceBasicInsurerShortNameOutput(List<String> value) {
    _insuranceBasicInsurerShortNameOutput = value;
  }

  void addToInsuranceBasicInsurerShortNameOutput(String value) {
    insuranceBasicInsurerShortNameOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerShortNameOutput(String value) {
    insuranceBasicInsurerShortNameOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerShortNameOutput(int index) {
    insuranceBasicInsurerShortNameOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerShortNameOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerShortNameOutput[index] =
        updateFn(_insuranceBasicInsurerShortNameOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerShortNameOutput(
      int index, String value) {
    insuranceBasicInsurerShortNameOutput.insert(index, value);
  }

  List<String> _insuranceBasicInsurerFullNameOutput = [];
  List<String> get insuranceBasicInsurerFullNameOutput =>
      _insuranceBasicInsurerFullNameOutput;
  set insuranceBasicInsurerFullNameOutput(List<String> value) {
    _insuranceBasicInsurerFullNameOutput = value;
  }

  void addToInsuranceBasicInsurerFullNameOutput(String value) {
    insuranceBasicInsurerFullNameOutput.add(value);
  }

  void removeFromInsuranceBasicInsurerFullNameOutput(String value) {
    insuranceBasicInsurerFullNameOutput.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerFullNameOutput(int index) {
    insuranceBasicInsurerFullNameOutput.removeAt(index);
  }

  void updateInsuranceBasicInsurerFullNameOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerFullNameOutput[index] =
        updateFn(_insuranceBasicInsurerFullNameOutput[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerFullNameOutput(
      int index, String value) {
    insuranceBasicInsurerFullNameOutput.insert(index, value);
  }

  String _insuranceBasicActFlag = '';
  String get insuranceBasicActFlag => _insuranceBasicActFlag;
  set insuranceBasicActFlag(String value) {
    _insuranceBasicActFlag = value;
  }

  String _insuranceBasicVehicleUsedTypeId = '';
  String get insuranceBasicVehicleUsedTypeId =>
      _insuranceBasicVehicleUsedTypeId;
  set insuranceBasicVehicleUsedTypeId(String value) {
    _insuranceBasicVehicleUsedTypeId = value;
  }

  String _insuranceBasicVehicleUsedTypeCode = '';
  String get insuranceBasicVehicleUsedTypeCode =>
      _insuranceBasicVehicleUsedTypeCode;
  set insuranceBasicVehicleUsedTypeCode(String value) {
    _insuranceBasicVehicleUsedTypeCode = value;
  }

  String _insuranceBasicVehicleUsedTypeName = '';
  String get insuranceBasicVehicleUsedTypeName =>
      _insuranceBasicVehicleUsedTypeName;
  set insuranceBasicVehicleUsedTypeName(String value) {
    _insuranceBasicVehicleUsedTypeName = value;
  }

  String _insuranceBasicSumInsured = '';
  String get insuranceBasicSumInsured => _insuranceBasicSumInsured;
  set insuranceBasicSumInsured(String value) {
    _insuranceBasicSumInsured = value;
  }

  bool _insuranceRequestIsLoadedData = false;
  bool get insuranceRequestIsLoadedData => _insuranceRequestIsLoadedData;
  set insuranceRequestIsLoadedData(bool value) {
    _insuranceRequestIsLoadedData = value;
  }

  int _successStatusCode = 201;
  int get successStatusCode => _successStatusCode;
  set successStatusCode(int value) {
    _successStatusCode = value;
  }

  String _insuranceBasicTrailerSumInsured = '';
  String get insuranceBasicTrailerSumInsured =>
      _insuranceBasicTrailerSumInsured;
  set insuranceBasicTrailerSumInsured(String value) {
    _insuranceBasicTrailerSumInsured = value;
  }

  String _insuranceBasicListFlagRenew = '1';
  String get insuranceBasicListFlagRenew => _insuranceBasicListFlagRenew;
  set insuranceBasicListFlagRenew(String value) {
    _insuranceBasicListFlagRenew = value;
  }

  List<String> _insuranceBasicInsurerListNameList = [];
  List<String> get insuranceBasicInsurerListNameList =>
      _insuranceBasicInsurerListNameList;
  set insuranceBasicInsurerListNameList(List<String> value) {
    _insuranceBasicInsurerListNameList = value;
  }

  void addToInsuranceBasicInsurerListNameList(String value) {
    insuranceBasicInsurerListNameList.add(value);
  }

  void removeFromInsuranceBasicInsurerListNameList(String value) {
    insuranceBasicInsurerListNameList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerListNameList(int index) {
    insuranceBasicInsurerListNameList.removeAt(index);
  }

  void updateInsuranceBasicInsurerListNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerListNameList[index] =
        updateFn(_insuranceBasicInsurerListNameList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerListNameList(
      int index, String value) {
    insuranceBasicInsurerListNameList.insert(index, value);
  }

  List<String> _insuranceBasicInsurerListNameRandomList = [];
  List<String> get insuranceBasicInsurerListNameRandomList =>
      _insuranceBasicInsurerListNameRandomList;
  set insuranceBasicInsurerListNameRandomList(List<String> value) {
    _insuranceBasicInsurerListNameRandomList = value;
  }

  void addToInsuranceBasicInsurerListNameRandomList(String value) {
    insuranceBasicInsurerListNameRandomList.add(value);
  }

  void removeFromInsuranceBasicInsurerListNameRandomList(String value) {
    insuranceBasicInsurerListNameRandomList.remove(value);
  }

  void removeAtIndexFromInsuranceBasicInsurerListNameRandomList(int index) {
    insuranceBasicInsurerListNameRandomList.removeAt(index);
  }

  void updateInsuranceBasicInsurerListNameRandomListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    insuranceBasicInsurerListNameRandomList[index] =
        updateFn(_insuranceBasicInsurerListNameRandomList[index]);
  }

  void insertAtIndexInInsuranceBasicInsurerListNameRandomList(
      int index, String value) {
    insuranceBasicInsurerListNameRandomList.insert(index, value);
  }

  String _fromPage = 'Dashboard';
  String get fromPage => _fromPage;
  set fromPage(String value) {
    _fromPage = value;
  }

  String _insuranceOperationChoiceChips = 'งานใหม่          ';
  String get insuranceOperationChoiceChips => _insuranceOperationChoiceChips;
  set insuranceOperationChoiceChips(String value) {
    _insuranceOperationChoiceChips = value;
  }

  String _insuranceCustomerTypeChoiceChips = 'บุคคลธรรมดา';
  String get insuranceCustomerTypeChoiceChips =>
      _insuranceCustomerTypeChoiceChips;
  set insuranceCustomerTypeChoiceChips(String value) {
    _insuranceCustomerTypeChoiceChips = value;
  }

  bool _insuranceBoxCheckbokValue = false;
  bool get insuranceBoxCheckbokValue => _insuranceBoxCheckbokValue;
  set insuranceBoxCheckbokValue(bool value) {
    _insuranceBoxCheckbokValue = value;
  }

  String _insuranceBoxTypeChoiceChip = 'ตู้แห้ง';
  String get insuranceBoxTypeChoiceChip => _insuranceBoxTypeChoiceChip;
  set insuranceBoxTypeChoiceChip(String value) {
    _insuranceBoxTypeChoiceChip = value;
  }

  String _insuranceVehicleTypeDropDown = 'กรุณาเลือก';
  String get insuranceVehicleTypeDropDown => _insuranceVehicleTypeDropDown;
  set insuranceVehicleTypeDropDown(String value) {
    _insuranceVehicleTypeDropDown = value;
  }

  String _imageOtherName = '';
  String get imageOtherName => _imageOtherName;
  set imageOtherName(String value) {
    _imageOtherName = value;
  }

  String _apiUrlInsurance = '';
  String get apiUrlInsurance => _apiUrlInsurance;
  set apiUrlInsurance(String value) {
    _apiUrlInsurance = value;
  }

  DateTime? _insuranceBasicExpireDateOldPolicy;
  DateTime? get insuranceBasicExpireDateOldPolicy =>
      _insuranceBasicExpireDateOldPolicy;
  set insuranceBasicExpireDateOldPolicy(DateTime? value) {
    _insuranceBasicExpireDateOldPolicy = value;
  }

  DocumentReference? _bsiDocRef =
      FirebaseFirestore.instance.doc('/ReportStorage/8d0oIX3njCi8XNGxSiTJ');
  DocumentReference? get bsiDocRef => _bsiDocRef;
  set bsiDocRef(DocumentReference? value) {
    _bsiDocRef = value;
  }

  DocumentReference? _tableauUrlDocRef =
      FirebaseFirestore.instance.doc('/urlLinkStorage/3WxCM5bS5ebjS9yYqRIm');
  DocumentReference? get tableauUrlDocRef => _tableauUrlDocRef;
  set tableauUrlDocRef(DocumentReference? value) {
    _tableauUrlDocRef = value;
  }

  List<String> _searchNameCollection = [];
  List<String> get searchNameCollection => _searchNameCollection;
  set searchNameCollection(List<String> value) {
    _searchNameCollection = value;
  }

  void addToSearchNameCollection(String value) {
    searchNameCollection.add(value);
  }

  void removeFromSearchNameCollection(String value) {
    searchNameCollection.remove(value);
  }

  void removeAtIndexFromSearchNameCollection(int index) {
    searchNameCollection.removeAt(index);
  }

  void updateSearchNameCollectionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchNameCollection[index] = updateFn(_searchNameCollection[index]);
  }

  void insertAtIndexInSearchNameCollection(int index, String value) {
    searchNameCollection.insert(index, value);
  }

  List<String> _serachLastNameCollection = [];
  List<String> get serachLastNameCollection => _serachLastNameCollection;
  set serachLastNameCollection(List<String> value) {
    _serachLastNameCollection = value;
  }

  void addToSerachLastNameCollection(String value) {
    serachLastNameCollection.add(value);
  }

  void removeFromSerachLastNameCollection(String value) {
    serachLastNameCollection.remove(value);
  }

  void removeAtIndexFromSerachLastNameCollection(int index) {
    serachLastNameCollection.removeAt(index);
  }

  void updateSerachLastNameCollectionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    serachLastNameCollection[index] =
        updateFn(_serachLastNameCollection[index]);
  }

  void insertAtIndexInSerachLastNameCollection(int index, String value) {
    serachLastNameCollection.insert(index, value);
  }

  List<dynamic> _jsonTest = [];
  List<dynamic> get jsonTest => _jsonTest;
  set jsonTest(List<dynamic> value) {
    _jsonTest = value;
  }

  void addToJsonTest(dynamic value) {
    jsonTest.add(value);
  }

  void removeFromJsonTest(dynamic value) {
    jsonTest.remove(value);
  }

  void removeAtIndexFromJsonTest(int index) {
    jsonTest.removeAt(index);
  }

  void updateJsonTestAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    jsonTest[index] = updateFn(_jsonTest[index]);
  }

  void insertAtIndexInJsonTest(int index, dynamic value) {
    jsonTest.insert(index, value);
  }

  int _collectionTab = 0;
  int get collectionTab => _collectionTab;
  set collectionTab(int value) {
    _collectionTab = value;
  }

  List<bool> _collectionListBoolean = [];
  List<bool> get collectionListBoolean => _collectionListBoolean;
  set collectionListBoolean(List<bool> value) {
    _collectionListBoolean = value;
  }

  void addToCollectionListBoolean(bool value) {
    collectionListBoolean.add(value);
  }

  void removeFromCollectionListBoolean(bool value) {
    collectionListBoolean.remove(value);
  }

  void removeAtIndexFromCollectionListBoolean(int index) {
    collectionListBoolean.removeAt(index);
  }

  void updateCollectionListBooleanAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    collectionListBoolean[index] = updateFn(_collectionListBoolean[index]);
  }

  void insertAtIndexInCollectionListBoolean(int index, bool value) {
    collectionListBoolean.insert(index, value);
  }

  bool _addCustomerQuotationSaveSuccess = false;
  bool get addCustomerQuotationSaveSuccess => _addCustomerQuotationSaveSuccess;
  set addCustomerQuotationSaveSuccess(bool value) {
    _addCustomerQuotationSaveSuccess = value;
  }

  List<bool> _selectCardList = [];
  List<bool> get selectCardList => _selectCardList;
  set selectCardList(List<bool> value) {
    _selectCardList = value;
  }

  void addToSelectCardList(bool value) {
    selectCardList.add(value);
  }

  void removeFromSelectCardList(bool value) {
    selectCardList.remove(value);
  }

  void removeAtIndexFromSelectCardList(int index) {
    selectCardList.removeAt(index);
  }

  void updateSelectCardListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    selectCardList[index] = updateFn(_selectCardList[index]);
  }

  void insertAtIndexInSelectCardList(int index, bool value) {
    selectCardList.insert(index, value);
  }

  SaveCallStruct _saveCalled = SaveCallStruct.fromSerializableMap(jsonDecode(
      '{\"CONTNO_ID\":\"[]\",\"CONTNO\":\"[]\",\"HISTORY_LEAD_STATUS\":\"[]\",\"HISTORY_REASON_NAME\":\"[]\",\"CREATED_USERID\":\"[]\",\"UPDATED_USERID\":\"[]\",\"ARAPPDATE\":\"[]\",\"ARDESC\":\"[]\",\"USERID\":\"[]\",\"REMGCODE\":\"[]\",\"REMDETCODE\":\"[]\",\"AMOUNT\":\"[]\"}'));
  SaveCallStruct get saveCalled => _saveCalled;
  set saveCalled(SaveCallStruct value) {
    _saveCalled = value;
  }

  void updateSaveCalledStruct(Function(SaveCallStruct) updateFn) {
    updateFn(_saveCalled);
  }

  List<String> _outPutRemgCode = [];
  List<String> get outPutRemgCode => _outPutRemgCode;
  set outPutRemgCode(List<String> value) {
    _outPutRemgCode = value;
  }

  void addToOutPutRemgCode(String value) {
    outPutRemgCode.add(value);
  }

  void removeFromOutPutRemgCode(String value) {
    outPutRemgCode.remove(value);
  }

  void removeAtIndexFromOutPutRemgCode(int index) {
    outPutRemgCode.removeAt(index);
  }

  void updateOutPutRemgCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    outPutRemgCode[index] = updateFn(_outPutRemgCode[index]);
  }

  void insertAtIndexInOutPutRemgCode(int index, String value) {
    outPutRemgCode.insert(index, value);
  }

  List<String> _outPutRemDetCode = [];
  List<String> get outPutRemDetCode => _outPutRemDetCode;
  set outPutRemDetCode(List<String> value) {
    _outPutRemDetCode = value;
  }

  void addToOutPutRemDetCode(String value) {
    outPutRemDetCode.add(value);
  }

  void removeFromOutPutRemDetCode(String value) {
    outPutRemDetCode.remove(value);
  }

  void removeAtIndexFromOutPutRemDetCode(int index) {
    outPutRemDetCode.removeAt(index);
  }

  void updateOutPutRemDetCodeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    outPutRemDetCode[index] = updateFn(_outPutRemDetCode[index]);
  }

  void insertAtIndexInOutPutRemDetCode(int index, String value) {
    outPutRemDetCode.insert(index, value);
  }

  List<String> _outPutRemDetDesc = [];
  List<String> get outPutRemDetDesc => _outPutRemDetDesc;
  set outPutRemDetDesc(List<String> value) {
    _outPutRemDetDesc = value;
  }

  void addToOutPutRemDetDesc(String value) {
    outPutRemDetDesc.add(value);
  }

  void removeFromOutPutRemDetDesc(String value) {
    outPutRemDetDesc.remove(value);
  }

  void removeAtIndexFromOutPutRemDetDesc(int index) {
    outPutRemDetDesc.removeAt(index);
  }

  void updateOutPutRemDetDescAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    outPutRemDetDesc[index] = updateFn(_outPutRemDetDesc[index]);
  }

  void insertAtIndexInOutPutRemDetDesc(int index, String value) {
    outPutRemDetDesc.insert(index, value);
  }

  List<String> _outputRemDesc = [];
  List<String> get outputRemDesc => _outputRemDesc;
  set outputRemDesc(List<String> value) {
    _outputRemDesc = value;
  }

  void addToOutputRemDesc(String value) {
    outputRemDesc.add(value);
  }

  void removeFromOutputRemDesc(String value) {
    outputRemDesc.remove(value);
  }

  void removeAtIndexFromOutputRemDesc(int index) {
    outputRemDesc.removeAt(index);
  }

  void updateOutputRemDescAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    outputRemDesc[index] = updateFn(_outputRemDesc[index]);
  }

  void insertAtIndexInOutputRemDesc(int index, String value) {
    outputRemDesc.insert(index, value);
  }

  String _outputRemarkCode = '';
  String get outputRemarkCode => _outputRemarkCode;
  set outputRemarkCode(String value) {
    _outputRemarkCode = value;
  }

  String _outputRemarkDesc = '';
  String get outputRemarkDesc => _outputRemarkDesc;
  set outputRemarkDesc(String value) {
    _outputRemarkDesc = value;
  }

  String _outputRemarkDetCode = '';
  String get outputRemarkDetCode => _outputRemarkDetCode;
  set outputRemarkDetCode(String value) {
    _outputRemarkDetCode = value;
  }

  String _outputRemarkDetDesc = '';
  String get outputRemarkDetDesc => _outputRemarkDetDesc;
  set outputRemarkDetDesc(String value) {
    _outputRemarkDetDesc = value;
  }

  List<String> _ppAmountList = [];
  List<String> get ppAmountList => _ppAmountList;
  set ppAmountList(List<String> value) {
    _ppAmountList = value;
  }

  void addToPpAmountList(String value) {
    ppAmountList.add(value);
  }

  void removeFromPpAmountList(String value) {
    ppAmountList.remove(value);
  }

  void removeAtIndexFromPpAmountList(int index) {
    ppAmountList.removeAt(index);
  }

  void updatePpAmountListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ppAmountList[index] = updateFn(_ppAmountList[index]);
  }

  void insertAtIndexInPpAmountList(int index, String value) {
    ppAmountList.insert(index, value);
  }

  int _loopCountNumber = 0;
  int get loopCountNumber => _loopCountNumber;
  set loopCountNumber(int value) {
    _loopCountNumber = value;
  }

  String _loopStatusTemp = 'normal';
  String get loopStatusTemp => _loopStatusTemp;
  set loopStatusTemp(String value) {
    _loopStatusTemp = value;
  }

  String _collectionSearchBy = '';
  String get collectionSearchBy => _collectionSearchBy;
  set collectionSearchBy(String value) {
    _collectionSearchBy = value;
  }

  String _collectionSearch = '';
  String get collectionSearch => _collectionSearch;
  set collectionSearch(String value) {
    _collectionSearch = value;
  }

  String _collectionSortBy = '';
  String get collectionSortBy => _collectionSortBy;
  set collectionSortBy(String value) {
    _collectionSortBy = value;
  }

  List<bool> _selectApproveList = [];
  List<bool> get selectApproveList => _selectApproveList;
  set selectApproveList(List<bool> value) {
    _selectApproveList = value;
  }

  void addToSelectApproveList(bool value) {
    selectApproveList.add(value);
  }

  void removeFromSelectApproveList(bool value) {
    selectApproveList.remove(value);
  }

  void removeAtIndexFromSelectApproveList(int index) {
    selectApproveList.removeAt(index);
  }

  void updateSelectApproveListAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    selectApproveList[index] = updateFn(_selectApproveList[index]);
  }

  void insertAtIndexInSelectApproveList(int index, bool value) {
    selectApproveList.insert(index, value);
  }

  bool _multiApprove = false;
  bool get multiApprove => _multiApprove;
  set multiApprove(bool value) {
    _multiApprove = value;
  }

  bool _isLoadedSearchCollection = false;
  bool get isLoadedSearchCollection => _isLoadedSearchCollection;
  set isLoadedSearchCollection(bool value) {
    _isLoadedSearchCollection = value;
  }

  String _searchMonthPP = '';
  String get searchMonthPP => _searchMonthPP;
  set searchMonthPP(String value) {
    _searchMonthPP = value;
  }

  String _profileRoleName = '';
  String get profileRoleName => _profileRoleName;
  set profileRoleName(String value) {
    _profileRoleName = value;
  }

  List<dynamic> _Name2Json = [];
  List<dynamic> get Name2Json => _Name2Json;
  set Name2Json(List<dynamic> value) {
    _Name2Json = value;
  }

  void addToName2Json(dynamic value) {
    Name2Json.add(value);
  }

  void removeFromName2Json(dynamic value) {
    Name2Json.remove(value);
  }

  void removeAtIndexFromName2Json(int index) {
    Name2Json.removeAt(index);
  }

  void updateName2JsonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    Name2Json[index] = updateFn(_Name2Json[index]);
  }

  void insertAtIndexInName2Json(int index, dynamic value) {
    Name2Json.insert(index, value);
  }

  List<dynamic> _Phone2Json = [];
  List<dynamic> get Phone2Json => _Phone2Json;
  set Phone2Json(List<dynamic> value) {
    _Phone2Json = value;
  }

  void addToPhone2Json(dynamic value) {
    Phone2Json.add(value);
  }

  void removeFromPhone2Json(dynamic value) {
    Phone2Json.remove(value);
  }

  void removeAtIndexFromPhone2Json(int index) {
    Phone2Json.removeAt(index);
  }

  void updatePhone2JsonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    Phone2Json[index] = updateFn(_Phone2Json[index]);
  }

  void insertAtIndexInPhone2Json(int index, dynamic value) {
    Phone2Json.insert(index, value);
  }

  List<dynamic> _amountRequestJson = [];
  List<dynamic> get amountRequestJson => _amountRequestJson;
  set amountRequestJson(List<dynamic> value) {
    _amountRequestJson = value;
  }

  void addToAmountRequestJson(dynamic value) {
    amountRequestJson.add(value);
  }

  void removeFromAmountRequestJson(dynamic value) {
    amountRequestJson.remove(value);
  }

  void removeAtIndexFromAmountRequestJson(int index) {
    amountRequestJson.removeAt(index);
  }

  void updateAmountRequestJsonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    amountRequestJson[index] = updateFn(_amountRequestJson[index]);
  }

  void insertAtIndexInAmountRequestJson(int index, dynamic value) {
    amountRequestJson.insert(index, value);
  }

  String _apiUrlBranchViewCollection = '';
  String get apiUrlBranchViewCollection => _apiUrlBranchViewCollection;
  set apiUrlBranchViewCollection(String value) {
    _apiUrlBranchViewCollection = value;
  }

  String _apiUrlVloanRemark = '';
  String get apiUrlVloanRemark => _apiUrlVloanRemark;
  set apiUrlVloanRemark(String value) {
    _apiUrlVloanRemark = value;
  }

  String _tokenVloanRemark = '';
  String get tokenVloanRemark => _tokenVloanRemark;
  set tokenVloanRemark(String value) {
    _tokenVloanRemark = value;
  }

  String _paidDateCollection = '';
  String get paidDateCollection => _paidDateCollection;
  set paidDateCollection(String value) {
    _paidDateCollection = value;
  }

  DocumentReference? _hideContentTableauDocRef =
      FirebaseFirestore.instance.doc('/hideInAppContent/mniu0BN4atQHImrNdyyg');
  DocumentReference? get hideContentTableauDocRef => _hideContentTableauDocRef;
  set hideContentTableauDocRef(DocumentReference? value) {
    _hideContentTableauDocRef = value;
  }

  bool _isOpenAndroidTableauBrowser = true;
  bool get isOpenAndroidTableauBrowser => _isOpenAndroidTableauBrowser;
  set isOpenAndroidTableauBrowser(bool value) {
    _isOpenAndroidTableauBrowser = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
