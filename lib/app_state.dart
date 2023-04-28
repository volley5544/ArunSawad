import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _accessToken =
        await secureStorage.getString('ff_accessToken') ?? _accessToken;
    _employeeID = await secureStorage.getString('ff_employeeID') ?? _employeeID;
    _apiURLLocalState = await secureStorage.getString('ff_apiURLLocalState') ??
        _apiURLLocalState;
    _branchCode = await secureStorage.getString('ff_branchCode') ?? _branchCode;
    _doNotShowAgain =
        await secureStorage.getBool('ff_doNotShowAgain') ?? _doNotShowAgain;
    _dateDoNotShowAgain =
        await secureStorage.read(key: 'ff_dateDoNotShowAgain') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (await secureStorage.getInt('ff_dateDoNotShowAgain'))!)
            : _dateDoNotShowAgain;
    _pinCodeAuthen =
        await secureStorage.getString('ff_pinCodeAuthen') ?? _pinCodeAuthen;
    _userLogRef =
        (await secureStorage.getString('ff_userLogRef'))?.ref ?? _userLogRef;
    _userRef = (await secureStorage.getString('ff_userRef'))?.ref ?? _userRef;
    _userNickname =
        await secureStorage.getString('ff_userNickname') ?? _userNickname;
    _leadIdCalledInApp =
        await secureStorage.getStringList('ff_leadIdCalledInApp') ??
            _leadIdCalledInApp;
    _firstUseApp =
        await secureStorage.getBool('ff_firstUseApp') ?? _firstUseApp;
    _DateHolidayNotShow =
        await secureStorage.read(key: 'ff_DateHolidayNotShow') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                (await secureStorage.getInt('ff_DateHolidayNotShow'))!)
            : _DateHolidayNotShow;
    _firstLogin = await secureStorage.getBool('ff_firstLogin') ?? _firstLogin;
    _brachListNew =
        await secureStorage.getStringList('ff_brachListNew') ?? _brachListNew;
    _brachLatNew =
        await secureStorage.getStringList('ff_brachLatNew') ?? _brachLatNew;
    _brachLngNew =
        await secureStorage.getStringList('ff_brachLngNew') ?? _brachLngNew;
    _BrachRadNew =
        await secureStorage.getStringList('ff_BrachRadNew') ?? _BrachRadNew;
    _brachGroupNew =
        await secureStorage.getString('ff_brachGroupNew') ?? _brachGroupNew;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _imei = '123456789012345';
  String get imei => _imei;
  set imei(String _value) {
    _imei = _value;
  }

  String _accessToken = 'access_token';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    secureStorage.setString('ff_accessToken', _value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  String _employeeID = 'employee_id';
  String get employeeID => _employeeID;
  set employeeID(String _value) {
    _employeeID = _value;
    secureStorage.setString('ff_employeeID', _value);
  }

  void deleteEmployeeID() {
    secureStorage.delete(key: 'ff_employeeID');
  }

  String _QRCodeLink = 'qrcode_link';
  String get QRCodeLink => _QRCodeLink;
  set QRCodeLink(String _value) {
    _QRCodeLink = _value;
  }

  String _apiURLLocalState = 'api_url_local_state';
  String get apiURLLocalState => _apiURLLocalState;
  set apiURLLocalState(String _value) {
    _apiURLLocalState = _value;
    secureStorage.setString('ff_apiURLLocalState', _value);
  }

  void deleteApiURLLocalState() {
    secureStorage.delete(key: 'ff_apiURLLocalState');
  }

  int _counterNum = 0;
  int get counterNum => _counterNum;
  set counterNum(int _value) {
    _counterNum = _value;
  }

  List<String> _imgURL = [];
  List<String> get imgURL => _imgURL;
  set imgURL(List<String> _value) {
    _imgURL = _value;
  }

  void addToImgURL(String _value) {
    _imgURL.add(_value);
  }

  void removeFromImgURL(String _value) {
    _imgURL.remove(_value);
  }

  void removeAtIndexFromImgURL(int _index) {
    _imgURL.removeAt(_index);
  }

  String _imgURLTemp =
      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
  String get imgURLTemp => _imgURLTemp;
  set imgURLTemp(String _value) {
    _imgURLTemp = _value;
  }

  List<String> _materialRecordId = [];
  List<String> get materialRecordId => _materialRecordId;
  set materialRecordId(List<String> _value) {
    _materialRecordId = _value;
  }

  void addToMaterialRecordId(String _value) {
    _materialRecordId.add(_value);
  }

  void removeFromMaterialRecordId(String _value) {
    _materialRecordId.remove(_value);
  }

  void removeAtIndexFromMaterialRecordId(int _index) {
    _materialRecordId.removeAt(_index);
  }

  List<int> _materialsAmount = [];
  List<int> get materialsAmount => _materialsAmount;
  set materialsAmount(List<int> _value) {
    _materialsAmount = _value;
  }

  void addToMaterialsAmount(int _value) {
    _materialsAmount.add(_value);
  }

  void removeFromMaterialsAmount(int _value) {
    _materialsAmount.remove(_value);
  }

  void removeAtIndexFromMaterialsAmount(int _index) {
    _materialsAmount.removeAt(_index);
  }

  bool _isFromTimesheetPage = false;
  bool get isFromTimesheetPage => _isFromTimesheetPage;
  set isFromTimesheetPage(bool _value) {
    _isFromTimesheetPage = _value;
  }

  String _branchCode = 'branch_code';
  String get branchCode => _branchCode;
  set branchCode(String _value) {
    _branchCode = _value;
    secureStorage.setString('ff_branchCode', _value);
  }

  void deleteBranchCode() {
    secureStorage.delete(key: 'ff_branchCode');
  }

  String _locationTemp = '';
  String get locationTemp => _locationTemp;
  set locationTemp(String _value) {
    _locationTemp = _value;
  }

  List<String> _materialNameList = [];
  List<String> get materialNameList => _materialNameList;
  set materialNameList(List<String> _value) {
    _materialNameList = _value;
  }

  void addToMaterialNameList(String _value) {
    _materialNameList.add(_value);
  }

  void removeFromMaterialNameList(String _value) {
    _materialNameList.remove(_value);
  }

  void removeAtIndexFromMaterialNameList(int _index) {
    _materialNameList.removeAt(_index);
  }

  List<String> _materialImgList = [];
  List<String> get materialImgList => _materialImgList;
  set materialImgList(List<String> _value) {
    _materialImgList = _value;
  }

  void addToMaterialImgList(String _value) {
    _materialImgList.add(_value);
  }

  void removeFromMaterialImgList(String _value) {
    _materialImgList.remove(_value);
  }

  void removeAtIndexFromMaterialImgList(int _index) {
    _materialImgList.removeAt(_index);
  }

  List<String> _vloanContNoListTemp = [];
  List<String> get vloanContNoListTemp => _vloanContNoListTemp;
  set vloanContNoListTemp(List<String> _value) {
    _vloanContNoListTemp = _value;
  }

  void addToVloanContNoListTemp(String _value) {
    _vloanContNoListTemp.add(_value);
  }

  void removeFromVloanContNoListTemp(String _value) {
    _vloanContNoListTemp.remove(_value);
  }

  void removeAtIndexFromVloanContNoListTemp(int _index) {
    _vloanContNoListTemp.removeAt(_index);
  }

  List<String> _vloanCustomerNameListTemp = [];
  List<String> get vloanCustomerNameListTemp => _vloanCustomerNameListTemp;
  set vloanCustomerNameListTemp(List<String> _value) {
    _vloanCustomerNameListTemp = _value;
  }

  void addToVloanCustomerNameListTemp(String _value) {
    _vloanCustomerNameListTemp.add(_value);
  }

  void removeFromVloanCustomerNameListTemp(String _value) {
    _vloanCustomerNameListTemp.remove(_value);
  }

  void removeAtIndexFromVloanCustomerNameListTemp(int _index) {
    _vloanCustomerNameListTemp.removeAt(_index);
  }

  bool _isGetVloanContract = false;
  bool get isGetVloanContract => _isGetVloanContract;
  set isGetVloanContract(bool _value) {
    _isGetVloanContract = _value;
  }

  List<String> _vloanServerListTemp = [];
  List<String> get vloanServerListTemp => _vloanServerListTemp;
  set vloanServerListTemp(List<String> _value) {
    _vloanServerListTemp = _value;
  }

  void addToVloanServerListTemp(String _value) {
    _vloanServerListTemp.add(_value);
  }

  void removeFromVloanServerListTemp(String _value) {
    _vloanServerListTemp.remove(_value);
  }

  void removeAtIndexFromVloanServerListTemp(int _index) {
    _vloanServerListTemp.removeAt(_index);
  }

  String _fcmToken = 'fcm_token';
  String get fcmToken => _fcmToken;
  set fcmToken(String _value) {
    _fcmToken = _value;
  }

  List<String> _leadID = [];
  List<String> get leadID => _leadID;
  set leadID(List<String> _value) {
    _leadID = _value;
  }

  void addToLeadID(String _value) {
    _leadID.add(_value);
  }

  void removeFromLeadID(String _value) {
    _leadID.remove(_value);
  }

  void removeAtIndexFromLeadID(int _index) {
    _leadID.removeAt(_index);
  }

  List<DateTime> _leadTimeRemainList = [];
  List<DateTime> get leadTimeRemainList => _leadTimeRemainList;
  set leadTimeRemainList(List<DateTime> _value) {
    _leadTimeRemainList = _value;
  }

  void addToLeadTimeRemainList(DateTime _value) {
    _leadTimeRemainList.add(_value);
  }

  void removeFromLeadTimeRemainList(DateTime _value) {
    _leadTimeRemainList.remove(_value);
  }

  void removeAtIndexFromLeadTimeRemainList(int _index) {
    _leadTimeRemainList.removeAt(_index);
  }

  List<String> _leadCustomerNameList = [];
  List<String> get leadCustomerNameList => _leadCustomerNameList;
  set leadCustomerNameList(List<String> _value) {
    _leadCustomerNameList = _value;
  }

  void addToLeadCustomerNameList(String _value) {
    _leadCustomerNameList.add(_value);
  }

  void removeFromLeadCustomerNameList(String _value) {
    _leadCustomerNameList.remove(_value);
  }

  void removeAtIndexFromLeadCustomerNameList(int _index) {
    _leadCustomerNameList.removeAt(_index);
  }

  String _coachURL = 'https://hris.srisawadpower.com/COACH';
  String get coachURL => _coachURL;
  set coachURL(String _value) {
    _coachURL = _value;
  }

  bool _isInApp = false;
  bool get isInApp => _isInApp;
  set isInApp(bool _value) {
    _isInApp = _value;
  }

  bool _inAppViaNotification = true;
  bool get inAppViaNotification => _inAppViaNotification;
  set inAppViaNotification(bool _value) {
    _inAppViaNotification = _value;
  }

  bool _doNotShowAgain = false;
  bool get doNotShowAgain => _doNotShowAgain;
  set doNotShowAgain(bool _value) {
    _doNotShowAgain = _value;
    secureStorage.setBool('ff_doNotShowAgain', _value);
  }

  void deleteDoNotShowAgain() {
    secureStorage.delete(key: 'ff_doNotShowAgain');
  }

  DateTime? _dateDoNotShowAgain;
  DateTime? get dateDoNotShowAgain => _dateDoNotShowAgain;
  set dateDoNotShowAgain(DateTime? _value) {
    _dateDoNotShowAgain = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_dateDoNotShowAgain', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_dateDoNotShowAgain');
  }

  void deleteDateDoNotShowAgain() {
    secureStorage.delete(key: 'ff_dateDoNotShowAgain');
  }

  bool _check = false;
  bool get check => _check;
  set check(bool _value) {
    _check = _value;
  }

  bool _opsMenuVisible = false;
  bool get opsMenuVisible => _opsMenuVisible;
  set opsMenuVisible(bool _value) {
    _opsMenuVisible = _value;
  }

  List<String> _bannerSuperAppImgList = [];
  List<String> get bannerSuperAppImgList => _bannerSuperAppImgList;
  set bannerSuperAppImgList(List<String> _value) {
    _bannerSuperAppImgList = _value;
  }

  void addToBannerSuperAppImgList(String _value) {
    _bannerSuperAppImgList.add(_value);
  }

  void removeFromBannerSuperAppImgList(String _value) {
    _bannerSuperAppImgList.remove(_value);
  }

  void removeAtIndexFromBannerSuperAppImgList(int _index) {
    _bannerSuperAppImgList.removeAt(_index);
  }

  int _diffDate = -99;
  int get diffDate => _diffDate;
  set diffDate(int _value) {
    _diffDate = _value;
  }

  bool _isFromAuthenPage = false;
  bool get isFromAuthenPage => _isFromAuthenPage;
  set isFromAuthenPage(bool _value) {
    _isFromAuthenPage = _value;
  }

  String _pinCodeAuthen = '013972';
  String get pinCodeAuthen => _pinCodeAuthen;
  set pinCodeAuthen(String _value) {
    _pinCodeAuthen = _value;
    secureStorage.setString('ff_pinCodeAuthen', _value);
  }

  void deletePinCodeAuthen() {
    secureStorage.delete(key: 'ff_pinCodeAuthen');
  }

  bool _isFromLoginPage = false;
  bool get isFromLoginPage => _isFromLoginPage;
  set isFromLoginPage(bool _value) {
    _isFromLoginPage = _value;
  }

  bool _isGotNoti = false;
  bool get isGotNoti => _isGotNoti;
  set isGotNoti(bool _value) {
    _isGotNoti = _value;
  }

  String _isGottNoti = '';
  String get isGottNoti => _isGottNoti;
  set isGottNoti(String _value) {
    _isGottNoti = _value;
  }

  List<String> _leadChannelPairColorList = [];
  List<String> get leadChannelPairColorList => _leadChannelPairColorList;
  set leadChannelPairColorList(List<String> _value) {
    _leadChannelPairColorList = _value;
  }

  void addToLeadChannelPairColorList(String _value) {
    _leadChannelPairColorList.add(_value);
  }

  void removeFromLeadChannelPairColorList(String _value) {
    _leadChannelPairColorList.remove(_value);
  }

  void removeAtIndexFromLeadChannelPairColorList(int _index) {
    _leadChannelPairColorList.removeAt(_index);
  }

  List<String> _leadChannelList = [];
  List<String> get leadChannelList => _leadChannelList;
  set leadChannelList(List<String> _value) {
    _leadChannelList = _value;
  }

  void addToLeadChannelList(String _value) {
    _leadChannelList.add(_value);
  }

  void removeFromLeadChannelList(String _value) {
    _leadChannelList.remove(_value);
  }

  void removeAtIndexFromLeadChannelList(int _index) {
    _leadChannelList.removeAt(_index);
  }

  List<String> _leadChannelColor = [];
  List<String> get leadChannelColor => _leadChannelColor;
  set leadChannelColor(List<String> _value) {
    _leadChannelColor = _value;
  }

  void addToLeadChannelColor(String _value) {
    _leadChannelColor.add(_value);
  }

  void removeFromLeadChannelColor(String _value) {
    _leadChannelColor.remove(_value);
  }

  void removeAtIndexFromLeadChannelColor(int _index) {
    _leadChannelColor.removeAt(_index);
  }

  bool _isFromSetPinPage = false;
  bool get isFromSetPinPage => _isFromSetPinPage;
  set isFromSetPinPage(bool _value) {
    _isFromSetPinPage = _value;
  }

  DocumentReference? _userLogRef =
      FirebaseFirestore.instance.doc('/user_log/[user_log]');
  DocumentReference? get userLogRef => _userLogRef;
  set userLogRef(DocumentReference? _value) {
    _userLogRef = _value;
    _value != null
        ? secureStorage.setString('ff_userLogRef', _value.path)
        : secureStorage.remove('ff_userLogRef');
  }

  void deleteUserLogRef() {
    secureStorage.delete(key: 'ff_userLogRef');
  }

  DocumentReference? _checkUserRef;
  DocumentReference? get checkUserRef => _checkUserRef;
  set checkUserRef(DocumentReference? _value) {
    _checkUserRef = _value;
  }

  String _temp1 = '';
  String get temp1 => _temp1;
  set temp1(String _value) {
    _temp1 = _value;
  }

  String _temp2 = '';
  String get temp2 => _temp2;
  set temp2(String _value) {
    _temp2 = _value;
  }

  DateTime? _temp3;
  DateTime? get temp3 => _temp3;
  set temp3(DateTime? _value) {
    _temp3 = _value;
  }

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? _value) {
    _userRef = _value;
    _value != null
        ? secureStorage.setString('ff_userRef', _value.path)
        : secureStorage.remove('ff_userRef');
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

  String _loginStateFirebase = '[loginStateFirebase]';
  String get loginStateFirebase => _loginStateFirebase;
  set loginStateFirebase(String _value) {
    _loginStateFirebase = _value;
  }

  List<String> _leadCreatedTimeList = [];
  List<String> get leadCreatedTimeList => _leadCreatedTimeList;
  set leadCreatedTimeList(List<String> _value) {
    _leadCreatedTimeList = _value;
  }

  void addToLeadCreatedTimeList(String _value) {
    _leadCreatedTimeList.add(_value);
  }

  void removeFromLeadCreatedTimeList(String _value) {
    _leadCreatedTimeList.remove(_value);
  }

  void removeAtIndexFromLeadCreatedTimeList(int _index) {
    _leadCreatedTimeList.removeAt(_index);
  }

  List<String> _leadCallStatus = [];
  List<String> get leadCallStatus => _leadCallStatus;
  set leadCallStatus(List<String> _value) {
    _leadCallStatus = _value;
  }

  void addToLeadCallStatus(String _value) {
    _leadCallStatus.add(_value);
  }

  void removeFromLeadCallStatus(String _value) {
    _leadCallStatus.remove(_value);
  }

  void removeAtIndexFromLeadCallStatus(int _index) {
    _leadCallStatus.removeAt(_index);
  }

  List<String> _leadPhoneNumberList = [];
  List<String> get leadPhoneNumberList => _leadPhoneNumberList;
  set leadPhoneNumberList(List<String> _value) {
    _leadPhoneNumberList = _value;
  }

  void addToLeadPhoneNumberList(String _value) {
    _leadPhoneNumberList.add(_value);
  }

  void removeFromLeadPhoneNumberList(String _value) {
    _leadPhoneNumberList.remove(_value);
  }

  void removeAtIndexFromLeadPhoneNumberList(int _index) {
    _leadPhoneNumberList.removeAt(_index);
  }

  List<String> _leadEmployeeID = [];
  List<String> get leadEmployeeID => _leadEmployeeID;
  set leadEmployeeID(List<String> _value) {
    _leadEmployeeID = _value;
  }

  void addToLeadEmployeeID(String _value) {
    _leadEmployeeID.add(_value);
  }

  void removeFromLeadEmployeeID(String _value) {
    _leadEmployeeID.remove(_value);
  }

  void removeAtIndexFromLeadEmployeeID(int _index) {
    _leadEmployeeID.removeAt(_index);
  }

  bool _isPassLoginSection = false;
  bool get isPassLoginSection => _isPassLoginSection;
  set isPassLoginSection(bool _value) {
    _isPassLoginSection = _value;
  }

  List<Color> _leadChannelLabelColor = [];
  List<Color> get leadChannelLabelColor => _leadChannelLabelColor;
  set leadChannelLabelColor(List<Color> _value) {
    _leadChannelLabelColor = _value;
  }

  void addToLeadChannelLabelColor(Color _value) {
    _leadChannelLabelColor.add(_value);
  }

  void removeFromLeadChannelLabelColor(Color _value) {
    _leadChannelLabelColor.remove(_value);
  }

  void removeAtIndexFromLeadChannelLabelColor(int _index) {
    _leadChannelLabelColor.removeAt(_index);
  }

  String _userNickname = '[user_nickname]';
  String get userNickname => _userNickname;
  set userNickname(String _value) {
    _userNickname = _value;
    secureStorage.setString('ff_userNickname', _value);
  }

  void deleteUserNickname() {
    secureStorage.delete(key: 'ff_userNickname');
  }

  List<String> _leadIdCalledInApp = [];
  List<String> get leadIdCalledInApp => _leadIdCalledInApp;
  set leadIdCalledInApp(List<String> _value) {
    _leadIdCalledInApp = _value;
    secureStorage.setStringList('ff_leadIdCalledInApp', _value);
  }

  void deleteLeadIdCalledInApp() {
    secureStorage.delete(key: 'ff_leadIdCalledInApp');
  }

  void addToLeadIdCalledInApp(String _value) {
    _leadIdCalledInApp.add(_value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeFromLeadIdCalledInApp(String _value) {
    _leadIdCalledInApp.remove(_value);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  void removeAtIndexFromLeadIdCalledInApp(int _index) {
    _leadIdCalledInApp.removeAt(_index);
    secureStorage.setStringList('ff_leadIdCalledInApp', _leadIdCalledInApp);
  }

  String _profileFullName = '[full_name]';
  String get profileFullName => _profileFullName;
  set profileFullName(String _value) {
    _profileFullName = _value;
  }

  String _profileBirthDate = '[birth_date]';
  String get profileBirthDate => _profileBirthDate;
  set profileBirthDate(String _value) {
    _profileBirthDate = _value;
  }

  String _profileUnitCodeName = '[unit_code_name]';
  String get profileUnitCodeName => _profileUnitCodeName;
  set profileUnitCodeName(String _value) {
    _profileUnitCodeName = _value;
  }

  String _profileParentUnit = '[parent_unit]';
  String get profileParentUnit => _profileParentUnit;
  set profileParentUnit(String _value) {
    _profileParentUnit = _value;
  }

  String _profileRegion = '[region]';
  String get profileRegion => _profileRegion;
  set profileRegion(String _value) {
    _profileRegion = _value;
  }

  String _profileHiredDate = '[hired_date]';
  String get profileHiredDate => _profileHiredDate;
  set profileHiredDate(String _value) {
    _profileHiredDate = _value;
  }

  String _profileServiceDuration = '[service_duration]';
  String get profileServiceDuration => _profileServiceDuration;
  set profileServiceDuration(String _value) {
    _profileServiceDuration = _value;
  }

  String _profilePositionAge = '[position_age]';
  String get profilePositionAge => _profilePositionAge;
  set profilePositionAge(String _value) {
    _profilePositionAge = _value;
  }

  String _profilePositionName = '[position_name]';
  String get profilePositionName => _profilePositionName;
  set profilePositionName(String _value) {
    _profilePositionName = _value;
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
  set dailySplashPageText(List<String> _value) {
    _dailySplashPageText = _value;
  }

  void addToDailySplashPageText(String _value) {
    _dailySplashPageText.add(_value);
  }

  void removeFromDailySplashPageText(String _value) {
    _dailySplashPageText.remove(_value);
  }

  void removeAtIndexFromDailySplashPageText(int _index) {
    _dailySplashPageText.removeAt(_index);
  }

  List<String> _leadBranchCode = [];
  List<String> get leadBranchCode => _leadBranchCode;
  set leadBranchCode(List<String> _value) {
    _leadBranchCode = _value;
  }

  void addToLeadBranchCode(String _value) {
    _leadBranchCode.add(_value);
  }

  void removeFromLeadBranchCode(String _value) {
    _leadBranchCode.remove(_value);
  }

  void removeAtIndexFromLeadBranchCode(int _index) {
    _leadBranchCode.removeAt(_index);
  }

  String _leadUserLevel = 'lead_user_level';
  String get leadUserLevel => _leadUserLevel;
  set leadUserLevel(String _value) {
    _leadUserLevel = _value;
  }

  List<int> _leadChannelAmountList = [0, 0, 0, 0];
  List<int> get leadChannelAmountList => _leadChannelAmountList;
  set leadChannelAmountList(List<int> _value) {
    _leadChannelAmountList = _value;
  }

  void addToLeadChannelAmountList(int _value) {
    _leadChannelAmountList.add(_value);
  }

  void removeFromLeadChannelAmountList(int _value) {
    _leadChannelAmountList.remove(_value);
  }

  void removeAtIndexFromLeadChannelAmountList(int _index) {
    _leadChannelAmountList.removeAt(_index);
  }

  String _leadChannelSelected = 'All';
  String get leadChannelSelected => _leadChannelSelected;
  set leadChannelSelected(String _value) {
    _leadChannelSelected = _value;
  }

  String _dailyText = 'daily_text';
  String get dailyText => _dailyText;
  set dailyText(String _value) {
    _dailyText = _value;
  }

  bool _firstUseApp = false;
  bool get firstUseApp => _firstUseApp;
  set firstUseApp(bool _value) {
    _firstUseApp = _value;
    secureStorage.setBool('ff_firstUseApp', _value);
  }

  void deleteFirstUseApp() {
    secureStorage.delete(key: 'ff_firstUseApp');
  }

  int _introPageIndex = 1;
  int get introPageIndex => _introPageIndex;
  set introPageIndex(int _value) {
    _introPageIndex = _value;
  }

  LatLng? _HOLocation = LatLng(13.888767, 100.575308);
  LatLng? get HOLocation => _HOLocation;
  set HOLocation(LatLng? _value) {
    _HOLocation = _value;
  }

  List<String> _adminEmployeeID = ['31622', '23328', '30427', '33511'];
  List<String> get adminEmployeeID => _adminEmployeeID;
  set adminEmployeeID(List<String> _value) {
    _adminEmployeeID = _value;
  }

  void addToAdminEmployeeID(String _value) {
    _adminEmployeeID.add(_value);
  }

  void removeFromAdminEmployeeID(String _value) {
    _adminEmployeeID.remove(_value);
  }

  void removeAtIndexFromAdminEmployeeID(int _index) {
    _adminEmployeeID.removeAt(_index);
  }

  String _profilePositionAgeCheck = '[position_age_check]';
  String get profilePositionAgeCheck => _profilePositionAgeCheck;
  set profilePositionAgeCheck(String _value) {
    _profilePositionAgeCheck = _value;
  }

  DateTime? _dcvdf;
  DateTime? get dcvdf => _dcvdf;
  set dcvdf(DateTime? _value) {
    _dcvdf = _value;
  }

  List<DocumentReference> _unreadNotiListRef = [];
  List<DocumentReference> get unreadNotiListRef => _unreadNotiListRef;
  set unreadNotiListRef(List<DocumentReference> _value) {
    _unreadNotiListRef = _value;
  }

  void addToUnreadNotiListRef(DocumentReference _value) {
    _unreadNotiListRef.add(_value);
  }

  void removeFromUnreadNotiListRef(DocumentReference _value) {
    _unreadNotiListRef.remove(_value);
  }

  void removeAtIndexFromUnreadNotiListRef(int _index) {
    _unreadNotiListRef.removeAt(_index);
  }

  String _firebaseUserUID = '';
  String get firebaseUserUID => _firebaseUserUID;
  set firebaseUserUID(String _value) {
    _firebaseUserUID = _value;
  }

  int _RatingNumber = 0;
  int get RatingNumber => _RatingNumber;
  set RatingNumber(int _value) {
    _RatingNumber = _value;
  }

  List<String> _branchList = [' '];
  List<String> get branchList => _branchList;
  set branchList(List<String> _value) {
    _branchList = _value;
  }

  void addToBranchList(String _value) {
    _branchList.add(_value);
  }

  void removeFromBranchList(String _value) {
    _branchList.remove(_value);
  }

  void removeAtIndexFromBranchList(int _index) {
    _branchList.removeAt(_index);
  }

  String _branchGroup = 'ทั่วไป';
  String get branchGroup => _branchGroup;
  set branchGroup(String _value) {
    _branchGroup = _value;
  }

  List<String> _branchLat = ['Hello World'];
  List<String> get branchLat => _branchLat;
  set branchLat(List<String> _value) {
    _branchLat = _value;
  }

  void addToBranchLat(String _value) {
    _branchLat.add(_value);
  }

  void removeFromBranchLat(String _value) {
    _branchLat.remove(_value);
  }

  void removeAtIndexFromBranchLat(int _index) {
    _branchLat.removeAt(_index);
  }

  List<String> _branchLng = ['99'];
  List<String> get branchLng => _branchLng;
  set branchLng(List<String> _value) {
    _branchLng = _value;
  }

  void addToBranchLng(String _value) {
    _branchLng.add(_value);
  }

  void removeFromBranchLng(String _value) {
    _branchLng.remove(_value);
  }

  void removeAtIndexFromBranchLng(int _index) {
    _branchLng.removeAt(_index);
  }

  List<String> _branchRad = ['98'];
  List<String> get branchRad => _branchRad;
  set branchRad(List<String> _value) {
    _branchRad = _value;
  }

  void addToBranchRad(String _value) {
    _branchRad.add(_value);
  }

  void removeFromBranchRad(String _value) {
    _branchRad.remove(_value);
  }

  void removeAtIndexFromBranchRad(int _index) {
    _branchRad.removeAt(_index);
  }

  LatLng? _branchLo;
  LatLng? get branchLo => _branchLo;
  set branchLo(LatLng? _value) {
    _branchLo = _value;
  }

  String _currentTime = '';
  String get currentTime => _currentTime;
  set currentTime(String _value) {
    _currentTime = _value;
  }

  String _currentDate = '';
  String get currentDate => _currentDate;
  set currentDate(String _value) {
    _currentDate = _value;
  }

  double _currentRadius = 0;
  double get currentRadius => _currentRadius;
  set currentRadius(double _value) {
    _currentRadius = _value;
  }

  String _flag = '';
  String get flag => _flag;
  set flag(String _value) {
    _flag = _value;
  }

  String _branchLoString = '';
  String get branchLoString => _branchLoString;
  set branchLoString(String _value) {
    _branchLoString = _value;
  }

  List<String> _checkinStatusBranch = [];
  List<String> get checkinStatusBranch => _checkinStatusBranch;
  set checkinStatusBranch(List<String> _value) {
    _checkinStatusBranch = _value;
  }

  void addToCheckinStatusBranch(String _value) {
    _checkinStatusBranch.add(_value);
  }

  void removeFromCheckinStatusBranch(String _value) {
    _checkinStatusBranch.remove(_value);
  }

  void removeAtIndexFromCheckinStatusBranch(int _index) {
    _checkinStatusBranch.removeAt(_index);
  }

  List<String> _checkinStatusDate = [];
  List<String> get checkinStatusDate => _checkinStatusDate;
  set checkinStatusDate(List<String> _value) {
    _checkinStatusDate = _value;
  }

  void addToCheckinStatusDate(String _value) {
    _checkinStatusDate.add(_value);
  }

  void removeFromCheckinStatusDate(String _value) {
    _checkinStatusDate.remove(_value);
  }

  void removeAtIndexFromCheckinStatusDate(int _index) {
    _checkinStatusDate.removeAt(_index);
  }

  List<String> _checkinStatusTime = [];
  List<String> get checkinStatusTime => _checkinStatusTime;
  set checkinStatusTime(List<String> _value) {
    _checkinStatusTime = _value;
  }

  void addToCheckinStatusTime(String _value) {
    _checkinStatusTime.add(_value);
  }

  void removeFromCheckinStatusTime(String _value) {
    _checkinStatusTime.remove(_value);
  }

  void removeAtIndexFromCheckinStatusTime(int _index) {
    _checkinStatusTime.removeAt(_index);
  }

  List<String> _checkinStatusAction = [];
  List<String> get checkinStatusAction => _checkinStatusAction;
  set checkinStatusAction(List<String> _value) {
    _checkinStatusAction = _value;
  }

  void addToCheckinStatusAction(String _value) {
    _checkinStatusAction.add(_value);
  }

  void removeFromCheckinStatusAction(String _value) {
    _checkinStatusAction.remove(_value);
  }

  void removeAtIndexFromCheckinStatusAction(int _index) {
    _checkinStatusAction.removeAt(_index);
  }

  List<String> _checkinStatusTimeIn = [];
  List<String> get checkinStatusTimeIn => _checkinStatusTimeIn;
  set checkinStatusTimeIn(List<String> _value) {
    _checkinStatusTimeIn = _value;
  }

  void addToCheckinStatusTimeIn(String _value) {
    _checkinStatusTimeIn.add(_value);
  }

  void removeFromCheckinStatusTimeIn(String _value) {
    _checkinStatusTimeIn.remove(_value);
  }

  void removeAtIndexFromCheckinStatusTimeIn(int _index) {
    _checkinStatusTimeIn.removeAt(_index);
  }

  List<String> _checkinStatusTimeOut = [];
  List<String> get checkinStatusTimeOut => _checkinStatusTimeOut;
  set checkinStatusTimeOut(List<String> _value) {
    _checkinStatusTimeOut = _value;
  }

  void addToCheckinStatusTimeOut(String _value) {
    _checkinStatusTimeOut.add(_value);
  }

  void removeFromCheckinStatusTimeOut(String _value) {
    _checkinStatusTimeOut.remove(_value);
  }

  void removeAtIndexFromCheckinStatusTimeOut(int _index) {
    _checkinStatusTimeOut.removeAt(_index);
  }

  List<String> _checkinStatusDateFlag = [];
  List<String> get checkinStatusDateFlag => _checkinStatusDateFlag;
  set checkinStatusDateFlag(List<String> _value) {
    _checkinStatusDateFlag = _value;
  }

  void addToCheckinStatusDateFlag(String _value) {
    _checkinStatusDateFlag.add(_value);
  }

  void removeFromCheckinStatusDateFlag(String _value) {
    _checkinStatusDateFlag.remove(_value);
  }

  void removeAtIndexFromCheckinStatusDateFlag(int _index) {
    _checkinStatusDateFlag.removeAt(_index);
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
  set checkinStatusColor(List<Color> _value) {
    _checkinStatusColor = _value;
  }

  void addToCheckinStatusColor(Color _value) {
    _checkinStatusColor.add(_value);
  }

  void removeFromCheckinStatusColor(Color _value) {
    _checkinStatusColor.remove(_value);
  }

  void removeAtIndexFromCheckinStatusColor(int _index) {
    _checkinStatusColor.removeAt(_index);
  }

  List<String> _teleBrandName = [];
  List<String> get teleBrandName => _teleBrandName;
  set teleBrandName(List<String> _value) {
    _teleBrandName = _value;
  }

  void addToTeleBrandName(String _value) {
    _teleBrandName.add(_value);
  }

  void removeFromTeleBrandName(String _value) {
    _teleBrandName.remove(_value);
  }

  void removeAtIndexFromTeleBrandName(int _index) {
    _teleBrandName.removeAt(_index);
  }

  List<String> _teleBrandType = [];
  List<String> get teleBrandType => _teleBrandType;
  set teleBrandType(List<String> _value) {
    _teleBrandType = _value;
  }

  void addToTeleBrandType(String _value) {
    _teleBrandType.add(_value);
  }

  void removeFromTeleBrandType(String _value) {
    _teleBrandType.remove(_value);
  }

  void removeAtIndexFromTeleBrandType(int _index) {
    _teleBrandType.removeAt(_index);
  }

  List<String> _modelName = [];
  List<String> get modelName => _modelName;
  set modelName(List<String> _value) {
    _modelName = _value;
  }

  void addToModelName(String _value) {
    _modelName.add(_value);
  }

  void removeFromModelName(String _value) {
    _modelName.remove(_value);
  }

  void removeAtIndexFromModelName(int _index) {
    _modelName.removeAt(_index);
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
    '2565'
  ];
  List<String> get teleYearDropdownOption => _teleYearDropdownOption;
  set teleYearDropdownOption(List<String> _value) {
    _teleYearDropdownOption = _value;
  }

  void addToTeleYearDropdownOption(String _value) {
    _teleYearDropdownOption.add(_value);
  }

  void removeFromTeleYearDropdownOption(String _value) {
    _teleYearDropdownOption.remove(_value);
  }

  void removeAtIndexFromTeleYearDropdownOption(int _index) {
    _teleYearDropdownOption.removeAt(_index);
  }

  List<String> _teleGetProvince = [];
  List<String> get teleGetProvince => _teleGetProvince;
  set teleGetProvince(List<String> _value) {
    _teleGetProvince = _value;
  }

  void addToTeleGetProvince(String _value) {
    _teleGetProvince.add(_value);
  }

  void removeFromTeleGetProvince(String _value) {
    _teleGetProvince.remove(_value);
  }

  void removeAtIndexFromTeleGetProvince(int _index) {
    _teleGetProvince.removeAt(_index);
  }

  List<String> _teleModelName = [];
  List<String> get teleModelName => _teleModelName;
  set teleModelName(List<String> _value) {
    _teleModelName = _value;
  }

  void addToTeleModelName(String _value) {
    _teleModelName.add(_value);
  }

  void removeFromTeleModelName(String _value) {
    _teleModelName.remove(_value);
  }

  void removeAtIndexFromTeleModelName(int _index) {
    _teleModelName.removeAt(_index);
  }

  List<String> _coverTypeName = [];
  List<String> get coverTypeName => _coverTypeName;
  set coverTypeName(List<String> _value) {
    _coverTypeName = _value;
  }

  void addToCoverTypeName(String _value) {
    _coverTypeName.add(_value);
  }

  void removeFromCoverTypeName(String _value) {
    _coverTypeName.remove(_value);
  }

  void removeAtIndexFromCoverTypeName(int _index) {
    _coverTypeName.removeAt(_index);
  }

  List<String> _coverTypeCode = [];
  List<String> get coverTypeCode => _coverTypeCode;
  set coverTypeCode(List<String> _value) {
    _coverTypeCode = _value;
  }

  void addToCoverTypeCode(String _value) {
    _coverTypeCode.add(_value);
  }

  void removeFromCoverTypeCode(String _value) {
    _coverTypeCode.remove(_value);
  }

  void removeAtIndexFromCoverTypeCode(int _index) {
    _coverTypeCode.removeAt(_index);
  }

  List<String> _insurerFullNameList = [];
  List<String> get insurerFullNameList => _insurerFullNameList;
  set insurerFullNameList(List<String> _value) {
    _insurerFullNameList = _value;
  }

  void addToInsurerFullNameList(String _value) {
    _insurerFullNameList.add(_value);
  }

  void removeFromInsurerFullNameList(String _value) {
    _insurerFullNameList.remove(_value);
  }

  void removeAtIndexFromInsurerFullNameList(int _index) {
    _insurerFullNameList.removeAt(_index);
  }

  String _garageTypeEng = '';
  String get garageTypeEng => _garageTypeEng;
  set garageTypeEng(String _value) {
    _garageTypeEng = _value;
  }

  List<String> _coverTypeNameChosen = [];
  List<String> get coverTypeNameChosen => _coverTypeNameChosen;
  set coverTypeNameChosen(List<String> _value) {
    _coverTypeNameChosen = _value;
  }

  void addToCoverTypeNameChosen(String _value) {
    _coverTypeNameChosen.add(_value);
  }

  void removeFromCoverTypeNameChosen(String _value) {
    _coverTypeNameChosen.remove(_value);
  }

  void removeAtIndexFromCoverTypeNameChosen(int _index) {
    _coverTypeNameChosen.removeAt(_index);
  }

  List<String> _insurerNameChosen = [];
  List<String> get insurerNameChosen => _insurerNameChosen;
  set insurerNameChosen(List<String> _value) {
    _insurerNameChosen = _value;
  }

  void addToInsurerNameChosen(String _value) {
    _insurerNameChosen.add(_value);
  }

  void removeFromInsurerNameChosen(String _value) {
    _insurerNameChosen.remove(_value);
  }

  void removeAtIndexFromInsurerNameChosen(int _index) {
    _insurerNameChosen.removeAt(_index);
  }

  int _sumInsuredChosen = 0;
  int get sumInsuredChosen => _sumInsuredChosen;
  set sumInsuredChosen(int _value) {
    _sumInsuredChosen = _value;
  }

  List<String> _teleBrandID = [];
  List<String> get teleBrandID => _teleBrandID;
  set teleBrandID(List<String> _value) {
    _teleBrandID = _value;
  }

  void addToTeleBrandID(String _value) {
    _teleBrandID.add(_value);
  }

  void removeFromTeleBrandID(String _value) {
    _teleBrandID.remove(_value);
  }

  void removeAtIndexFromTeleBrandID(int _index) {
    _teleBrandID.removeAt(_index);
  }

  List<String> _teleModelCode = [];
  List<String> get teleModelCode => _teleModelCode;
  set teleModelCode(List<String> _value) {
    _teleModelCode = _value;
  }

  void addToTeleModelCode(String _value) {
    _teleModelCode.add(_value);
  }

  void removeFromTeleModelCode(String _value) {
    _teleModelCode.remove(_value);
  }

  void removeAtIndexFromTeleModelCode(int _index) {
    _teleModelCode.removeAt(_index);
  }

  List<String> _teleModelBrandID = [];
  List<String> get teleModelBrandID => _teleModelBrandID;
  set teleModelBrandID(List<String> _value) {
    _teleModelBrandID = _value;
  }

  void addToTeleModelBrandID(String _value) {
    _teleModelBrandID.add(_value);
  }

  void removeFromTeleModelBrandID(String _value) {
    _teleModelBrandID.remove(_value);
  }

  void removeAtIndexFromTeleModelBrandID(int _index) {
    _teleModelBrandID.removeAt(_index);
  }

  List<String> _companyId = [];
  List<String> get companyId => _companyId;
  set companyId(List<String> _value) {
    _companyId = _value;
  }

  void addToCompanyId(String _value) {
    _companyId.add(_value);
  }

  void removeFromCompanyId(String _value) {
    _companyId.remove(_value);
  }

  void removeAtIndexFromCompanyId(int _index) {
    _companyId.removeAt(_index);
  }

  bool _teleSearchModelState = false;
  bool get teleSearchModelState => _teleSearchModelState;
  set teleSearchModelState(bool _value) {
    _teleSearchModelState = _value;
  }

  List<String> _searchFullName = [];
  List<String> get searchFullName => _searchFullName;
  set searchFullName(List<String> _value) {
    _searchFullName = _value;
  }

  void addToSearchFullName(String _value) {
    _searchFullName.add(_value);
  }

  void removeFromSearchFullName(String _value) {
    _searchFullName.remove(_value);
  }

  void removeAtIndexFromSearchFullName(int _index) {
    _searchFullName.removeAt(_index);
  }

  List<String> _searchCoverType = [];
  List<String> get searchCoverType => _searchCoverType;
  set searchCoverType(List<String> _value) {
    _searchCoverType = _value;
  }

  void addToSearchCoverType(String _value) {
    _searchCoverType.add(_value);
  }

  void removeFromSearchCoverType(String _value) {
    _searchCoverType.remove(_value);
  }

  void removeAtIndexFromSearchCoverType(int _index) {
    _searchCoverType.removeAt(_index);
  }

  List<String> _searchGarageType = [];
  List<String> get searchGarageType => _searchGarageType;
  set searchGarageType(List<String> _value) {
    _searchGarageType = _value;
  }

  void addToSearchGarageType(String _value) {
    _searchGarageType.add(_value);
  }

  void removeFromSearchGarageType(String _value) {
    _searchGarageType.remove(_value);
  }

  void removeAtIndexFromSearchGarageType(int _index) {
    _searchGarageType.removeAt(_index);
  }

  List<String> _searchGrossTotal = [];
  List<String> get searchGrossTotal => _searchGrossTotal;
  set searchGrossTotal(List<String> _value) {
    _searchGrossTotal = _value;
  }

  void addToSearchGrossTotal(String _value) {
    _searchGrossTotal.add(_value);
  }

  void removeFromSearchGrossTotal(String _value) {
    _searchGrossTotal.remove(_value);
  }

  void removeAtIndexFromSearchGrossTotal(int _index) {
    _searchGrossTotal.removeAt(_index);
  }

  List<String> _searchSumInsured = [];
  List<String> get searchSumInsured => _searchSumInsured;
  set searchSumInsured(List<String> _value) {
    _searchSumInsured = _value;
  }

  void addToSearchSumInsured(String _value) {
    _searchSumInsured.add(_value);
  }

  void removeFromSearchSumInsured(String _value) {
    _searchSumInsured.remove(_value);
  }

  void removeAtIndexFromSearchSumInsured(int _index) {
    _searchSumInsured.removeAt(_index);
  }

  List<String> _searchTppd = [];
  List<String> get searchTppd => _searchTppd;
  set searchTppd(List<String> _value) {
    _searchTppd = _value;
  }

  void addToSearchTppd(String _value) {
    _searchTppd.add(_value);
  }

  void removeFromSearchTppd(String _value) {
    _searchTppd.remove(_value);
  }

  void removeAtIndexFromSearchTppd(int _index) {
    _searchTppd.removeAt(_index);
  }

  List<String> _searchPa = [];
  List<String> get searchPa => _searchPa;
  set searchPa(List<String> _value) {
    _searchPa = _value;
  }

  void addToSearchPa(String _value) {
    _searchPa.add(_value);
  }

  void removeFromSearchPa(String _value) {
    _searchPa.remove(_value);
  }

  void removeAtIndexFromSearchPa(int _index) {
    _searchPa.removeAt(_index);
  }

  List<String> _searchExpDate = [];
  List<String> get searchExpDate => _searchExpDate;
  set searchExpDate(List<String> _value) {
    _searchExpDate = _value;
  }

  void addToSearchExpDate(String _value) {
    _searchExpDate.add(_value);
  }

  void removeFromSearchExpDate(String _value) {
    _searchExpDate.remove(_value);
  }

  void removeAtIndexFromSearchExpDate(int _index) {
    _searchExpDate.removeAt(_index);
  }

  String _garageChosen = '';
  String get garageChosen => _garageChosen;
  set garageChosen(String _value) {
    _garageChosen = _value;
  }

  List<String> _actAmount = [];
  List<String> get actAmount => _actAmount;
  set actAmount(List<String> _value) {
    _actAmount = _value;
  }

  void addToActAmount(String _value) {
    _actAmount.add(_value);
  }

  void removeFromActAmount(String _value) {
    _actAmount.remove(_value);
  }

  void removeAtIndexFromActAmount(int _index) {
    _actAmount.removeAt(_index);
  }

  List<String> _searchActAmount = [];
  List<String> get searchActAmount => _searchActAmount;
  set searchActAmount(List<String> _value) {
    _searchActAmount = _value;
  }

  void addToSearchActAmount(String _value) {
    _searchActAmount.add(_value);
  }

  void removeFromSearchActAmount(String _value) {
    _searchActAmount.remove(_value);
  }

  void removeAtIndexFromSearchActAmount(int _index) {
    _searchActAmount.removeAt(_index);
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
    '2022'
  ];
  List<String> get teleADYearDropdown => _teleADYearDropdown;
  set teleADYearDropdown(List<String> _value) {
    _teleADYearDropdown = _value;
  }

  void addToTeleADYearDropdown(String _value) {
    _teleADYearDropdown.add(_value);
  }

  void removeFromTeleADYearDropdown(String _value) {
    _teleADYearDropdown.remove(_value);
  }

  void removeAtIndexFromTeleADYearDropdown(int _index) {
    _teleADYearDropdown.removeAt(_index);
  }

  List<String> _searchSerialName = [];
  List<String> get searchSerialName => _searchSerialName;
  set searchSerialName(List<String> _value) {
    _searchSerialName = _value;
  }

  void addToSearchSerialName(String _value) {
    _searchSerialName.add(_value);
  }

  void removeFromSearchSerialName(String _value) {
    _searchSerialName.remove(_value);
  }

  void removeAtIndexFromSearchSerialName(int _index) {
    _searchSerialName.removeAt(_index);
  }

  double _sumInsuredChoosenDouble = 0;
  double get sumInsuredChoosenDouble => _sumInsuredChoosenDouble;
  set sumInsuredChoosenDouble(double _value) {
    _sumInsuredChoosenDouble = _value;
  }

  List<String> _kpiProductType = ['M', 'CTV', 'HL'];
  List<String> get kpiProductType => _kpiProductType;
  set kpiProductType(List<String> _value) {
    _kpiProductType = _value;
  }

  void addToKpiProductType(String _value) {
    _kpiProductType.add(_value);
  }

  void removeFromKpiProductType(String _value) {
    _kpiProductType.remove(_value);
  }

  void removeAtIndexFromKpiProductType(int _index) {
    _kpiProductType.removeAt(_index);
  }

  List<String> _kpiEmployeePosition = [
    '[position]',
    '[position]',
    '[position]'
  ];
  List<String> get kpiEmployeePosition => _kpiEmployeePosition;
  set kpiEmployeePosition(List<String> _value) {
    _kpiEmployeePosition = _value;
  }

  void addToKpiEmployeePosition(String _value) {
    _kpiEmployeePosition.add(_value);
  }

  void removeFromKpiEmployeePosition(String _value) {
    _kpiEmployeePosition.remove(_value);
  }

  void removeAtIndexFromKpiEmployeePosition(int _index) {
    _kpiEmployeePosition.removeAt(_index);
  }

  List<String> _kpiActual = ['0.0', '0.0', '0.0'];
  List<String> get kpiActual => _kpiActual;
  set kpiActual(List<String> _value) {
    _kpiActual = _value;
  }

  void addToKpiActual(String _value) {
    _kpiActual.add(_value);
  }

  void removeFromKpiActual(String _value) {
    _kpiActual.remove(_value);
  }

  void removeAtIndexFromKpiActual(int _index) {
    _kpiActual.removeAt(_index);
  }

  List<String> _kpiTargetQuantity = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantity => _kpiTargetQuantity;
  set kpiTargetQuantity(List<String> _value) {
    _kpiTargetQuantity = _value;
  }

  void addToKpiTargetQuantity(String _value) {
    _kpiTargetQuantity.add(_value);
  }

  void removeFromKpiTargetQuantity(String _value) {
    _kpiTargetQuantity.remove(_value);
  }

  void removeAtIndexFromKpiTargetQuantity(int _index) {
    _kpiTargetQuantity.removeAt(_index);
  }

  List<String> _kpiYearMonth = ['2022-12', '2022-12', '2022-12'];
  List<String> get kpiYearMonth => _kpiYearMonth;
  set kpiYearMonth(List<String> _value) {
    _kpiYearMonth = _value;
  }

  void addToKpiYearMonth(String _value) {
    _kpiYearMonth.add(_value);
  }

  void removeFromKpiYearMonth(String _value) {
    _kpiYearMonth.remove(_value);
  }

  void removeAtIndexFromKpiYearMonth(int _index) {
    _kpiYearMonth.removeAt(_index);
  }

  String _kpiTargetBudget = '100.00';
  String get kpiTargetBudget => _kpiTargetBudget;
  set kpiTargetBudget(String _value) {
    _kpiTargetBudget = _value;
  }

  String _kpiActualBudget = '0.00';
  String get kpiActualBudget => _kpiActualBudget;
  set kpiActualBudget(String _value) {
    _kpiActualBudget = _value;
  }

  DateTime? _DateHoliday;
  DateTime? get DateHoliday => _DateHoliday;
  set DateHoliday(DateTime? _value) {
    _DateHoliday = _value;
  }

  DateTime? _DateExpHoliday;
  DateTime? get DateExpHoliday => _DateExpHoliday;
  set DateExpHoliday(DateTime? _value) {
    _DateExpHoliday = _value;
  }

  DateTime? _DateHolidayNotShow;
  DateTime? get DateHolidayNotShow => _DateHolidayNotShow;
  set DateHolidayNotShow(DateTime? _value) {
    _DateHolidayNotShow = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_DateHolidayNotShow', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_DateHolidayNotShow');
  }

  void deleteDateHolidayNotShow() {
    secureStorage.delete(key: 'ff_DateHolidayNotShow');
  }

  bool _isLoadedInsuranceData = false;
  bool get isLoadedInsuranceData => _isLoadedInsuranceData;
  set isLoadedInsuranceData(bool _value) {
    _isLoadedInsuranceData = _value;
  }

  List<String> _leaveWorkId = [];
  List<String> get leaveWorkId => _leaveWorkId;
  set leaveWorkId(List<String> _value) {
    _leaveWorkId = _value;
  }

  void addToLeaveWorkId(String _value) {
    _leaveWorkId.add(_value);
  }

  void removeFromLeaveWorkId(String _value) {
    _leaveWorkId.remove(_value);
  }

  void removeAtIndexFromLeaveWorkId(int _index) {
    _leaveWorkId.removeAt(_index);
  }

  List<String> _leaveWorkDay = [];
  List<String> get leaveWorkDay => _leaveWorkDay;
  set leaveWorkDay(List<String> _value) {
    _leaveWorkDay = _value;
  }

  void addToLeaveWorkDay(String _value) {
    _leaveWorkDay.add(_value);
  }

  void removeFromLeaveWorkDay(String _value) {
    _leaveWorkDay.remove(_value);
  }

  void removeAtIndexFromLeaveWorkDay(int _index) {
    _leaveWorkDay.removeAt(_index);
  }

  List<String> _checkinLastMonthDate = [];
  List<String> get checkinLastMonthDate => _checkinLastMonthDate;
  set checkinLastMonthDate(List<String> _value) {
    _checkinLastMonthDate = _value;
  }

  void addToCheckinLastMonthDate(String _value) {
    _checkinLastMonthDate.add(_value);
  }

  void removeFromCheckinLastMonthDate(String _value) {
    _checkinLastMonthDate.remove(_value);
  }

  void removeAtIndexFromCheckinLastMonthDate(int _index) {
    _checkinLastMonthDate.removeAt(_index);
  }

  List<String> _checkinLastMonthTimeIn = [];
  List<String> get checkinLastMonthTimeIn => _checkinLastMonthTimeIn;
  set checkinLastMonthTimeIn(List<String> _value) {
    _checkinLastMonthTimeIn = _value;
  }

  void addToCheckinLastMonthTimeIn(String _value) {
    _checkinLastMonthTimeIn.add(_value);
  }

  void removeFromCheckinLastMonthTimeIn(String _value) {
    _checkinLastMonthTimeIn.remove(_value);
  }

  void removeAtIndexFromCheckinLastMonthTimeIn(int _index) {
    _checkinLastMonthTimeIn.removeAt(_index);
  }

  List<String> _checkinLastMonthTimeOut = [];
  List<String> get checkinLastMonthTimeOut => _checkinLastMonthTimeOut;
  set checkinLastMonthTimeOut(List<String> _value) {
    _checkinLastMonthTimeOut = _value;
  }

  void addToCheckinLastMonthTimeOut(String _value) {
    _checkinLastMonthTimeOut.add(_value);
  }

  void removeFromCheckinLastMonthTimeOut(String _value) {
    _checkinLastMonthTimeOut.remove(_value);
  }

  void removeAtIndexFromCheckinLastMonthTimeOut(int _index) {
    _checkinLastMonthTimeOut.removeAt(_index);
  }

  String _endLeaveDayString = '';
  String get endLeaveDayString => _endLeaveDayString;
  set endLeaveDayString(String _value) {
    _endLeaveDayString = _value;
  }

  List<String> _leaveTypeName = [];
  List<String> get leaveTypeName => _leaveTypeName;
  set leaveTypeName(List<String> _value) {
    _leaveTypeName = _value;
  }

  void addToLeaveTypeName(String _value) {
    _leaveTypeName.add(_value);
  }

  void removeFromLeaveTypeName(String _value) {
    _leaveTypeName.remove(_value);
  }

  void removeAtIndexFromLeaveTypeName(int _index) {
    _leaveTypeName.removeAt(_index);
  }

  String _areaResponsKPI = '[area_curent_month]';
  String get areaResponsKPI => _areaResponsKPI;
  set areaResponsKPI(String _value) {
    _areaResponsKPI = _value;
  }

  List<Color> _kpiGaugeColorListMain = [
    Color(4280103167),
    Color(4294960896),
    Color(4287299839)
  ];
  List<Color> get kpiGaugeColorListMain => _kpiGaugeColorListMain;
  set kpiGaugeColorListMain(List<Color> _value) {
    _kpiGaugeColorListMain = _value;
  }

  void addToKpiGaugeColorListMain(Color _value) {
    _kpiGaugeColorListMain.add(_value);
  }

  void removeFromKpiGaugeColorListMain(Color _value) {
    _kpiGaugeColorListMain.remove(_value);
  }

  void removeAtIndexFromKpiGaugeColorListMain(int _index) {
    _kpiGaugeColorListMain.removeAt(_index);
  }

  List<Color> _kpiGaugeColorList2 = [
    Color(4278254079),
    Color(4294927616),
    Color(4294793471)
  ];
  List<Color> get kpiGaugeColorList2 => _kpiGaugeColorList2;
  set kpiGaugeColorList2(List<Color> _value) {
    _kpiGaugeColorList2 = _value;
  }

  void addToKpiGaugeColorList2(Color _value) {
    _kpiGaugeColorList2.add(_value);
  }

  void removeFromKpiGaugeColorList2(Color _value) {
    _kpiGaugeColorList2.remove(_value);
  }

  void removeAtIndexFromKpiGaugeColorList2(int _index) {
    _kpiGaugeColorList2.removeAt(_index);
  }

  bool _checkAllowLeaveDay = false;
  bool get checkAllowLeaveDay => _checkAllowLeaveDay;
  set checkAllowLeaveDay(bool _value) {
    _checkAllowLeaveDay = _value;
  }

  List<String> _kpiProductTypeLM = ['M', 'CTV', 'HL'];
  List<String> get kpiProductTypeLM => _kpiProductTypeLM;
  set kpiProductTypeLM(List<String> _value) {
    _kpiProductTypeLM = _value;
  }

  void addToKpiProductTypeLM(String _value) {
    _kpiProductTypeLM.add(_value);
  }

  void removeFromKpiProductTypeLM(String _value) {
    _kpiProductTypeLM.remove(_value);
  }

  void removeAtIndexFromKpiProductTypeLM(int _index) {
    _kpiProductTypeLM.removeAt(_index);
  }

  List<String> _kpiEmployeePositionLM = ['position', 'position', 'position'];
  List<String> get kpiEmployeePositionLM => _kpiEmployeePositionLM;
  set kpiEmployeePositionLM(List<String> _value) {
    _kpiEmployeePositionLM = _value;
  }

  void addToKpiEmployeePositionLM(String _value) {
    _kpiEmployeePositionLM.add(_value);
  }

  void removeFromKpiEmployeePositionLM(String _value) {
    _kpiEmployeePositionLM.remove(_value);
  }

  void removeAtIndexFromKpiEmployeePositionLM(int _index) {
    _kpiEmployeePositionLM.removeAt(_index);
  }

  List<String> _kpiActualLM = ['0.0', '0.0', '0.0'];
  List<String> get kpiActualLM => _kpiActualLM;
  set kpiActualLM(List<String> _value) {
    _kpiActualLM = _value;
  }

  void addToKpiActualLM(String _value) {
    _kpiActualLM.add(_value);
  }

  void removeFromKpiActualLM(String _value) {
    _kpiActualLM.remove(_value);
  }

  void removeAtIndexFromKpiActualLM(int _index) {
    _kpiActualLM.removeAt(_index);
  }

  List<String> _kpiTargetQuantityLM = ['1.0', '1.0', '1.0'];
  List<String> get kpiTargetQuantityLM => _kpiTargetQuantityLM;
  set kpiTargetQuantityLM(List<String> _value) {
    _kpiTargetQuantityLM = _value;
  }

  void addToKpiTargetQuantityLM(String _value) {
    _kpiTargetQuantityLM.add(_value);
  }

  void removeFromKpiTargetQuantityLM(String _value) {
    _kpiTargetQuantityLM.remove(_value);
  }

  void removeAtIndexFromKpiTargetQuantityLM(int _index) {
    _kpiTargetQuantityLM.removeAt(_index);
  }

  List<String> _kpiYearMonthLM = ['2022-11', '2022-11', '2022-11'];
  List<String> get kpiYearMonthLM => _kpiYearMonthLM;
  set kpiYearMonthLM(List<String> _value) {
    _kpiYearMonthLM = _value;
  }

  void addToKpiYearMonthLM(String _value) {
    _kpiYearMonthLM.add(_value);
  }

  void removeFromKpiYearMonthLM(String _value) {
    _kpiYearMonthLM.remove(_value);
  }

  void removeAtIndexFromKpiYearMonthLM(int _index) {
    _kpiYearMonthLM.removeAt(_index);
  }

  String _kpiTargetBudgetLM = '100.00';
  String get kpiTargetBudgetLM => _kpiTargetBudgetLM;
  set kpiTargetBudgetLM(String _value) {
    _kpiTargetBudgetLM = _value;
  }

  String _kpiActualBudgetLM = '0.00';
  String get kpiActualBudgetLM => _kpiActualBudgetLM;
  set kpiActualBudgetLM(String _value) {
    _kpiActualBudgetLM = _value;
  }

  List<String> _countLeave = [];
  List<String> get countLeave => _countLeave;
  set countLeave(List<String> _value) {
    _countLeave = _value;
  }

  void addToCountLeave(String _value) {
    _countLeave.add(_value);
  }

  void removeFromCountLeave(String _value) {
    _countLeave.remove(_value);
  }

  void removeAtIndexFromCountLeave(int _index) {
    _countLeave.removeAt(_index);
  }

  List<String> _totalLeave = [];
  List<String> get totalLeave => _totalLeave;
  set totalLeave(List<String> _value) {
    _totalLeave = _value;
  }

  void addToTotalLeave(String _value) {
    _totalLeave.add(_value);
  }

  void removeFromTotalLeave(String _value) {
    _totalLeave.remove(_value);
  }

  void removeAtIndexFromTotalLeave(int _index) {
    _totalLeave.removeAt(_index);
  }

  List<String> _statusCheckCount = [];
  List<String> get statusCheckCount => _statusCheckCount;
  set statusCheckCount(List<String> _value) {
    _statusCheckCount = _value;
  }

  void addToStatusCheckCount(String _value) {
    _statusCheckCount.add(_value);
  }

  void removeFromStatusCheckCount(String _value) {
    _statusCheckCount.remove(_value);
  }

  void removeAtIndexFromStatusCheckCount(int _index) {
    _statusCheckCount.removeAt(_index);
  }

  String _kpiAreaResponsLM = '[area_last_month]';
  String get kpiAreaResponsLM => _kpiAreaResponsLM;
  set kpiAreaResponsLM(String _value) {
    _kpiAreaResponsLM = _value;
  }

  bool _allowFileUpload = false;
  bool get allowFileUpload => _allowFileUpload;
  set allowFileUpload(bool _value) {
    _allowFileUpload = _value;
  }

  String _leaveDaysLocal = '0.5';
  String get leaveDaysLocal => _leaveDaysLocal;
  set leaveDaysLocal(String _value) {
    _leaveDaysLocal = _value;
  }

  double _leaveDaysDouble = 0.5;
  double get leaveDaysDouble => _leaveDaysDouble;
  set leaveDaysDouble(double _value) {
    _leaveDaysDouble = _value;
  }

  String _leaveListID = 'leave_list_id';
  String get leaveListID => _leaveListID;
  set leaveListID(String _value) {
    _leaveListID = _value;
  }

  String _ProfilePhoneNumber = '';
  String get ProfilePhoneNumber => _ProfilePhoneNumber;
  set ProfilePhoneNumber(String _value) {
    _ProfilePhoneNumber = _value;
  }

  String _profileFirstBossEmpID = '';
  String get profileFirstBossEmpID => _profileFirstBossEmpID;
  set profileFirstBossEmpID(String _value) {
    _profileFirstBossEmpID = _value;
  }

  String _profileSecondBossEmpID = '';
  String get profileSecondBossEmpID => _profileSecondBossEmpID;
  set profileSecondBossEmpID(String _value) {
    _profileSecondBossEmpID = _value;
  }

  List<String> _leaveDocImgPathList = [];
  List<String> get leaveDocImgPathList => _leaveDocImgPathList;
  set leaveDocImgPathList(List<String> _value) {
    _leaveDocImgPathList = _value;
  }

  void addToLeaveDocImgPathList(String _value) {
    _leaveDocImgPathList.add(_value);
  }

  void removeFromLeaveDocImgPathList(String _value) {
    _leaveDocImgPathList.remove(_value);
  }

  void removeAtIndexFromLeaveDocImgPathList(int _index) {
    _leaveDocImgPathList.removeAt(_index);
  }

  String _positionApprove = '1';
  String get positionApprove => _positionApprove;
  set positionApprove(String _value) {
    _positionApprove = _value;
  }

  List<String> _disapproveName = [];
  List<String> get disapproveName => _disapproveName;
  set disapproveName(List<String> _value) {
    _disapproveName = _value;
  }

  void addToDisapproveName(String _value) {
    _disapproveName.add(_value);
  }

  void removeFromDisapproveName(String _value) {
    _disapproveName.remove(_value);
  }

  void removeAtIndexFromDisapproveName(int _index) {
    _disapproveName.removeAt(_index);
  }

  List<String> _disapproveLeaveName = [];
  List<String> get disapproveLeaveName => _disapproveLeaveName;
  set disapproveLeaveName(List<String> _value) {
    _disapproveLeaveName = _value;
  }

  void addToDisapproveLeaveName(String _value) {
    _disapproveLeaveName.add(_value);
  }

  void removeFromDisapproveLeaveName(String _value) {
    _disapproveLeaveName.remove(_value);
  }

  void removeAtIndexFromDisapproveLeaveName(int _index) {
    _disapproveLeaveName.removeAt(_index);
  }

  List<String> _disapproveCreatedDate = [];
  List<String> get disapproveCreatedDate => _disapproveCreatedDate;
  set disapproveCreatedDate(List<String> _value) {
    _disapproveCreatedDate = _value;
  }

  void addToDisapproveCreatedDate(String _value) {
    _disapproveCreatedDate.add(_value);
  }

  void removeFromDisapproveCreatedDate(String _value) {
    _disapproveCreatedDate.remove(_value);
  }

  void removeAtIndexFromDisapproveCreatedDate(int _index) {
    _disapproveCreatedDate.removeAt(_index);
  }

  List<String> _disapproveLeaveDate = [];
  List<String> get disapproveLeaveDate => _disapproveLeaveDate;
  set disapproveLeaveDate(List<String> _value) {
    _disapproveLeaveDate = _value;
  }

  void addToDisapproveLeaveDate(String _value) {
    _disapproveLeaveDate.add(_value);
  }

  void removeFromDisapproveLeaveDate(String _value) {
    _disapproveLeaveDate.remove(_value);
  }

  void removeAtIndexFromDisapproveLeaveDate(int _index) {
    _disapproveLeaveDate.removeAt(_index);
  }

  List<String> _disapproveCountDay = [];
  List<String> get disapproveCountDay => _disapproveCountDay;
  set disapproveCountDay(List<String> _value) {
    _disapproveCountDay = _value;
  }

  void addToDisapproveCountDay(String _value) {
    _disapproveCountDay.add(_value);
  }

  void removeFromDisapproveCountDay(String _value) {
    _disapproveCountDay.remove(_value);
  }

  void removeAtIndexFromDisapproveCountDay(int _index) {
    _disapproveCountDay.removeAt(_index);
  }

  List<String> _disapproveTimePeriod = [];
  List<String> get disapproveTimePeriod => _disapproveTimePeriod;
  set disapproveTimePeriod(List<String> _value) {
    _disapproveTimePeriod = _value;
  }

  void addToDisapproveTimePeriod(String _value) {
    _disapproveTimePeriod.add(_value);
  }

  void removeFromDisapproveTimePeriod(String _value) {
    _disapproveTimePeriod.remove(_value);
  }

  void removeAtIndexFromDisapproveTimePeriod(int _index) {
    _disapproveTimePeriod.removeAt(_index);
  }

  List<String> _disapproveReason = [];
  List<String> get disapproveReason => _disapproveReason;
  set disapproveReason(List<String> _value) {
    _disapproveReason = _value;
  }

  void addToDisapproveReason(String _value) {
    _disapproveReason.add(_value);
  }

  void removeFromDisapproveReason(String _value) {
    _disapproveReason.remove(_value);
  }

  void removeAtIndexFromDisapproveReason(int _index) {
    _disapproveReason.removeAt(_index);
  }

  List<String> _provName = ['ProvName'];
  List<String> get provName => _provName;
  set provName(List<String> _value) {
    _provName = _value;
  }

  void addToProvName(String _value) {
    _provName.add(_value);
  }

  void removeFromProvName(String _value) {
    _provName.remove(_value);
  }

  void removeAtIndexFromProvName(int _index) {
    _provName.removeAt(_index);
  }

  List<String> _provCode = ['ProvCode'];
  List<String> get provCode => _provCode;
  set provCode(List<String> _value) {
    _provCode = _value;
  }

  void addToProvCode(String _value) {
    _provCode.add(_value);
  }

  void removeFromProvCode(String _value) {
    _provCode.remove(_value);
  }

  void removeAtIndexFromProvCode(int _index) {
    _provCode.removeAt(_index);
  }

  List<String> _districtName = ['districtName'];
  List<String> get districtName => _districtName;
  set districtName(List<String> _value) {
    _districtName = _value;
  }

  void addToDistrictName(String _value) {
    _districtName.add(_value);
  }

  void removeFromDistrictName(String _value) {
    _districtName.remove(_value);
  }

  void removeAtIndexFromDistrictName(int _index) {
    _districtName.removeAt(_index);
  }

  List<String> _districtCode = ['districtCode'];
  List<String> get districtCode => _districtCode;
  set districtCode(List<String> _value) {
    _districtCode = _value;
  }

  void addToDistrictCode(String _value) {
    _districtCode.add(_value);
  }

  void removeFromDistrictCode(String _value) {
    _districtCode.remove(_value);
  }

  void removeAtIndexFromDistrictCode(int _index) {
    _districtCode.removeAt(_index);
  }

  List<String> _postCode = ['PostCode'];
  List<String> get postCode => _postCode;
  set postCode(List<String> _value) {
    _postCode = _value;
  }

  void addToPostCode(String _value) {
    _postCode.add(_value);
  }

  void removeFromPostCode(String _value) {
    _postCode.remove(_value);
  }

  void removeAtIndexFromPostCode(int _index) {
    _postCode.removeAt(_index);
  }

  List<String> _subDistrictName = ['subDistrictName'];
  List<String> get subDistrictName => _subDistrictName;
  set subDistrictName(List<String> _value) {
    _subDistrictName = _value;
  }

  void addToSubDistrictName(String _value) {
    _subDistrictName.add(_value);
  }

  void removeFromSubDistrictName(String _value) {
    _subDistrictName.remove(_value);
  }

  void removeAtIndexFromSubDistrictName(int _index) {
    _subDistrictName.removeAt(_index);
  }

  int _leaveDayInt = 0;
  int get leaveDayInt => _leaveDayInt;
  set leaveDayInt(int _value) {
    _leaveDayInt = _value;
  }

  List<String> _leaveTypeEdit = [];
  List<String> get leaveTypeEdit => _leaveTypeEdit;
  set leaveTypeEdit(List<String> _value) {
    _leaveTypeEdit = _value;
  }

  void addToLeaveTypeEdit(String _value) {
    _leaveTypeEdit.add(_value);
  }

  void removeFromLeaveTypeEdit(String _value) {
    _leaveTypeEdit.remove(_value);
  }

  void removeAtIndexFromLeaveTypeEdit(int _index) {
    _leaveTypeEdit.removeAt(_index);
  }

  List<String> _leaveHalfDay = [
    'ลาเต็มวัน',
    'ลาครึ่งวันเช้า',
    'ลาครึ่งวันบ่าย'
  ];
  List<String> get leaveHalfDay => _leaveHalfDay;
  set leaveHalfDay(List<String> _value) {
    _leaveHalfDay = _value;
  }

  void addToLeaveHalfDay(String _value) {
    _leaveHalfDay.add(_value);
  }

  void removeFromLeaveHalfDay(String _value) {
    _leaveHalfDay.remove(_value);
  }

  void removeAtIndexFromLeaveHalfDay(int _index) {
    _leaveHalfDay.removeAt(_index);
  }

  List<String> _leaveFullDay = ['ลาเต็มวัน'];
  List<String> get leaveFullDay => _leaveFullDay;
  set leaveFullDay(List<String> _value) {
    _leaveFullDay = _value;
  }

  void addToLeaveFullDay(String _value) {
    _leaveFullDay.add(_value);
  }

  void removeFromLeaveFullDay(String _value) {
    _leaveFullDay.remove(_value);
  }

  void removeAtIndexFromLeaveFullDay(int _index) {
    _leaveFullDay.removeAt(_index);
  }

  bool _leaveReasonEtcVisible = false;
  bool get leaveReasonEtcVisible => _leaveReasonEtcVisible;
  set leaveReasonEtcVisible(bool _value) {
    _leaveReasonEtcVisible = _value;
  }

  bool _companyAssetReturnEtcVisible = false;
  bool get companyAssetReturnEtcVisible => _companyAssetReturnEtcVisible;
  set companyAssetReturnEtcVisible(bool _value) {
    _companyAssetReturnEtcVisible = _value;
  }

  List<String> _reasonToLeaveList = [];
  List<String> get reasonToLeaveList => _reasonToLeaveList;
  set reasonToLeaveList(List<String> _value) {
    _reasonToLeaveList = _value;
  }

  void addToReasonToLeaveList(String _value) {
    _reasonToLeaveList.add(_value);
  }

  void removeFromReasonToLeaveList(String _value) {
    _reasonToLeaveList.remove(_value);
  }

  void removeAtIndexFromReasonToLeaveList(int _index) {
    _reasonToLeaveList.removeAt(_index);
  }

  List<String> _assetReturnList = [];
  List<String> get assetReturnList => _assetReturnList;
  set assetReturnList(List<String> _value) {
    _assetReturnList = _value;
  }

  void addToAssetReturnList(String _value) {
    _assetReturnList.add(_value);
  }

  void removeFromAssetReturnList(String _value) {
    _assetReturnList.remove(_value);
  }

  void removeAtIndexFromAssetReturnList(int _index) {
    _assetReturnList.removeAt(_index);
  }

  List<String> _insurancePlan1 = [];
  List<String> get insurancePlan1 => _insurancePlan1;
  set insurancePlan1(List<String> _value) {
    _insurancePlan1 = _value;
  }

  void addToInsurancePlan1(String _value) {
    _insurancePlan1.add(_value);
  }

  void removeFromInsurancePlan1(String _value) {
    _insurancePlan1.remove(_value);
  }

  void removeAtIndexFromInsurancePlan1(int _index) {
    _insurancePlan1.removeAt(_index);
  }

  String _insurancePlanNumber = '';
  String get insurancePlanNumber => _insurancePlanNumber;
  set insurancePlanNumber(String _value) {
    _insurancePlanNumber = _value;
  }

  String _profileLevel = '';
  String get profileLevel => _profileLevel;
  set profileLevel(String _value) {
    _profileLevel = _value;
  }

  String _profileBranch = '';
  String get profileBranch => _profileBranch;
  set profileBranch(String _value) {
    _profileBranch = _value;
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
  set welfareKpiStatusTextColorList(List<Color> _value) {
    _welfareKpiStatusTextColorList = _value;
  }

  void addToWelfareKpiStatusTextColorList(Color _value) {
    _welfareKpiStatusTextColorList.add(_value);
  }

  void removeFromWelfareKpiStatusTextColorList(Color _value) {
    _welfareKpiStatusTextColorList.remove(_value);
  }

  void removeAtIndexFromWelfareKpiStatusTextColorList(int _index) {
    _welfareKpiStatusTextColorList.removeAt(_index);
  }

  bool _isProduction = true;
  bool get isProduction => _isProduction;
  set isProduction(bool _value) {
    _isProduction = _value;
  }

  bool _isSelectedBranch = false;
  bool get isSelectedBranch => _isSelectedBranch;
  set isSelectedBranch(bool _value) {
    _isSelectedBranch = _value;
  }

  bool _isSearchedBranch = false;
  bool get isSearchedBranch => _isSearchedBranch;
  set isSearchedBranch(bool _value) {
    _isSearchedBranch = _value;
  }

  bool _isEmployeeSearched = false;
  bool get isEmployeeSearched => _isEmployeeSearched;
  set isEmployeeSearched(bool _value) {
    _isEmployeeSearched = _value;
  }

  bool _isEmployeeSelected = false;
  bool get isEmployeeSelected => _isEmployeeSelected;
  set isEmployeeSelected(bool _value) {
    _isEmployeeSelected = _value;
  }

  List<int> _welfareCEOStatusList = [5544, 5544];
  List<int> get welfareCEOStatusList => _welfareCEOStatusList;
  set welfareCEOStatusList(List<int> _value) {
    _welfareCEOStatusList = _value;
  }

  void addToWelfareCEOStatusList(int _value) {
    _welfareCEOStatusList.add(_value);
  }

  void removeFromWelfareCEOStatusList(int _value) {
    _welfareCEOStatusList.remove(_value);
  }

  void removeAtIndexFromWelfareCEOStatusList(int _index) {
    _welfareCEOStatusList.removeAt(_index);
  }

  List<String> _leadCountCalled = [];
  List<String> get leadCountCalled => _leadCountCalled;
  set leadCountCalled(List<String> _value) {
    _leadCountCalled = _value;
  }

  void addToLeadCountCalled(String _value) {
    _leadCountCalled.add(_value);
  }

  void removeFromLeadCountCalled(String _value) {
    _leadCountCalled.remove(_value);
  }

  void removeAtIndexFromLeadCountCalled(int _index) {
    _leadCountCalled.removeAt(_index);
  }

  double _branchLatDouble = 0;
  double get branchLatDouble => _branchLatDouble;
  set branchLatDouble(double _value) {
    _branchLatDouble = _value;
  }

  double _branchLngDouble = 0;
  double get branchLngDouble => _branchLngDouble;
  set branchLngDouble(double _value) {
    _branchLngDouble = _value;
  }

  double _currentLatDouble = 0.0;
  double get currentLatDouble => _currentLatDouble;
  set currentLatDouble(double _value) {
    _currentLatDouble = _value;
  }

  double _currentLngDouble = 0.0;
  double get currentLngDouble => _currentLngDouble;
  set currentLngDouble(double _value) {
    _currentLngDouble = _value;
  }

  List<String> _leadName2 = [];
  List<String> get leadName2 => _leadName2;
  set leadName2(List<String> _value) {
    _leadName2 = _value;
  }

  void addToLeadName2(String _value) {
    _leadName2.add(_value);
  }

  void removeFromLeadName2(String _value) {
    _leadName2.remove(_value);
  }

  void removeAtIndexFromLeadName2(int _index) {
    _leadName2.removeAt(_index);
  }

  List<String> _leadLastname2 = [];
  List<String> get leadLastname2 => _leadLastname2;
  set leadLastname2(List<String> _value) {
    _leadLastname2 = _value;
  }

  void addToLeadLastname2(String _value) {
    _leadLastname2.add(_value);
  }

  void removeFromLeadLastname2(String _value) {
    _leadLastname2.remove(_value);
  }

  void removeAtIndexFromLeadLastname2(int _index) {
    _leadLastname2.removeAt(_index);
  }

  List<String> _leadPhone2 = [];
  List<String> get leadPhone2 => _leadPhone2;
  set leadPhone2(List<String> _value) {
    _leadPhone2 = _value;
  }

  void addToLeadPhone2(String _value) {
    _leadPhone2.add(_value);
  }

  void removeFromLeadPhone2(String _value) {
    _leadPhone2.remove(_value);
  }

  void removeAtIndexFromLeadPhone2(int _index) {
    _leadPhone2.removeAt(_index);
  }

  List<int> _totalSumPoint = [];
  List<int> get totalSumPoint => _totalSumPoint;
  set totalSumPoint(List<int> _value) {
    _totalSumPoint = _value;
  }

  void addToTotalSumPoint(int _value) {
    _totalSumPoint.add(_value);
  }

  void removeFromTotalSumPoint(int _value) {
    _totalSumPoint.remove(_value);
  }

  void removeAtIndexFromTotalSumPoint(int _index) {
    _totalSumPoint.removeAt(_index);
  }

  List<String> _leadCarVehicleName = [];
  List<String> get leadCarVehicleName => _leadCarVehicleName;
  set leadCarVehicleName(List<String> _value) {
    _leadCarVehicleName = _value;
  }

  void addToLeadCarVehicleName(String _value) {
    _leadCarVehicleName.add(_value);
  }

  void removeFromLeadCarVehicleName(String _value) {
    _leadCarVehicleName.remove(_value);
  }

  void removeAtIndexFromLeadCarVehicleName(int _index) {
    _leadCarVehicleName.removeAt(_index);
  }

  List<String> _leadAmountRequest = [];
  List<String> get leadAmountRequest => _leadAmountRequest;
  set leadAmountRequest(List<String> _value) {
    _leadAmountRequest = _value;
  }

  void addToLeadAmountRequest(String _value) {
    _leadAmountRequest.add(_value);
  }

  void removeFromLeadAmountRequest(String _value) {
    _leadAmountRequest.remove(_value);
  }

  void removeAtIndexFromLeadAmountRequest(int _index) {
    _leadAmountRequest.removeAt(_index);
  }

  String _changeBranchCode = '';
  String get changeBranchCode => _changeBranchCode;
  set changeBranchCode(String _value) {
    _changeBranchCode = _value;
  }

  String _changeLat = '';
  String get changeLat => _changeLat;
  set changeLat(String _value) {
    _changeLat = _value;
  }

  String _changeLng = '';
  String get changeLng => _changeLng;
  set changeLng(String _value) {
    _changeLng = _value;
  }

  DateTime? _tpbDate;
  DateTime? get tpbDate => _tpbDate;
  set tpbDate(DateTime? _value) {
    _tpbDate = _value;
  }

  bool _firstLogin = false;
  bool get firstLogin => _firstLogin;
  set firstLogin(bool _value) {
    _firstLogin = _value;
    secureStorage.setBool('ff_firstLogin', _value);
  }

  void deleteFirstLogin() {
    secureStorage.delete(key: 'ff_firstLogin');
  }

  List<String> _brachListNew = [];
  List<String> get brachListNew => _brachListNew;
  set brachListNew(List<String> _value) {
    _brachListNew = _value;
    secureStorage.setStringList('ff_brachListNew', _value);
  }

  void deleteBrachListNew() {
    secureStorage.delete(key: 'ff_brachListNew');
  }

  void addToBrachListNew(String _value) {
    _brachListNew.add(_value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeFromBrachListNew(String _value) {
    _brachListNew.remove(_value);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  void removeAtIndexFromBrachListNew(int _index) {
    _brachListNew.removeAt(_index);
    secureStorage.setStringList('ff_brachListNew', _brachListNew);
  }

  List<String> _brachLatNew = [];
  List<String> get brachLatNew => _brachLatNew;
  set brachLatNew(List<String> _value) {
    _brachLatNew = _value;
    secureStorage.setStringList('ff_brachLatNew', _value);
  }

  void deleteBrachLatNew() {
    secureStorage.delete(key: 'ff_brachLatNew');
  }

  void addToBrachLatNew(String _value) {
    _brachLatNew.add(_value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeFromBrachLatNew(String _value) {
    _brachLatNew.remove(_value);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  void removeAtIndexFromBrachLatNew(int _index) {
    _brachLatNew.removeAt(_index);
    secureStorage.setStringList('ff_brachLatNew', _brachLatNew);
  }

  List<String> _brachLngNew = [];
  List<String> get brachLngNew => _brachLngNew;
  set brachLngNew(List<String> _value) {
    _brachLngNew = _value;
    secureStorage.setStringList('ff_brachLngNew', _value);
  }

  void deleteBrachLngNew() {
    secureStorage.delete(key: 'ff_brachLngNew');
  }

  void addToBrachLngNew(String _value) {
    _brachLngNew.add(_value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeFromBrachLngNew(String _value) {
    _brachLngNew.remove(_value);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  void removeAtIndexFromBrachLngNew(int _index) {
    _brachLngNew.removeAt(_index);
    secureStorage.setStringList('ff_brachLngNew', _brachLngNew);
  }

  List<String> _BrachRadNew = [];
  List<String> get BrachRadNew => _BrachRadNew;
  set BrachRadNew(List<String> _value) {
    _BrachRadNew = _value;
    secureStorage.setStringList('ff_BrachRadNew', _value);
  }

  void deleteBrachRadNew() {
    secureStorage.delete(key: 'ff_BrachRadNew');
  }

  void addToBrachRadNew(String _value) {
    _BrachRadNew.add(_value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeFromBrachRadNew(String _value) {
    _BrachRadNew.remove(_value);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  void removeAtIndexFromBrachRadNew(int _index) {
    _BrachRadNew.removeAt(_index);
    secureStorage.setStringList('ff_BrachRadNew', _BrachRadNew);
  }

  String _brachGroupNew = '';
  String get brachGroupNew => _brachGroupNew;
  set brachGroupNew(String _value) {
    _brachGroupNew = _value;
    secureStorage.setString('ff_brachGroupNew', _value);
  }

  void deleteBrachGroupNew() {
    secureStorage.delete(key: 'ff_brachGroupNew');
  }

  List<String> _leadCalledStatusReason = [];
  List<String> get leadCalledStatusReason => _leadCalledStatusReason;
  set leadCalledStatusReason(List<String> _value) {
    _leadCalledStatusReason = _value;
  }

  void addToLeadCalledStatusReason(String _value) {
    _leadCalledStatusReason.add(_value);
  }

  void removeFromLeadCalledStatusReason(String _value) {
    _leadCalledStatusReason.remove(_value);
  }

  void removeAtIndexFromLeadCalledStatusReason(int _index) {
    _leadCalledStatusReason.removeAt(_index);
  }

  List<String> _leadContractStatus = [];
  List<String> get leadContractStatus => _leadContractStatus;
  set leadContractStatus(List<String> _value) {
    _leadContractStatus = _value;
  }

  void addToLeadContractStatus(String _value) {
    _leadContractStatus.add(_value);
  }

  void removeFromLeadContractStatus(String _value) {
    _leadContractStatus.remove(_value);
  }

  void removeAtIndexFromLeadContractStatus(int _index) {
    _leadContractStatus.removeAt(_index);
  }

  List<String> _leadContractDate = [];
  List<String> get leadContractDate => _leadContractDate;
  set leadContractDate(List<String> _value) {
    _leadContractDate = _value;
  }

  void addToLeadContractDate(String _value) {
    _leadContractDate.add(_value);
  }

  void removeFromLeadContractDate(String _value) {
    _leadContractDate.remove(_value);
  }

  void removeAtIndexFromLeadContractDate(int _index) {
    _leadContractDate.removeAt(_index);
  }

  List<String> _defaultList1 = ['Hello World'];
  List<String> get defaultList1 => _defaultList1;
  set defaultList1(List<String> _value) {
    _defaultList1 = _value;
  }

  void addToDefaultList1(String _value) {
    _defaultList1.add(_value);
  }

  void removeFromDefaultList1(String _value) {
    _defaultList1.remove(_value);
  }

  void removeAtIndexFromDefaultList1(int _index) {
    _defaultList1.removeAt(_index);
  }

  List<String> _defaultList2 = ['Hello World'];
  List<String> get defaultList2 => _defaultList2;
  set defaultList2(List<String> _value) {
    _defaultList2 = _value;
  }

  void addToDefaultList2(String _value) {
    _defaultList2.add(_value);
  }

  void removeFromDefaultList2(String _value) {
    _defaultList2.remove(_value);
  }

  void removeAtIndexFromDefaultList2(int _index) {
    _defaultList2.removeAt(_index);
  }

  List<String> _defaultList3 = ['Hello World'];
  List<String> get defaultList3 => _defaultList3;
  set defaultList3(List<String> _value) {
    _defaultList3 = _value;
  }

  void addToDefaultList3(String _value) {
    _defaultList3.add(_value);
  }

  void removeFromDefaultList3(String _value) {
    _defaultList3.remove(_value);
  }

  void removeAtIndexFromDefaultList3(int _index) {
    _defaultList3.removeAt(_index);
  }

  List<String> _defaultList4 = ['Hello World'];
  List<String> get defaultList4 => _defaultList4;
  set defaultList4(List<String> _value) {
    _defaultList4 = _value;
  }

  void addToDefaultList4(String _value) {
    _defaultList4.add(_value);
  }

  void removeFromDefaultList4(String _value) {
    _defaultList4.remove(_value);
  }

  void removeAtIndexFromDefaultList4(int _index) {
    _defaultList4.removeAt(_index);
  }

  List<String> _defaultList5 = ['Hello World'];
  List<String> get defaultList5 => _defaultList5;
  set defaultList5(List<String> _value) {
    _defaultList5 = _value;
  }

  void addToDefaultList5(String _value) {
    _defaultList5.add(_value);
  }

  void removeFromDefaultList5(String _value) {
    _defaultList5.remove(_value);
  }

  void removeAtIndexFromDefaultList5(int _index) {
    _defaultList5.removeAt(_index);
  }

  List<String> _defaultList6 = ['Hello World'];
  List<String> get defaultList6 => _defaultList6;
  set defaultList6(List<String> _value) {
    _defaultList6 = _value;
  }

  void addToDefaultList6(String _value) {
    _defaultList6.add(_value);
  }

  void removeFromDefaultList6(String _value) {
    _defaultList6.remove(_value);
  }

  void removeAtIndexFromDefaultList6(int _index) {
    _defaultList6.removeAt(_index);
  }

  List<String> _defaultList7 = ['Hello World'];
  List<String> get defaultList7 => _defaultList7;
  set defaultList7(List<String> _value) {
    _defaultList7 = _value;
  }

  void addToDefaultList7(String _value) {
    _defaultList7.add(_value);
  }

  void removeFromDefaultList7(String _value) {
    _defaultList7.remove(_value);
  }

  void removeAtIndexFromDefaultList7(int _index) {
    _defaultList7.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

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
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
