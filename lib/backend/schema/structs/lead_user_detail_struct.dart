// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadUserDetailStruct extends FFFirebaseStruct {
  LeadUserDetailStruct({
    String? employeeId,
    String? username,
    String? level,
    String? levelName,
    String? position,
    String? branchCode,
    String? branchName,
    String? areaCode,
    String? areaName,
    String? regionCode,
    String? regionName,
    String? unitName,
    String? department,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _employeeId = employeeId,
        _username = username,
        _level = level,
        _levelName = levelName,
        _position = position,
        _branchCode = branchCode,
        _branchName = branchName,
        _areaCode = areaCode,
        _areaName = areaName,
        _regionCode = regionCode,
        _regionName = regionName,
        _unitName = unitName,
        _department = department,
        super(firestoreUtilData);

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  set level(String? val) => _level = val;

  bool hasLevel() => _level != null;

  // "level_name" field.
  String? _levelName;
  String get levelName => _levelName ?? '';
  set levelName(String? val) => _levelName = val;

  bool hasLevelName() => _levelName != null;

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;

  bool hasPosition() => _position != null;

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "area_code" field.
  String? _areaCode;
  String get areaCode => _areaCode ?? '';
  set areaCode(String? val) => _areaCode = val;

  bool hasAreaCode() => _areaCode != null;

  // "area_name" field.
  String? _areaName;
  String get areaName => _areaName ?? '';
  set areaName(String? val) => _areaName = val;

  bool hasAreaName() => _areaName != null;

  // "region_code" field.
  String? _regionCode;
  String get regionCode => _regionCode ?? '';
  set regionCode(String? val) => _regionCode = val;

  bool hasRegionCode() => _regionCode != null;

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  set regionName(String? val) => _regionName = val;

  bool hasRegionName() => _regionName != null;

  // "unit_name" field.
  String? _unitName;
  String get unitName => _unitName ?? '';
  set unitName(String? val) => _unitName = val;

  bool hasUnitName() => _unitName != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  set department(String? val) => _department = val;

  bool hasDepartment() => _department != null;

  static LeadUserDetailStruct fromMap(Map<String, dynamic> data) =>
      LeadUserDetailStruct(
        employeeId: data['employee_id'] as String?,
        username: data['username'] as String?,
        level: data['level'] as String?,
        levelName: data['level_name'] as String?,
        position: data['position'] as String?,
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        areaCode: data['area_code'] as String?,
        areaName: data['area_name'] as String?,
        regionCode: data['region_code'] as String?,
        regionName: data['region_name'] as String?,
        unitName: data['unit_name'] as String?,
        department: data['department'] as String?,
      );

  static LeadUserDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadUserDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employee_id': _employeeId,
        'username': _username,
        'level': _level,
        'level_name': _levelName,
        'position': _position,
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'area_code': _areaCode,
        'area_name': _areaName,
        'region_code': _regionCode,
        'region_name': _regionName,
        'unit_name': _unitName,
        'department': _department,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'level': serializeParam(
          _level,
          ParamType.String,
        ),
        'level_name': serializeParam(
          _levelName,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.String,
        ),
        'branch_code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'area_code': serializeParam(
          _areaCode,
          ParamType.String,
        ),
        'area_name': serializeParam(
          _areaName,
          ParamType.String,
        ),
        'region_code': serializeParam(
          _regionCode,
          ParamType.String,
        ),
        'region_name': serializeParam(
          _regionName,
          ParamType.String,
        ),
        'unit_name': serializeParam(
          _unitName,
          ParamType.String,
        ),
        'department': serializeParam(
          _department,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadUserDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadUserDetailStruct(
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.String,
          false,
        ),
        levelName: deserializeParam(
          data['level_name'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['branch_code'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        areaCode: deserializeParam(
          data['area_code'],
          ParamType.String,
          false,
        ),
        areaName: deserializeParam(
          data['area_name'],
          ParamType.String,
          false,
        ),
        regionCode: deserializeParam(
          data['region_code'],
          ParamType.String,
          false,
        ),
        regionName: deserializeParam(
          data['region_name'],
          ParamType.String,
          false,
        ),
        unitName: deserializeParam(
          data['unit_name'],
          ParamType.String,
          false,
        ),
        department: deserializeParam(
          data['department'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadUserDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadUserDetailStruct &&
        employeeId == other.employeeId &&
        username == other.username &&
        level == other.level &&
        levelName == other.levelName &&
        position == other.position &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        areaCode == other.areaCode &&
        areaName == other.areaName &&
        regionCode == other.regionCode &&
        regionName == other.regionName &&
        unitName == other.unitName &&
        department == other.department;
  }

  @override
  int get hashCode => const ListEquality().hash([
        employeeId,
        username,
        level,
        levelName,
        position,
        branchCode,
        branchName,
        areaCode,
        areaName,
        regionCode,
        regionName,
        unitName,
        department
      ]);
}

LeadUserDetailStruct createLeadUserDetailStruct({
  String? employeeId,
  String? username,
  String? level,
  String? levelName,
  String? position,
  String? branchCode,
  String? branchName,
  String? areaCode,
  String? areaName,
  String? regionCode,
  String? regionName,
  String? unitName,
  String? department,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadUserDetailStruct(
      employeeId: employeeId,
      username: username,
      level: level,
      levelName: levelName,
      position: position,
      branchCode: branchCode,
      branchName: branchName,
      areaCode: areaCode,
      areaName: areaName,
      regionCode: regionCode,
      regionName: regionName,
      unitName: unitName,
      department: department,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadUserDetailStruct? updateLeadUserDetailStruct(
  LeadUserDetailStruct? leadUserDetail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadUserDetail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadUserDetailStructData(
  Map<String, dynamic> firestoreData,
  LeadUserDetailStruct? leadUserDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadUserDetail == null) {
    return;
  }
  if (leadUserDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadUserDetail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadUserDetailData =
      getLeadUserDetailFirestoreData(leadUserDetail, forFieldValue);
  final nestedData =
      leadUserDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadUserDetail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadUserDetailFirestoreData(
  LeadUserDetailStruct? leadUserDetail, [
  bool forFieldValue = false,
]) {
  if (leadUserDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadUserDetail.toMap());

  // Add any Firestore field values
  mapToFirestore(leadUserDetail.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadUserDetailListFirestoreData(
  List<LeadUserDetailStruct>? leadUserDetails,
) =>
    leadUserDetails
        ?.map((e) => getLeadUserDetailFirestoreData(e, true))
        .toList() ??
    [];
