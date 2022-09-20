import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('ff_accessToken') ?? _accessToken;
    _employeeID = prefs.getString('ff_employeeID') ?? _employeeID;
    _apiURLLocalState =
        prefs.getString('ff_apiURLLocalState') ?? _apiURLLocalState;
    _branchCode = prefs.getString('ff_branchCode') ?? _branchCode;
  }

  late SharedPreferences prefs;

  String imei = '123456789012345';

  String _accessToken = 'access_token';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    prefs.setString('ff_accessToken', _value);
  }

  String _employeeID = 'employee_id';
  String get employeeID => _employeeID;
  set employeeID(String _value) {
    _employeeID = _value;
    prefs.setString('ff_employeeID', _value);
  }

  String QRCodeLink = 'qrcode_link';

  String _apiURLLocalState = 'api_url_local_state';
  String get apiURLLocalState => _apiURLLocalState;
  set apiURLLocalState(String _value) {
    _apiURLLocalState = _value;
    prefs.setString('ff_apiURLLocalState', _value);
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
    prefs.setString('ff_branchCode', _value);
  }

  String locationTemp = '';

  List<String> materialNameList = [];

  List<String> materialImgList = [];

  List<String> vloanContNoListTemp = [];

  List<String> vloanCustomerNameListTemp = [];

  bool isGetVloanContract = false;

  bool isFromLoginPage = false;

  List<String> vloanServerListTemp = [];
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
