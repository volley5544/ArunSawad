// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadDetailStruct extends FFFirebaseStruct {
  LeadDetailStruct({
    int? sdf,
    String? wwww,
    String? wwffddd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sdf = sdf,
        _wwww = wwww,
        _wwffddd = wwffddd,
        super(firestoreUtilData);

  // "sdf" field.
  int? _sdf;
  int get sdf => _sdf ?? 0;
  set sdf(int? val) => _sdf = val;

  void incrementSdf(int amount) => sdf = sdf + amount;

  bool hasSdf() => _sdf != null;

  // "wwww" field.
  String? _wwww;
  String get wwww => _wwww ?? '';
  set wwww(String? val) => _wwww = val;

  bool hasWwww() => _wwww != null;

  // "wwffddd" field.
  String? _wwffddd;
  String get wwffddd => _wwffddd ?? '';
  set wwffddd(String? val) => _wwffddd = val;

  bool hasWwffddd() => _wwffddd != null;

  static LeadDetailStruct fromMap(Map<String, dynamic> data) =>
      LeadDetailStruct(
        sdf: castToType<int>(data['sdf']),
        wwww: data['wwww'] as String?,
        wwffddd: data['wwffddd'] as String?,
      );

  static LeadDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sdf': _sdf,
        'wwww': _wwww,
        'wwffddd': _wwffddd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sdf': serializeParam(
          _sdf,
          ParamType.int,
        ),
        'wwww': serializeParam(
          _wwww,
          ParamType.String,
        ),
        'wwffddd': serializeParam(
          _wwffddd,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadDetailStruct(
        sdf: deserializeParam(
          data['sdf'],
          ParamType.int,
          false,
        ),
        wwww: deserializeParam(
          data['wwww'],
          ParamType.String,
          false,
        ),
        wwffddd: deserializeParam(
          data['wwffddd'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadDetailStruct &&
        sdf == other.sdf &&
        wwww == other.wwww &&
        wwffddd == other.wwffddd;
  }

  @override
  int get hashCode => const ListEquality().hash([sdf, wwww, wwffddd]);
}

LeadDetailStruct createLeadDetailStruct({
  int? sdf,
  String? wwww,
  String? wwffddd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadDetailStruct(
      sdf: sdf,
      wwww: wwww,
      wwffddd: wwffddd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadDetailStruct? updateLeadDetailStruct(
  LeadDetailStruct? leadDetail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadDetail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadDetailStructData(
  Map<String, dynamic> firestoreData,
  LeadDetailStruct? leadDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadDetail == null) {
    return;
  }
  if (leadDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadDetail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadDetailData = getLeadDetailFirestoreData(leadDetail, forFieldValue);
  final nestedData = leadDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadDetail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadDetailFirestoreData(
  LeadDetailStruct? leadDetail, [
  bool forFieldValue = false,
]) {
  if (leadDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadDetail.toMap());

  // Add any Firestore field values
  leadDetail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadDetailListFirestoreData(
  List<LeadDetailStruct>? leadDetails,
) =>
    leadDetails?.map((e) => getLeadDetailFirestoreData(e, true)).toList() ?? [];
