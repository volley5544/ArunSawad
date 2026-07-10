// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadDataModelStruct extends FFFirebaseStruct {
  LeadDataModelStruct({
    int? total,
    List<LeadGroupModelStruct>? summary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _total = total,
        _summary = summary,
        super(firestoreUtilData);

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "summary" field.
  List<LeadGroupModelStruct>? _summary;
  List<LeadGroupModelStruct> get summary => _summary ?? const [];
  set summary(List<LeadGroupModelStruct>? val) => _summary = val;

  void updateSummary(Function(List<LeadGroupModelStruct>) updateFn) {
    updateFn(_summary ??= []);
  }

  bool hasSummary() => _summary != null;

  static LeadDataModelStruct fromMap(Map<String, dynamic> data) =>
      LeadDataModelStruct(
        total: castToType<int>(data['total']),
        summary: getStructList(
          data['summary'],
          LeadGroupModelStruct.fromMap,
        ),
      );

  static LeadDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
        'summary': _summary?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'summary': serializeParam(
          _summary,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static LeadDataModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadDataModelStruct(
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        summary: deserializeStructParam<LeadGroupModelStruct>(
          data['summary'],
          ParamType.DataStruct,
          true,
          structBuilder: LeadGroupModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LeadDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LeadDataModelStruct &&
        total == other.total &&
        listEquality.equals(summary, other.summary);
  }

  @override
  int get hashCode => const ListEquality().hash([total, summary]);
}

LeadDataModelStruct createLeadDataModelStruct({
  int? total,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadDataModelStruct(
      total: total,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadDataModelStruct? updateLeadDataModelStruct(
  LeadDataModelStruct? leadDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadDataModelStructData(
  Map<String, dynamic> firestoreData,
  LeadDataModelStruct? leadDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadDataModel == null) {
    return;
  }
  if (leadDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadDataModelData =
      getLeadDataModelFirestoreData(leadDataModel, forFieldValue);
  final nestedData =
      leadDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadDataModelFirestoreData(
  LeadDataModelStruct? leadDataModel, [
  bool forFieldValue = false,
]) {
  if (leadDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(leadDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadDataModelListFirestoreData(
  List<LeadDataModelStruct>? leadDataModels,
) =>
    leadDataModels
        ?.map((e) => getLeadDataModelFirestoreData(e, true))
        .toList() ??
    [];
