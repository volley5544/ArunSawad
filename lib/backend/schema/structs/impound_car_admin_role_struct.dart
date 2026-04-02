// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpoundCarAdminRoleStruct extends FFFirebaseStruct {
  ImpoundCarAdminRoleStruct({
    List<String>? level,
    List<String>? roleName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _level = level,
        _roleName = roleName,
        super(firestoreUtilData);

  // "Level" field.
  List<String>? _level;
  List<String> get level => _level ?? const [];
  set level(List<String>? val) => _level = val;

  void updateLevel(Function(List<String>) updateFn) {
    updateFn(_level ??= []);
  }

  bool hasLevel() => _level != null;

  // "role_name" field.
  List<String>? _roleName;
  List<String> get roleName => _roleName ?? const [];
  set roleName(List<String>? val) => _roleName = val;

  void updateRoleName(Function(List<String>) updateFn) {
    updateFn(_roleName ??= []);
  }

  bool hasRoleName() => _roleName != null;

  static ImpoundCarAdminRoleStruct fromMap(Map<String, dynamic> data) =>
      ImpoundCarAdminRoleStruct(
        level: getDataList(data['Level']),
        roleName: getDataList(data['role_name']),
      );

  static ImpoundCarAdminRoleStruct? maybeFromMap(dynamic data) => data is Map
      ? ImpoundCarAdminRoleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Level': _level,
        'role_name': _roleName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Level': serializeParam(
          _level,
          ParamType.String,
          isList: true,
        ),
        'role_name': serializeParam(
          _roleName,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ImpoundCarAdminRoleStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ImpoundCarAdminRoleStruct(
        level: deserializeParam<String>(
          data['Level'],
          ParamType.String,
          true,
        ),
        roleName: deserializeParam<String>(
          data['role_name'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ImpoundCarAdminRoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImpoundCarAdminRoleStruct &&
        listEquality.equals(level, other.level) &&
        listEquality.equals(roleName, other.roleName);
  }

  @override
  int get hashCode => const ListEquality().hash([level, roleName]);
}

ImpoundCarAdminRoleStruct createImpoundCarAdminRoleStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImpoundCarAdminRoleStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImpoundCarAdminRoleStruct? updateImpoundCarAdminRoleStruct(
  ImpoundCarAdminRoleStruct? impoundCarAdminRole, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    impoundCarAdminRole
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImpoundCarAdminRoleStructData(
  Map<String, dynamic> firestoreData,
  ImpoundCarAdminRoleStruct? impoundCarAdminRole,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (impoundCarAdminRole == null) {
    return;
  }
  if (impoundCarAdminRole.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && impoundCarAdminRole.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final impoundCarAdminRoleData =
      getImpoundCarAdminRoleFirestoreData(impoundCarAdminRole, forFieldValue);
  final nestedData =
      impoundCarAdminRoleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      impoundCarAdminRole.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImpoundCarAdminRoleFirestoreData(
  ImpoundCarAdminRoleStruct? impoundCarAdminRole, [
  bool forFieldValue = false,
]) {
  if (impoundCarAdminRole == null) {
    return {};
  }
  final firestoreData = mapToFirestore(impoundCarAdminRole.toMap());

  // Add any Firestore field values
  mapToFirestore(impoundCarAdminRole.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImpoundCarAdminRoleListFirestoreData(
  List<ImpoundCarAdminRoleStruct>? impoundCarAdminRoles,
) =>
    impoundCarAdminRoles
        ?.map((e) => getImpoundCarAdminRoleFirestoreData(e, true))
        .toList() ??
    [];
