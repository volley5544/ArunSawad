// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleTypeListStruct extends FFFirebaseStruct {
  VehicleTypeListStruct({
    List<String>? vehicleId,
    List<String>? vehicleCode,
    List<String>? vehicleName,
    List<String>? vehicleType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vehicleId = vehicleId,
        _vehicleCode = vehicleCode,
        _vehicleName = vehicleName,
        _vehicleType = vehicleType,
        super(firestoreUtilData);

  // "vehicle_id" field.
  List<String>? _vehicleId;
  List<String> get vehicleId => _vehicleId ?? const [];
  set vehicleId(List<String>? val) => _vehicleId = val;

  void updateVehicleId(Function(List<String>) updateFn) {
    updateFn(_vehicleId ??= []);
  }

  bool hasVehicleId() => _vehicleId != null;

  // "vehicle_code" field.
  List<String>? _vehicleCode;
  List<String> get vehicleCode => _vehicleCode ?? const [];
  set vehicleCode(List<String>? val) => _vehicleCode = val;

  void updateVehicleCode(Function(List<String>) updateFn) {
    updateFn(_vehicleCode ??= []);
  }

  bool hasVehicleCode() => _vehicleCode != null;

  // "vehicle_name" field.
  List<String>? _vehicleName;
  List<String> get vehicleName => _vehicleName ?? const [];
  set vehicleName(List<String>? val) => _vehicleName = val;

  void updateVehicleName(Function(List<String>) updateFn) {
    updateFn(_vehicleName ??= []);
  }

  bool hasVehicleName() => _vehicleName != null;

  // "vehicle_type" field.
  List<String>? _vehicleType;
  List<String> get vehicleType => _vehicleType ?? const [];
  set vehicleType(List<String>? val) => _vehicleType = val;

  void updateVehicleType(Function(List<String>) updateFn) {
    updateFn(_vehicleType ??= []);
  }

  bool hasVehicleType() => _vehicleType != null;

  static VehicleTypeListStruct fromMap(Map<String, dynamic> data) =>
      VehicleTypeListStruct(
        vehicleId: getDataList(data['vehicle_id']),
        vehicleCode: getDataList(data['vehicle_code']),
        vehicleName: getDataList(data['vehicle_name']),
        vehicleType: getDataList(data['vehicle_type']),
      );

  static VehicleTypeListStruct? maybeFromMap(dynamic data) => data is Map
      ? VehicleTypeListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vehicle_id': _vehicleId,
        'vehicle_code': _vehicleCode,
        'vehicle_name': _vehicleName,
        'vehicle_type': _vehicleType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vehicle_id': serializeParam(
          _vehicleId,
          ParamType.String,
          isList: true,
        ),
        'vehicle_code': serializeParam(
          _vehicleCode,
          ParamType.String,
          isList: true,
        ),
        'vehicle_name': serializeParam(
          _vehicleName,
          ParamType.String,
          isList: true,
        ),
        'vehicle_type': serializeParam(
          _vehicleType,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static VehicleTypeListStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleTypeListStruct(
        vehicleId: deserializeParam<String>(
          data['vehicle_id'],
          ParamType.String,
          true,
        ),
        vehicleCode: deserializeParam<String>(
          data['vehicle_code'],
          ParamType.String,
          true,
        ),
        vehicleName: deserializeParam<String>(
          data['vehicle_name'],
          ParamType.String,
          true,
        ),
        vehicleType: deserializeParam<String>(
          data['vehicle_type'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'VehicleTypeListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VehicleTypeListStruct &&
        listEquality.equals(vehicleId, other.vehicleId) &&
        listEquality.equals(vehicleCode, other.vehicleCode) &&
        listEquality.equals(vehicleName, other.vehicleName) &&
        listEquality.equals(vehicleType, other.vehicleType);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([vehicleId, vehicleCode, vehicleName, vehicleType]);
}

VehicleTypeListStruct createVehicleTypeListStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VehicleTypeListStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VehicleTypeListStruct? updateVehicleTypeListStruct(
  VehicleTypeListStruct? vehicleTypeList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vehicleTypeList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVehicleTypeListStructData(
  Map<String, dynamic> firestoreData,
  VehicleTypeListStruct? vehicleTypeList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vehicleTypeList == null) {
    return;
  }
  if (vehicleTypeList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vehicleTypeList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vehicleTypeListData =
      getVehicleTypeListFirestoreData(vehicleTypeList, forFieldValue);
  final nestedData =
      vehicleTypeListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vehicleTypeList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVehicleTypeListFirestoreData(
  VehicleTypeListStruct? vehicleTypeList, [
  bool forFieldValue = false,
]) {
  if (vehicleTypeList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vehicleTypeList.toMap());

  // Add any Firestore field values
  mapToFirestore(vehicleTypeList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVehicleTypeListListFirestoreData(
  List<VehicleTypeListStruct>? vehicleTypeLists,
) =>
    vehicleTypeLists
        ?.map((e) => getVehicleTypeListFirestoreData(e, true))
        .toList() ??
    [];
