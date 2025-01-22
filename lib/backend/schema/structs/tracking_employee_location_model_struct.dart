// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrackingEmployeeLocationModelStruct extends FFFirebaseStruct {
  TrackingEmployeeLocationModelStruct({
    String? dateTime,
    String? employeeId,
    String? latitude,
    String? longitude,
    String? eTLCreateDate,
    String? phoneNumber,
    String? operatingSystem,
    String? deviceId,
    String? times,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dateTime = dateTime,
        _employeeId = employeeId,
        _latitude = latitude,
        _longitude = longitude,
        _eTLCreateDate = eTLCreateDate,
        _phoneNumber = phoneNumber,
        _operatingSystem = operatingSystem,
        _deviceId = deviceId,
        _times = times,
        super(firestoreUtilData);

  // "date_time" field.
  String? _dateTime;
  String get dateTime => _dateTime ?? '';
  set dateTime(String? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "ETLCreateDate" field.
  String? _eTLCreateDate;
  String get eTLCreateDate => _eTLCreateDate ?? '';
  set eTLCreateDate(String? val) => _eTLCreateDate = val;

  bool hasETLCreateDate() => _eTLCreateDate != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "operating_system" field.
  String? _operatingSystem;
  String get operatingSystem => _operatingSystem ?? '';
  set operatingSystem(String? val) => _operatingSystem = val;

  bool hasOperatingSystem() => _operatingSystem != null;

  // "device_id" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "times" field.
  String? _times;
  String get times => _times ?? '';
  set times(String? val) => _times = val;

  bool hasTimes() => _times != null;

  static TrackingEmployeeLocationModelStruct fromMap(
          Map<String, dynamic> data) =>
      TrackingEmployeeLocationModelStruct(
        dateTime: data['date_time'] as String?,
        employeeId: data['employee_id'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        eTLCreateDate: data['ETLCreateDate'] as String?,
        phoneNumber: data['phone_number'] as String?,
        operatingSystem: data['operating_system'] as String?,
        deviceId: data['device_id'] as String?,
        times: data['times'] as String?,
      );

  static TrackingEmployeeLocationModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? TrackingEmployeeLocationModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'date_time': _dateTime,
        'employee_id': _employeeId,
        'latitude': _latitude,
        'longitude': _longitude,
        'ETLCreateDate': _eTLCreateDate,
        'phone_number': _phoneNumber,
        'operating_system': _operatingSystem,
        'device_id': _deviceId,
        'times': _times,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date_time': serializeParam(
          _dateTime,
          ParamType.String,
        ),
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'ETLCreateDate': serializeParam(
          _eTLCreateDate,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'operating_system': serializeParam(
          _operatingSystem,
          ParamType.String,
        ),
        'device_id': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'times': serializeParam(
          _times,
          ParamType.String,
        ),
      }.withoutNulls;

  static TrackingEmployeeLocationModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TrackingEmployeeLocationModelStruct(
        dateTime: deserializeParam(
          data['date_time'],
          ParamType.String,
          false,
        ),
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        eTLCreateDate: deserializeParam(
          data['ETLCreateDate'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        operatingSystem: deserializeParam(
          data['operating_system'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeParam(
          data['device_id'],
          ParamType.String,
          false,
        ),
        times: deserializeParam(
          data['times'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TrackingEmployeeLocationModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrackingEmployeeLocationModelStruct &&
        dateTime == other.dateTime &&
        employeeId == other.employeeId &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        eTLCreateDate == other.eTLCreateDate &&
        phoneNumber == other.phoneNumber &&
        operatingSystem == other.operatingSystem &&
        deviceId == other.deviceId &&
        times == other.times;
  }

  @override
  int get hashCode => const ListEquality().hash([
        dateTime,
        employeeId,
        latitude,
        longitude,
        eTLCreateDate,
        phoneNumber,
        operatingSystem,
        deviceId,
        times
      ]);
}

TrackingEmployeeLocationModelStruct createTrackingEmployeeLocationModelStruct({
  String? dateTime,
  String? employeeId,
  String? latitude,
  String? longitude,
  String? eTLCreateDate,
  String? phoneNumber,
  String? operatingSystem,
  String? deviceId,
  String? times,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TrackingEmployeeLocationModelStruct(
      dateTime: dateTime,
      employeeId: employeeId,
      latitude: latitude,
      longitude: longitude,
      eTLCreateDate: eTLCreateDate,
      phoneNumber: phoneNumber,
      operatingSystem: operatingSystem,
      deviceId: deviceId,
      times: times,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TrackingEmployeeLocationModelStruct? updateTrackingEmployeeLocationModelStruct(
  TrackingEmployeeLocationModelStruct? trackingEmployeeLocationModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    trackingEmployeeLocationModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTrackingEmployeeLocationModelStructData(
  Map<String, dynamic> firestoreData,
  TrackingEmployeeLocationModelStruct? trackingEmployeeLocationModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (trackingEmployeeLocationModel == null) {
    return;
  }
  if (trackingEmployeeLocationModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      trackingEmployeeLocationModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final trackingEmployeeLocationModelData =
      getTrackingEmployeeLocationModelFirestoreData(
          trackingEmployeeLocationModel, forFieldValue);
  final nestedData = trackingEmployeeLocationModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      trackingEmployeeLocationModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTrackingEmployeeLocationModelFirestoreData(
  TrackingEmployeeLocationModelStruct? trackingEmployeeLocationModel, [
  bool forFieldValue = false,
]) {
  if (trackingEmployeeLocationModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(trackingEmployeeLocationModel.toMap());

  // Add any Firestore field values
  trackingEmployeeLocationModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTrackingEmployeeLocationModelListFirestoreData(
  List<TrackingEmployeeLocationModelStruct>? trackingEmployeeLocationModels,
) =>
    trackingEmployeeLocationModels
        ?.map((e) => getTrackingEmployeeLocationModelFirestoreData(e, true))
        .toList() ??
    [];
