// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpDataLocationStruct extends FFFirebaseStruct {
  EmpDataLocationStruct({
    String? nameTh,
    String? employeeId,
    String? branchCode,
    String? position,
    String? level,
    String? status,
    String? fullprofile,
    int? locationCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nameTh = nameTh,
        _employeeId = employeeId,
        _branchCode = branchCode,
        _position = position,
        _level = level,
        _status = status,
        _fullprofile = fullprofile,
        _locationCount = locationCount,
        super(firestoreUtilData);

  // "name_th" field.
  String? _nameTh;
  String get nameTh => _nameTh ?? '';
  set nameTh(String? val) => _nameTh = val;

  bool hasNameTh() => _nameTh != null;

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;

  bool hasPosition() => _position != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  set level(String? val) => _level = val;

  bool hasLevel() => _level != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "fullprofile" field.
  String? _fullprofile;
  String get fullprofile => _fullprofile ?? '';
  set fullprofile(String? val) => _fullprofile = val;

  bool hasFullprofile() => _fullprofile != null;

  // "location_count" field.
  int? _locationCount;
  int get locationCount => _locationCount ?? 0;
  set locationCount(int? val) => _locationCount = val;

  void incrementLocationCount(int amount) =>
      locationCount = locationCount + amount;

  bool hasLocationCount() => _locationCount != null;

  static EmpDataLocationStruct fromMap(Map<String, dynamic> data) =>
      EmpDataLocationStruct(
        nameTh: data['name_th'] as String?,
        employeeId: data['employee_id'] as String?,
        branchCode: data['branch_code'] as String?,
        position: data['position'] as String?,
        level: data['level'] as String?,
        status: data['status'] as String?,
        fullprofile: data['fullprofile'] as String?,
        locationCount: castToType<int>(data['location_count']),
      );

  static EmpDataLocationStruct? maybeFromMap(dynamic data) => data is Map
      ? EmpDataLocationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name_th': _nameTh,
        'employee_id': _employeeId,
        'branch_code': _branchCode,
        'position': _position,
        'level': _level,
        'status': _status,
        'fullprofile': _fullprofile,
        'location_count': _locationCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name_th': serializeParam(
          _nameTh,
          ParamType.String,
        ),
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'branch_code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.String,
        ),
        'level': serializeParam(
          _level,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'fullprofile': serializeParam(
          _fullprofile,
          ParamType.String,
        ),
        'location_count': serializeParam(
          _locationCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static EmpDataLocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmpDataLocationStruct(
        nameTh: deserializeParam(
          data['name_th'],
          ParamType.String,
          false,
        ),
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['branch_code'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.String,
          false,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        fullprofile: deserializeParam(
          data['fullprofile'],
          ParamType.String,
          false,
        ),
        locationCount: deserializeParam(
          data['location_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'EmpDataLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmpDataLocationStruct &&
        nameTh == other.nameTh &&
        employeeId == other.employeeId &&
        branchCode == other.branchCode &&
        position == other.position &&
        level == other.level &&
        status == other.status &&
        fullprofile == other.fullprofile &&
        locationCount == other.locationCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nameTh,
        employeeId,
        branchCode,
        position,
        level,
        status,
        fullprofile,
        locationCount
      ]);
}

EmpDataLocationStruct createEmpDataLocationStruct({
  String? nameTh,
  String? employeeId,
  String? branchCode,
  String? position,
  String? level,
  String? status,
  String? fullprofile,
  int? locationCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmpDataLocationStruct(
      nameTh: nameTh,
      employeeId: employeeId,
      branchCode: branchCode,
      position: position,
      level: level,
      status: status,
      fullprofile: fullprofile,
      locationCount: locationCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmpDataLocationStruct? updateEmpDataLocationStruct(
  EmpDataLocationStruct? empDataLocation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    empDataLocation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmpDataLocationStructData(
  Map<String, dynamic> firestoreData,
  EmpDataLocationStruct? empDataLocation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (empDataLocation == null) {
    return;
  }
  if (empDataLocation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && empDataLocation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final empDataLocationData =
      getEmpDataLocationFirestoreData(empDataLocation, forFieldValue);
  final nestedData =
      empDataLocationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = empDataLocation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmpDataLocationFirestoreData(
  EmpDataLocationStruct? empDataLocation, [
  bool forFieldValue = false,
]) {
  if (empDataLocation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(empDataLocation.toMap());

  // Add any Firestore field values
  mapToFirestore(empDataLocation.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmpDataLocationListFirestoreData(
  List<EmpDataLocationStruct>? empDataLocations,
) =>
    empDataLocations
        ?.map((e) => getEmpDataLocationFirestoreData(e, true))
        .toList() ??
    [];
