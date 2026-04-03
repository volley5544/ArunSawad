// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SLSCollectionDataModelStruct extends FFFirebaseStruct {
  SLSCollectionDataModelStruct({
    String? province,
    int? provinceCount,
    List<DistrictsStruct>? districts,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _province = province,
        _provinceCount = provinceCount,
        _districts = districts,
        super(firestoreUtilData);

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

  // "province_count" field.
  int? _provinceCount;
  int get provinceCount => _provinceCount ?? 0;
  set provinceCount(int? val) => _provinceCount = val;

  void incrementProvinceCount(int amount) =>
      provinceCount = provinceCount + amount;

  bool hasProvinceCount() => _provinceCount != null;

  // "districts" field.
  List<DistrictsStruct>? _districts;
  List<DistrictsStruct> get districts => _districts ?? const [];
  set districts(List<DistrictsStruct>? val) => _districts = val;

  void updateDistricts(Function(List<DistrictsStruct>) updateFn) {
    updateFn(_districts ??= []);
  }

  bool hasDistricts() => _districts != null;

  static SLSCollectionDataModelStruct fromMap(Map<String, dynamic> data) =>
      SLSCollectionDataModelStruct(
        province: data['province'] as String?,
        provinceCount: castToType<int>(data['province_count']),
        districts: getStructList(
          data['districts'],
          DistrictsStruct.fromMap,
        ),
      );

  static SLSCollectionDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SLSCollectionDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'province': _province,
        'province_count': _provinceCount,
        'districts': _districts?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'province': serializeParam(
          _province,
          ParamType.String,
        ),
        'province_count': serializeParam(
          _provinceCount,
          ParamType.int,
        ),
        'districts': serializeParam(
          _districts,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SLSCollectionDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SLSCollectionDataModelStruct(
        province: deserializeParam(
          data['province'],
          ParamType.String,
          false,
        ),
        provinceCount: deserializeParam(
          data['province_count'],
          ParamType.int,
          false,
        ),
        districts: deserializeStructParam<DistrictsStruct>(
          data['districts'],
          ParamType.DataStruct,
          true,
          structBuilder: DistrictsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SLSCollectionDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SLSCollectionDataModelStruct &&
        province == other.province &&
        provinceCount == other.provinceCount &&
        listEquality.equals(districts, other.districts);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([province, provinceCount, districts]);
}

SLSCollectionDataModelStruct createSLSCollectionDataModelStruct({
  String? province,
  int? provinceCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SLSCollectionDataModelStruct(
      province: province,
      provinceCount: provinceCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SLSCollectionDataModelStruct? updateSLSCollectionDataModelStruct(
  SLSCollectionDataModelStruct? sLSCollectionDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sLSCollectionDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSLSCollectionDataModelStructData(
  Map<String, dynamic> firestoreData,
  SLSCollectionDataModelStruct? sLSCollectionDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sLSCollectionDataModel == null) {
    return;
  }
  if (sLSCollectionDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      sLSCollectionDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sLSCollectionDataModelData = getSLSCollectionDataModelFirestoreData(
      sLSCollectionDataModel, forFieldValue);
  final nestedData =
      sLSCollectionDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      sLSCollectionDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSLSCollectionDataModelFirestoreData(
  SLSCollectionDataModelStruct? sLSCollectionDataModel, [
  bool forFieldValue = false,
]) {
  if (sLSCollectionDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sLSCollectionDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(sLSCollectionDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSLSCollectionDataModelListFirestoreData(
  List<SLSCollectionDataModelStruct>? sLSCollectionDataModels,
) =>
    sLSCollectionDataModels
        ?.map((e) => getSLSCollectionDataModelFirestoreData(e, true))
        .toList() ??
    [];
