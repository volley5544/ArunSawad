// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubdistrictsStruct extends FFFirebaseStruct {
  SubdistrictsStruct({
    String? subdistrictName,
    int? subdistrictsCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subdistrictName = subdistrictName,
        _subdistrictsCount = subdistrictsCount,
        super(firestoreUtilData);

  // "subdistrict_name" field.
  String? _subdistrictName;
  String get subdistrictName => _subdistrictName ?? '';
  set subdistrictName(String? val) => _subdistrictName = val;

  bool hasSubdistrictName() => _subdistrictName != null;

  // "subdistricts_count" field.
  int? _subdistrictsCount;
  int get subdistrictsCount => _subdistrictsCount ?? 0;
  set subdistrictsCount(int? val) => _subdistrictsCount = val;

  void incrementSubdistrictsCount(int amount) =>
      subdistrictsCount = subdistrictsCount + amount;

  bool hasSubdistrictsCount() => _subdistrictsCount != null;

  static SubdistrictsStruct fromMap(Map<String, dynamic> data) =>
      SubdistrictsStruct(
        subdistrictName: data['subdistrict_name'] as String?,
        subdistrictsCount: castToType<int>(data['subdistricts_count']),
      );

  static SubdistrictsStruct? maybeFromMap(dynamic data) => data is Map
      ? SubdistrictsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subdistrict_name': _subdistrictName,
        'subdistricts_count': _subdistrictsCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subdistrict_name': serializeParam(
          _subdistrictName,
          ParamType.String,
        ),
        'subdistricts_count': serializeParam(
          _subdistrictsCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static SubdistrictsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubdistrictsStruct(
        subdistrictName: deserializeParam(
          data['subdistrict_name'],
          ParamType.String,
          false,
        ),
        subdistrictsCount: deserializeParam(
          data['subdistricts_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SubdistrictsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubdistrictsStruct &&
        subdistrictName == other.subdistrictName &&
        subdistrictsCount == other.subdistrictsCount;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([subdistrictName, subdistrictsCount]);
}

SubdistrictsStruct createSubdistrictsStruct({
  String? subdistrictName,
  int? subdistrictsCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubdistrictsStruct(
      subdistrictName: subdistrictName,
      subdistrictsCount: subdistrictsCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubdistrictsStruct? updateSubdistrictsStruct(
  SubdistrictsStruct? subdistricts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subdistricts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubdistrictsStructData(
  Map<String, dynamic> firestoreData,
  SubdistrictsStruct? subdistricts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subdistricts == null) {
    return;
  }
  if (subdistricts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subdistricts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subdistrictsData =
      getSubdistrictsFirestoreData(subdistricts, forFieldValue);
  final nestedData =
      subdistrictsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subdistricts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubdistrictsFirestoreData(
  SubdistrictsStruct? subdistricts, [
  bool forFieldValue = false,
]) {
  if (subdistricts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subdistricts.toMap());

  // Add any Firestore field values
  mapToFirestore(subdistricts.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubdistrictsListFirestoreData(
  List<SubdistrictsStruct>? subdistrictss,
) =>
    subdistrictss?.map((e) => getSubdistrictsFirestoreData(e, true)).toList() ??
    [];
