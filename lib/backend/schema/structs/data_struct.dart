// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataStruct extends FFFirebaseStruct {
  DataStruct({
    String? type,
    String? projectName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _projectName = projectName,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  static DataStruct fromMap(Map<String, dynamic> data) => DataStruct(
        type: data['type'] as String?,
        projectName: data['project_name'] as String?,
      );

  static DataStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'project_name': _projectName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'project_name': serializeParam(
          _projectName,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        projectName: deserializeParam(
          data['project_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataStruct &&
        type == other.type &&
        projectName == other.projectName;
  }

  @override
  int get hashCode => const ListEquality().hash([type, projectName]);
}

DataStruct createDataStruct({
  String? type,
  String? projectName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataStruct(
      type: type,
      projectName: projectName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataStruct? updateDataStruct(
  DataStruct? data, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    data
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataStructData(
  Map<String, dynamic> firestoreData,
  DataStruct? data,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (data == null) {
    return;
  }
  if (data.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && data.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataData = getDataFirestoreData(data, forFieldValue);
  final nestedData = dataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = data.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataFirestoreData(
  DataStruct? data, [
  bool forFieldValue = false,
]) {
  if (data == null) {
    return {};
  }
  final firestoreData = mapToFirestore(data.toMap());

  // Add any Firestore field values
  mapToFirestore(data.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataListFirestoreData(
  List<DataStruct>? datas,
) =>
    datas?.map((e) => getDataFirestoreData(e, true)).toList() ?? [];
