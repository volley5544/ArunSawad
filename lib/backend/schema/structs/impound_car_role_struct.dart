// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpoundCarRoleStruct extends FFFirebaseStruct {
  ImpoundCarRoleStruct({
    List<String>? crd,
    List<String>? auction,
    List<String>? admin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _crd = crd,
        _auction = auction,
        _admin = admin,
        super(firestoreUtilData);

  // "CRD" field.
  List<String>? _crd;
  List<String> get crd => _crd ?? const [];
  set crd(List<String>? val) => _crd = val;

  void updateCrd(Function(List<String>) updateFn) {
    updateFn(_crd ??= []);
  }

  bool hasCrd() => _crd != null;

  // "Auction" field.
  List<String>? _auction;
  List<String> get auction => _auction ?? const [];
  set auction(List<String>? val) => _auction = val;

  void updateAuction(Function(List<String>) updateFn) {
    updateFn(_auction ??= []);
  }

  bool hasAuction() => _auction != null;

  // "Admin" field.
  List<String>? _admin;
  List<String> get admin => _admin ?? const [];
  set admin(List<String>? val) => _admin = val;

  void updateAdmin(Function(List<String>) updateFn) {
    updateFn(_admin ??= []);
  }

  bool hasAdmin() => _admin != null;

  static ImpoundCarRoleStruct fromMap(Map<String, dynamic> data) =>
      ImpoundCarRoleStruct(
        crd: getDataList(data['CRD']),
        auction: getDataList(data['Auction']),
        admin: getDataList(data['Admin']),
      );

  static ImpoundCarRoleStruct? maybeFromMap(dynamic data) => data is Map
      ? ImpoundCarRoleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'CRD': _crd,
        'Auction': _auction,
        'Admin': _admin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CRD': serializeParam(
          _crd,
          ParamType.String,
          isList: true,
        ),
        'Auction': serializeParam(
          _auction,
          ParamType.String,
          isList: true,
        ),
        'Admin': serializeParam(
          _admin,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ImpoundCarRoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImpoundCarRoleStruct(
        crd: deserializeParam<String>(
          data['CRD'],
          ParamType.String,
          true,
        ),
        auction: deserializeParam<String>(
          data['Auction'],
          ParamType.String,
          true,
        ),
        admin: deserializeParam<String>(
          data['Admin'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ImpoundCarRoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImpoundCarRoleStruct &&
        listEquality.equals(crd, other.crd) &&
        listEquality.equals(auction, other.auction) &&
        listEquality.equals(admin, other.admin);
  }

  @override
  int get hashCode => const ListEquality().hash([crd, auction, admin]);
}

ImpoundCarRoleStruct createImpoundCarRoleStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImpoundCarRoleStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImpoundCarRoleStruct? updateImpoundCarRoleStruct(
  ImpoundCarRoleStruct? impoundCarRole, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    impoundCarRole
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImpoundCarRoleStructData(
  Map<String, dynamic> firestoreData,
  ImpoundCarRoleStruct? impoundCarRole,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (impoundCarRole == null) {
    return;
  }
  if (impoundCarRole.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && impoundCarRole.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final impoundCarRoleData =
      getImpoundCarRoleFirestoreData(impoundCarRole, forFieldValue);
  final nestedData =
      impoundCarRoleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = impoundCarRole.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImpoundCarRoleFirestoreData(
  ImpoundCarRoleStruct? impoundCarRole, [
  bool forFieldValue = false,
]) {
  if (impoundCarRole == null) {
    return {};
  }
  final firestoreData = mapToFirestore(impoundCarRole.toMap());

  // Add any Firestore field values
  mapToFirestore(impoundCarRole.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImpoundCarRoleListFirestoreData(
  List<ImpoundCarRoleStruct>? impoundCarRoles,
) =>
    impoundCarRoles
        ?.map((e) => getImpoundCarRoleFirestoreData(e, true))
        .toList() ??
    [];
