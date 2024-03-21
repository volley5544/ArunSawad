// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SaveCallStruct extends FFFirebaseStruct {
  SaveCallStruct({
    List<String>? contnoId,
    List<String>? contno,
    List<String>? historyLeadStatus,
    List<String>? historyReasonName,
    List<String>? createdUserid,
    List<String>? updatedUserid,
    List<String>? arappdate,
    List<String>? ardesc,
    List<String>? userid,
    List<String>? remgcode,
    List<String>? remdetcode,
    List<String>? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contnoId = contnoId,
        _contno = contno,
        _historyLeadStatus = historyLeadStatus,
        _historyReasonName = historyReasonName,
        _createdUserid = createdUserid,
        _updatedUserid = updatedUserid,
        _arappdate = arappdate,
        _ardesc = ardesc,
        _userid = userid,
        _remgcode = remgcode,
        _remdetcode = remdetcode,
        _amount = amount,
        super(firestoreUtilData);

  // "CONTNO_ID" field.
  List<String>? _contnoId;
  List<String> get contnoId => _contnoId ?? const [];
  set contnoId(List<String>? val) => _contnoId = val;
  void updateContnoId(Function(List<String>) updateFn) =>
      updateFn(_contnoId ??= []);
  bool hasContnoId() => _contnoId != null;

  // "CONTNO" field.
  List<String>? _contno;
  List<String> get contno => _contno ?? const [];
  set contno(List<String>? val) => _contno = val;
  void updateContno(Function(List<String>) updateFn) =>
      updateFn(_contno ??= []);
  bool hasContno() => _contno != null;

  // "HISTORY_LEAD_STATUS" field.
  List<String>? _historyLeadStatus;
  List<String> get historyLeadStatus => _historyLeadStatus ?? const [];
  set historyLeadStatus(List<String>? val) => _historyLeadStatus = val;
  void updateHistoryLeadStatus(Function(List<String>) updateFn) =>
      updateFn(_historyLeadStatus ??= []);
  bool hasHistoryLeadStatus() => _historyLeadStatus != null;

  // "HISTORY_REASON_NAME" field.
  List<String>? _historyReasonName;
  List<String> get historyReasonName => _historyReasonName ?? const [];
  set historyReasonName(List<String>? val) => _historyReasonName = val;
  void updateHistoryReasonName(Function(List<String>) updateFn) =>
      updateFn(_historyReasonName ??= []);
  bool hasHistoryReasonName() => _historyReasonName != null;

  // "CREATED_USERID" field.
  List<String>? _createdUserid;
  List<String> get createdUserid => _createdUserid ?? const [];
  set createdUserid(List<String>? val) => _createdUserid = val;
  void updateCreatedUserid(Function(List<String>) updateFn) =>
      updateFn(_createdUserid ??= []);
  bool hasCreatedUserid() => _createdUserid != null;

  // "UPDATED_USERID" field.
  List<String>? _updatedUserid;
  List<String> get updatedUserid => _updatedUserid ?? const [];
  set updatedUserid(List<String>? val) => _updatedUserid = val;
  void updateUpdatedUserid(Function(List<String>) updateFn) =>
      updateFn(_updatedUserid ??= []);
  bool hasUpdatedUserid() => _updatedUserid != null;

  // "ARAPPDATE" field.
  List<String>? _arappdate;
  List<String> get arappdate => _arappdate ?? const [];
  set arappdate(List<String>? val) => _arappdate = val;
  void updateArappdate(Function(List<String>) updateFn) =>
      updateFn(_arappdate ??= []);
  bool hasArappdate() => _arappdate != null;

  // "ARDESC" field.
  List<String>? _ardesc;
  List<String> get ardesc => _ardesc ?? const [];
  set ardesc(List<String>? val) => _ardesc = val;
  void updateArdesc(Function(List<String>) updateFn) =>
      updateFn(_ardesc ??= []);
  bool hasArdesc() => _ardesc != null;

  // "USERID" field.
  List<String>? _userid;
  List<String> get userid => _userid ?? const [];
  set userid(List<String>? val) => _userid = val;
  void updateUserid(Function(List<String>) updateFn) =>
      updateFn(_userid ??= []);
  bool hasUserid() => _userid != null;

  // "REMGCODE" field.
  List<String>? _remgcode;
  List<String> get remgcode => _remgcode ?? const [];
  set remgcode(List<String>? val) => _remgcode = val;
  void updateRemgcode(Function(List<String>) updateFn) =>
      updateFn(_remgcode ??= []);
  bool hasRemgcode() => _remgcode != null;

  // "REMDETCODE" field.
  List<String>? _remdetcode;
  List<String> get remdetcode => _remdetcode ?? const [];
  set remdetcode(List<String>? val) => _remdetcode = val;
  void updateRemdetcode(Function(List<String>) updateFn) =>
      updateFn(_remdetcode ??= []);
  bool hasRemdetcode() => _remdetcode != null;

  // "AMOUNT" field.
  List<String>? _amount;
  List<String> get amount => _amount ?? const [];
  set amount(List<String>? val) => _amount = val;
  void updateAmount(Function(List<String>) updateFn) =>
      updateFn(_amount ??= []);
  bool hasAmount() => _amount != null;

  static SaveCallStruct fromMap(Map<String, dynamic> data) => SaveCallStruct(
        contnoId: getDataList(data['CONTNO_ID']),
        contno: getDataList(data['CONTNO']),
        historyLeadStatus: getDataList(data['HISTORY_LEAD_STATUS']),
        historyReasonName: getDataList(data['HISTORY_REASON_NAME']),
        createdUserid: getDataList(data['CREATED_USERID']),
        updatedUserid: getDataList(data['UPDATED_USERID']),
        arappdate: getDataList(data['ARAPPDATE']),
        ardesc: getDataList(data['ARDESC']),
        userid: getDataList(data['USERID']),
        remgcode: getDataList(data['REMGCODE']),
        remdetcode: getDataList(data['REMDETCODE']),
        amount: getDataList(data['AMOUNT']),
      );

  static SaveCallStruct? maybeFromMap(dynamic data) =>
      data is Map ? SaveCallStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'CONTNO_ID': _contnoId,
        'CONTNO': _contno,
        'HISTORY_LEAD_STATUS': _historyLeadStatus,
        'HISTORY_REASON_NAME': _historyReasonName,
        'CREATED_USERID': _createdUserid,
        'UPDATED_USERID': _updatedUserid,
        'ARAPPDATE': _arappdate,
        'ARDESC': _ardesc,
        'USERID': _userid,
        'REMGCODE': _remgcode,
        'REMDETCODE': _remdetcode,
        'AMOUNT': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CONTNO_ID': serializeParam(
          _contnoId,
          ParamType.String,
          true,
        ),
        'CONTNO': serializeParam(
          _contno,
          ParamType.String,
          true,
        ),
        'HISTORY_LEAD_STATUS': serializeParam(
          _historyLeadStatus,
          ParamType.String,
          true,
        ),
        'HISTORY_REASON_NAME': serializeParam(
          _historyReasonName,
          ParamType.String,
          true,
        ),
        'CREATED_USERID': serializeParam(
          _createdUserid,
          ParamType.String,
          true,
        ),
        'UPDATED_USERID': serializeParam(
          _updatedUserid,
          ParamType.String,
          true,
        ),
        'ARAPPDATE': serializeParam(
          _arappdate,
          ParamType.String,
          true,
        ),
        'ARDESC': serializeParam(
          _ardesc,
          ParamType.String,
          true,
        ),
        'USERID': serializeParam(
          _userid,
          ParamType.String,
          true,
        ),
        'REMGCODE': serializeParam(
          _remgcode,
          ParamType.String,
          true,
        ),
        'REMDETCODE': serializeParam(
          _remdetcode,
          ParamType.String,
          true,
        ),
        'AMOUNT': serializeParam(
          _amount,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static SaveCallStruct fromSerializableMap(Map<String, dynamic> data) =>
      SaveCallStruct(
        contnoId: deserializeParam<String>(
          data['CONTNO_ID'],
          ParamType.String,
          true,
        ),
        contno: deserializeParam<String>(
          data['CONTNO'],
          ParamType.String,
          true,
        ),
        historyLeadStatus: deserializeParam<String>(
          data['HISTORY_LEAD_STATUS'],
          ParamType.String,
          true,
        ),
        historyReasonName: deserializeParam<String>(
          data['HISTORY_REASON_NAME'],
          ParamType.String,
          true,
        ),
        createdUserid: deserializeParam<String>(
          data['CREATED_USERID'],
          ParamType.String,
          true,
        ),
        updatedUserid: deserializeParam<String>(
          data['UPDATED_USERID'],
          ParamType.String,
          true,
        ),
        arappdate: deserializeParam<String>(
          data['ARAPPDATE'],
          ParamType.String,
          true,
        ),
        ardesc: deserializeParam<String>(
          data['ARDESC'],
          ParamType.String,
          true,
        ),
        userid: deserializeParam<String>(
          data['USERID'],
          ParamType.String,
          true,
        ),
        remgcode: deserializeParam<String>(
          data['REMGCODE'],
          ParamType.String,
          true,
        ),
        remdetcode: deserializeParam<String>(
          data['REMDETCODE'],
          ParamType.String,
          true,
        ),
        amount: deserializeParam<String>(
          data['AMOUNT'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SaveCallStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SaveCallStruct &&
        listEquality.equals(contnoId, other.contnoId) &&
        listEquality.equals(contno, other.contno) &&
        listEquality.equals(historyLeadStatus, other.historyLeadStatus) &&
        listEquality.equals(historyReasonName, other.historyReasonName) &&
        listEquality.equals(createdUserid, other.createdUserid) &&
        listEquality.equals(updatedUserid, other.updatedUserid) &&
        listEquality.equals(arappdate, other.arappdate) &&
        listEquality.equals(ardesc, other.ardesc) &&
        listEquality.equals(userid, other.userid) &&
        listEquality.equals(remgcode, other.remgcode) &&
        listEquality.equals(remdetcode, other.remdetcode) &&
        listEquality.equals(amount, other.amount);
  }

  @override
  int get hashCode => const ListEquality().hash([
        contnoId,
        contno,
        historyLeadStatus,
        historyReasonName,
        createdUserid,
        updatedUserid,
        arappdate,
        ardesc,
        userid,
        remgcode,
        remdetcode,
        amount
      ]);
}

SaveCallStruct createSaveCallStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaveCallStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaveCallStruct? updateSaveCallStruct(
  SaveCallStruct? saveCall, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saveCall
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaveCallStructData(
  Map<String, dynamic> firestoreData,
  SaveCallStruct? saveCall,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saveCall == null) {
    return;
  }
  if (saveCall.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && saveCall.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saveCallData = getSaveCallFirestoreData(saveCall, forFieldValue);
  final nestedData = saveCallData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = saveCall.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaveCallFirestoreData(
  SaveCallStruct? saveCall, [
  bool forFieldValue = false,
]) {
  if (saveCall == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saveCall.toMap());

  // Add any Firestore field values
  saveCall.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaveCallListFirestoreData(
  List<SaveCallStruct>? saveCalls,
) =>
    saveCalls?.map((e) => getSaveCallFirestoreData(e, true)).toList() ?? [];
