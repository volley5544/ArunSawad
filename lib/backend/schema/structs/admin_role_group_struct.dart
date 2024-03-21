// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRoleGroupStruct extends FFFirebaseStruct {
  AdminRoleGroupStruct({
    String? groupName,
    List<String>? employeeId,
    List<String>? visibleMenuName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _groupName = groupName,
        _employeeId = employeeId,
        _visibleMenuName = visibleMenuName,
        super(firestoreUtilData);

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  set groupName(String? val) => _groupName = val;
  bool hasGroupName() => _groupName != null;

  // "employee_id" field.
  List<String>? _employeeId;
  List<String> get employeeId => _employeeId ?? const [];
  set employeeId(List<String>? val) => _employeeId = val;
  void updateEmployeeId(Function(List<String>) updateFn) =>
      updateFn(_employeeId ??= []);
  bool hasEmployeeId() => _employeeId != null;

  // "visible_menu_name" field.
  List<String>? _visibleMenuName;
  List<String> get visibleMenuName => _visibleMenuName ?? const [];
  set visibleMenuName(List<String>? val) => _visibleMenuName = val;
  void updateVisibleMenuName(Function(List<String>) updateFn) =>
      updateFn(_visibleMenuName ??= []);
  bool hasVisibleMenuName() => _visibleMenuName != null;

  static AdminRoleGroupStruct fromMap(Map<String, dynamic> data) =>
      AdminRoleGroupStruct(
        groupName: data['group_name'] as String?,
        employeeId: getDataList(data['employee_id']),
        visibleMenuName: getDataList(data['visible_menu_name']),
      );

  static AdminRoleGroupStruct? maybeFromMap(dynamic data) => data is Map
      ? AdminRoleGroupStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'group_name': _groupName,
        'employee_id': _employeeId,
        'visible_menu_name': _visibleMenuName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'group_name': serializeParam(
          _groupName,
          ParamType.String,
        ),
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
          true,
        ),
        'visible_menu_name': serializeParam(
          _visibleMenuName,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static AdminRoleGroupStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdminRoleGroupStruct(
        groupName: deserializeParam(
          data['group_name'],
          ParamType.String,
          false,
        ),
        employeeId: deserializeParam<String>(
          data['employee_id'],
          ParamType.String,
          true,
        ),
        visibleMenuName: deserializeParam<String>(
          data['visible_menu_name'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AdminRoleGroupStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AdminRoleGroupStruct &&
        groupName == other.groupName &&
        listEquality.equals(employeeId, other.employeeId) &&
        listEquality.equals(visibleMenuName, other.visibleMenuName);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([groupName, employeeId, visibleMenuName]);
}

AdminRoleGroupStruct createAdminRoleGroupStruct({
  String? groupName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdminRoleGroupStruct(
      groupName: groupName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdminRoleGroupStruct? updateAdminRoleGroupStruct(
  AdminRoleGroupStruct? adminRoleGroup, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adminRoleGroup
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdminRoleGroupStructData(
  Map<String, dynamic> firestoreData,
  AdminRoleGroupStruct? adminRoleGroup,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adminRoleGroup == null) {
    return;
  }
  if (adminRoleGroup.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adminRoleGroup.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adminRoleGroupData =
      getAdminRoleGroupFirestoreData(adminRoleGroup, forFieldValue);
  final nestedData =
      adminRoleGroupData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adminRoleGroup.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdminRoleGroupFirestoreData(
  AdminRoleGroupStruct? adminRoleGroup, [
  bool forFieldValue = false,
]) {
  if (adminRoleGroup == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adminRoleGroup.toMap());

  // Add any Firestore field values
  adminRoleGroup.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdminRoleGroupListFirestoreData(
  List<AdminRoleGroupStruct>? adminRoleGroups,
) =>
    adminRoleGroups
        ?.map((e) => getAdminRoleGroupFirestoreData(e, true))
        .toList() ??
    [];
