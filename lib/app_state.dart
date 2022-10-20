import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
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
            : null;
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
  }

  late FlutterSecureStorage secureStorage;

  String imei = '123456789012345';

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

  String QRCodeLink = 'qrcode_link';

  String _apiURLLocalState = 'api_url_local_state';
  String get apiURLLocalState => _apiURLLocalState;
  set apiURLLocalState(String _value) {
    _apiURLLocalState = _value;
    secureStorage.setString('ff_apiURLLocalState', _value);
  }

  void deleteApiURLLocalState() {
    secureStorage.delete(key: 'ff_apiURLLocalState');
  }

  int counterNum = 0;

  List<String> imgURL = [];

  String imgURLTemp = '';

  List<String> materialRecordId = [];

  List<int> materialsAmount = [];

  bool isFromTimesheetPage = false;

  String _branchCode = 'branch_code';
  String get branchCode => _branchCode;
  set branchCode(String _value) {
    _branchCode = _value;
    secureStorage.setString('ff_branchCode', _value);
  }

  void deleteBranchCode() {
    secureStorage.delete(key: 'ff_branchCode');
  }

  String locationTemp = '';

  List<String> materialNameList = [];

  List<String> materialImgList = [];

  List<String> vloanContNoListTemp = [];

  List<String> vloanCustomerNameListTemp = [];

  bool isGetVloanContract = false;

  List<String> vloanServerListTemp = [];

  String fcmToken = 'fcm_token';

  List<String> leadID = [];

  List<DateTime> leadTimeRemainList = [];

  List<String> leadCustomerNameList = [];

  String coachURL = 'https://hris.srisawadpower.com/COACH';

  bool isInApp = false;

  bool inAppViaNotification = true;

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
    if (_value == null) {
      return;
    }
    _dateDoNotShowAgain = _value;
    secureStorage.setInt(
        'ff_dateDoNotShowAgain', _value.millisecondsSinceEpoch);
  }

  void deleteDateDoNotShowAgain() {
    secureStorage.delete(key: 'ff_dateDoNotShowAgain');
  }

  bool check = false;

  bool opsMenuVisible = false;

  List<String> bannerSuperAppImgList = [];

  int diffDate = -99;

  bool isFromAuthenPage = false;

  String _pinCodeAuthen = '013972';
  String get pinCodeAuthen => _pinCodeAuthen;
  set pinCodeAuthen(String _value) {
    _pinCodeAuthen = _value;
    secureStorage.setString('ff_pinCodeAuthen', _value);
  }

  void deletePinCodeAuthen() {
    secureStorage.delete(key: 'ff_pinCodeAuthen');
  }

  bool isFromLoginPage = false;

  bool isGotNoti = false;

  String isGottNoti = '';

  List<String> leadChannelPairColorList = [];

  List<String> leadChannelList = [];

  List<String> leadChannelColor = [];

  bool isFromSetPinPage = false;

  DocumentReference? _userLogRef =
      FirebaseFirestore.instance.doc('/user_log/[user_log]');
  DocumentReference? get userLogRef => _userLogRef;
  set userLogRef(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _userLogRef = _value;
    secureStorage.setString('ff_userLogRef', _value.path);
  }

  void deleteUserLogRef() {
    secureStorage.delete(key: 'ff_userLogRef');
  }

  DocumentReference? checkUserRef;

  String temp1 = '';

  String temp2 = '';

  DateTime? temp3;

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? _value) {
    if (_value == null) {
      return;
    }
    _userRef = _value;
    secureStorage.setString('ff_userRef', _value.path);
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

  String loginStateFirebase = '[loginStateFirebase]';

  List<String> leadCreatedTimeList = [];

  List<String> leadCallStatus = [];

  List<String> leadPhoneNumberList = [];

  List<String> leadEmployeeID = [];

  bool isPassLoginSection = false;

  List<Color> leadChannelLabelColor = [];

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

  String profileFullName = '[full_name]';

  String profileBirthDate = '[birth_date]';

  String profileUnitCodeName = '[unit_code_name]';

  String profileParentUnit = '[parent_unit]';

  String profileRegion = '[region]';

  String profileHiredDate = '[hired_date]';

  String profileServiceDuration = '[service_duration]';

  String profilePositionAge = '[position_age]';

  String profilePositionName = '[position_name]';

  List<String> dailySplashPageText = [
    'จันทร์แล้ว จันทร์จ้า สดใสซาบซ่า รับแต่สิ่งดี ๆ เข้ามาตลอดวัน',
    'สวัสดีวันอังคาร สดชื่นแจ่มใส คิดอะไรก็สมดั่งใจ อย่ามีอันตรายใดมาแผ้วพาน',
    'วันพุธสุดสดชื่น ขอให้มีความรักที่ชื่นมื่น มีแต่ความสุขใจทุกคืนวัน',
    'สวัสดีวันพฤหัสบดี ทักทายยามเช้าที่สดใส ขอให้ทำอะไร อยู่ที่ไหน มีแต่ความสุขกายสบายใจ',
    'สวัสดีวันศุกร์ สุขกาย สุขใจ สุขภาพแข็งแรง ปลอดภัยตลอดวัน',
    'Hello Saturday ขอให้ชีวิตชื่นมื่น ความรักก็ไม่ขมขื่น มีแต่ความเริงรื่นในหัวใจ',
    'สุขสันต์วันอาทิตย์ ขอให้มีสติคิดการณ์ใหญ่ มองเห็นหนทางที่กว้างไกล สู้สร้างฝันต่อไปให้สำเร็จ'
  ];

  List<String> leadBranchCode = [];

  String leadUserLevel = 'lead_user_level';

  List<int> leadChannelAmountList = [0, 0, 0, 0];

  String leadChannelSelected = 'All';

  String dailyText = 'daily_text';

  bool _firstUseApp = false;
  bool get firstUseApp => _firstUseApp;
  set firstUseApp(bool _value) {
    _firstUseApp = _value;
    secureStorage.setBool('ff_firstUseApp', _value);
  }

  void deleteFirstUseApp() {
    secureStorage.delete(key: 'ff_firstUseApp');
  }

  int introPageIndex = 1;
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
