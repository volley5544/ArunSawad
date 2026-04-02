// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DistrictsStruct extends FFFirebaseStruct {
  DistrictsStruct({
    String? districtName,
    List<SubdistrictsStruct>? subdistricts,
    int? districtsCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _districtName = districtName,
        _subdistricts = subdistricts,
        _districtsCount = districtsCount,
        super(firestoreUtilData);

  // "district_name" field.
  String? _districtName;
  String get districtName => _districtName ?? '';
  set districtName(String? val) => _districtName = val;

  bool hasDistrictName() => _districtName != null;

  // "subdistricts" field.
  List<SubdistrictsStruct>? _subdistricts;
  List<SubdistrictsStruct> get subdistricts => _subdistricts ?? const [];
  set subdistricts(List<SubdistrictsStruct>? val) => _subdistricts = val;

  void updateSubdistricts(Function(List<SubdistrictsStruct>) updateFn) {
    updateFn(_subdistricts ??= []);
  }

  bool hasSubdistricts() => _subdistricts != null;

  // "districts_count" field.
  int? _districtsCount;
  int get districtsCount => _districtsCount ?? 0;
  set districtsCount(int? val) => _districtsCount = val;

  void incrementDistrictsCount(int amount) =>
      districtsCount = districtsCount + amount;

  bool hasDistrictsCount() => _districtsCount != null;

  static DistrictsStruct fromMap(Map<String, dynamic> data) => DistrictsStruct(
        districtName: data['district_name'] as String?,
        subdistricts: getStructList(
          data['subdistricts'],
          SubdistrictsStruct.fromMap,
        ),
        districtsCount: castToType<int>(data['districts_count']),
      );

  static DistrictsStruct? maybeFromMap(dynamic data) => data is Map
      ? DistrictsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'district_name': _districtName,
        'subdistricts': _subdistricts?.map((e) => e.toMap()).toList(),
        'districts_count': _districtsCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'district_name': serializeParam(
          _districtName,
          ParamType.String,
        ),
        'subdistricts': serializeParam(
          _subdistricts,
          ParamType.DataStruct,
          isList: true,
        ),
        'districts_count': serializeParam(
          _districtsCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static DistrictsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DistrictsStruct(
        districtName: deserializeParam(
          data['district_name'],
          ParamType.String,
          false,
        ),
        subdistricts: deserializeStructParam<SubdistrictsStruct>(
          data['subdistricts'],
          ParamType.DataStruct,
          true,
          structBuilder: SubdistrictsStruct.fromSerializableMap,
        ),
        districtsCount: deserializeParam(
          data['districts_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DistrictsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DistrictsStruct &&
        districtName == other.districtName &&
        listEquality.equals(subdistricts, other.subdistricts) &&
        districtsCount == other.districtsCount;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([districtName, subdistricts, districtsCount]);
}

DistrictsStruct createDistrictsStruct({
  String? districtName,
  int? districtsCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DistrictsStruct(
      districtName: districtName,
      districtsCount: districtsCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DistrictsStruct? updateDistrictsStruct(
  DistrictsStruct? districts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    districts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDistrictsStructData(
  Map<String, dynamic> firestoreData,
  DistrictsStruct? districts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (districts == null) {
    return;
  }
  if (districts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && districts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final districtsData = getDistrictsFirestoreData(districts, forFieldValue);
  final nestedData = districtsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = districts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDistrictsFirestoreData(
  DistrictsStruct? districts, [
  bool forFieldValue = false,
]) {
  if (districts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(districts.toMap());

  // Add any Firestore field values
  mapToFirestore(districts.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDistrictsListFirestoreData(
  List<DistrictsStruct>? districtss,
) =>
    districtss?.map((e) => getDistrictsFirestoreData(e, true)).toList() ?? [];
