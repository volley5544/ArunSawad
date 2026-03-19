// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VloanRemarkRequestModelStruct extends FFFirebaseStruct {
  VloanRemarkRequestModelStruct({
    String? func,
    String? cuscod,
    String? lat,
    String? long,
    String? contno,
    String? server,
    String? msg,
    String? remgroup,
    String? remcode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _func = func,
        _cuscod = cuscod,
        _lat = lat,
        _long = long,
        _contno = contno,
        _server = server,
        _msg = msg,
        _remgroup = remgroup,
        _remcode = remcode,
        super(firestoreUtilData);

  // "func" field.
  String? _func;
  String get func => _func ?? '';
  set func(String? val) => _func = val;

  bool hasFunc() => _func != null;

  // "cuscod" field.
  String? _cuscod;
  String get cuscod => _cuscod ?? '';
  set cuscod(String? val) => _cuscod = val;

  bool hasCuscod() => _cuscod != null;

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;

  bool hasLat() => _lat != null;

  // "long" field.
  String? _long;
  String get long => _long ?? '';
  set long(String? val) => _long = val;

  bool hasLong() => _long != null;

  // "contno" field.
  String? _contno;
  String get contno => _contno ?? '';
  set contno(String? val) => _contno = val;

  bool hasContno() => _contno != null;

  // "server" field.
  String? _server;
  String get server => _server ?? '';
  set server(String? val) => _server = val;

  bool hasServer() => _server != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  set msg(String? val) => _msg = val;

  bool hasMsg() => _msg != null;

  // "remgroup" field.
  String? _remgroup;
  String get remgroup => _remgroup ?? '';
  set remgroup(String? val) => _remgroup = val;

  bool hasRemgroup() => _remgroup != null;

  // "remcode" field.
  String? _remcode;
  String get remcode => _remcode ?? '';
  set remcode(String? val) => _remcode = val;

  bool hasRemcode() => _remcode != null;

  static VloanRemarkRequestModelStruct fromMap(Map<String, dynamic> data) =>
      VloanRemarkRequestModelStruct(
        func: data['func'] as String?,
        cuscod: data['cuscod'] as String?,
        lat: data['lat'] as String?,
        long: data['long'] as String?,
        contno: data['contno'] as String?,
        server: data['server'] as String?,
        msg: data['msg'] as String?,
        remgroup: data['remgroup'] as String?,
        remcode: data['remcode'] as String?,
      );

  static VloanRemarkRequestModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? VloanRemarkRequestModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'func': _func,
        'cuscod': _cuscod,
        'lat': _lat,
        'long': _long,
        'contno': _contno,
        'server': _server,
        'msg': _msg,
        'remgroup': _remgroup,
        'remcode': _remcode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'func': serializeParam(
          _func,
          ParamType.String,
        ),
        'cuscod': serializeParam(
          _cuscod,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.String,
        ),
        'long': serializeParam(
          _long,
          ParamType.String,
        ),
        'contno': serializeParam(
          _contno,
          ParamType.String,
        ),
        'server': serializeParam(
          _server,
          ParamType.String,
        ),
        'msg': serializeParam(
          _msg,
          ParamType.String,
        ),
        'remgroup': serializeParam(
          _remgroup,
          ParamType.String,
        ),
        'remcode': serializeParam(
          _remcode,
          ParamType.String,
        ),
      }.withoutNulls;

  static VloanRemarkRequestModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VloanRemarkRequestModelStruct(
        func: deserializeParam(
          data['func'],
          ParamType.String,
          false,
        ),
        cuscod: deserializeParam(
          data['cuscod'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        long: deserializeParam(
          data['long'],
          ParamType.String,
          false,
        ),
        contno: deserializeParam(
          data['contno'],
          ParamType.String,
          false,
        ),
        server: deserializeParam(
          data['server'],
          ParamType.String,
          false,
        ),
        msg: deserializeParam(
          data['msg'],
          ParamType.String,
          false,
        ),
        remgroup: deserializeParam(
          data['remgroup'],
          ParamType.String,
          false,
        ),
        remcode: deserializeParam(
          data['remcode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VloanRemarkRequestModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VloanRemarkRequestModelStruct &&
        func == other.func &&
        cuscod == other.cuscod &&
        lat == other.lat &&
        long == other.long &&
        contno == other.contno &&
        server == other.server &&
        msg == other.msg &&
        remgroup == other.remgroup &&
        remcode == other.remcode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([func, cuscod, lat, long, contno, server, msg, remgroup, remcode]);
}

VloanRemarkRequestModelStruct createVloanRemarkRequestModelStruct({
  String? func,
  String? cuscod,
  String? lat,
  String? long,
  String? contno,
  String? server,
  String? msg,
  String? remgroup,
  String? remcode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VloanRemarkRequestModelStruct(
      func: func,
      cuscod: cuscod,
      lat: lat,
      long: long,
      contno: contno,
      server: server,
      msg: msg,
      remgroup: remgroup,
      remcode: remcode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VloanRemarkRequestModelStruct? updateVloanRemarkRequestModelStruct(
  VloanRemarkRequestModelStruct? vloanRemarkRequestModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vloanRemarkRequestModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVloanRemarkRequestModelStructData(
  Map<String, dynamic> firestoreData,
  VloanRemarkRequestModelStruct? vloanRemarkRequestModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vloanRemarkRequestModel == null) {
    return;
  }
  if (vloanRemarkRequestModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      vloanRemarkRequestModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vloanRemarkRequestModelData = getVloanRemarkRequestModelFirestoreData(
      vloanRemarkRequestModel, forFieldValue);
  final nestedData =
      vloanRemarkRequestModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      vloanRemarkRequestModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVloanRemarkRequestModelFirestoreData(
  VloanRemarkRequestModelStruct? vloanRemarkRequestModel, [
  bool forFieldValue = false,
]) {
  if (vloanRemarkRequestModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vloanRemarkRequestModel.toMap());

  // Add any Firestore field values
  vloanRemarkRequestModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVloanRemarkRequestModelListFirestoreData(
  List<VloanRemarkRequestModelStruct>? vloanRemarkRequestModels,
) =>
    vloanRemarkRequestModels
        ?.map((e) => getVloanRemarkRequestModelFirestoreData(e, true))
        .toList() ??
    [];
