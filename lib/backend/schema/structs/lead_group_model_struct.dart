// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadGroupModelStruct extends FFFirebaseStruct {
  LeadGroupModelStruct({
    String? leadGroup,
    int? total,
    int? percentage,
    List<LeadSubChannelStruct>? types,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _leadGroup = leadGroup,
        _total = total,
        _percentage = percentage,
        _types = types,
        super(firestoreUtilData);

  // "lead_group" field.
  String? _leadGroup;
  String get leadGroup => _leadGroup ?? '';
  set leadGroup(String? val) => _leadGroup = val;

  bool hasLeadGroup() => _leadGroup != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "percentage" field.
  int? _percentage;
  int get percentage => _percentage ?? 0;
  set percentage(int? val) => _percentage = val;

  void incrementPercentage(int amount) => percentage = percentage + amount;

  bool hasPercentage() => _percentage != null;

  // "types" field.
  List<LeadSubChannelStruct>? _types;
  List<LeadSubChannelStruct> get types => _types ?? const [];
  set types(List<LeadSubChannelStruct>? val) => _types = val;

  void updateTypes(Function(List<LeadSubChannelStruct>) updateFn) {
    updateFn(_types ??= []);
  }

  bool hasTypes() => _types != null;

  static LeadGroupModelStruct fromMap(Map<String, dynamic> data) =>
      LeadGroupModelStruct(
        leadGroup: data['lead_group'] as String?,
        total: castToType<int>(data['total']),
        percentage: castToType<int>(data['percentage']),
        types: getStructList(
          data['types'],
          LeadSubChannelStruct.fromMap,
        ),
      );

  static LeadGroupModelStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadGroupModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lead_group': _leadGroup,
        'total': _total,
        'percentage': _percentage,
        'types': _types?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lead_group': serializeParam(
          _leadGroup,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'percentage': serializeParam(
          _percentage,
          ParamType.int,
        ),
        'types': serializeParam(
          _types,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static LeadGroupModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadGroupModelStruct(
        leadGroup: deserializeParam(
          data['lead_group'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        percentage: deserializeParam(
          data['percentage'],
          ParamType.int,
          false,
        ),
        types: deserializeStructParam<LeadSubChannelStruct>(
          data['types'],
          ParamType.DataStruct,
          true,
          structBuilder: LeadSubChannelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LeadGroupModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LeadGroupModelStruct &&
        leadGroup == other.leadGroup &&
        total == other.total &&
        percentage == other.percentage &&
        listEquality.equals(types, other.types);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([leadGroup, total, percentage, types]);
}

LeadGroupModelStruct createLeadGroupModelStruct({
  String? leadGroup,
  int? total,
  int? percentage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadGroupModelStruct(
      leadGroup: leadGroup,
      total: total,
      percentage: percentage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadGroupModelStruct? updateLeadGroupModelStruct(
  LeadGroupModelStruct? leadGroupModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadGroupModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadGroupModelStructData(
  Map<String, dynamic> firestoreData,
  LeadGroupModelStruct? leadGroupModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadGroupModel == null) {
    return;
  }
  if (leadGroupModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadGroupModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadGroupModelData =
      getLeadGroupModelFirestoreData(leadGroupModel, forFieldValue);
  final nestedData =
      leadGroupModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadGroupModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadGroupModelFirestoreData(
  LeadGroupModelStruct? leadGroupModel, [
  bool forFieldValue = false,
]) {
  if (leadGroupModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadGroupModel.toMap());

  // Add any Firestore field values
  mapToFirestore(leadGroupModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadGroupModelListFirestoreData(
  List<LeadGroupModelStruct>? leadGroupModels,
) =>
    leadGroupModels
        ?.map((e) => getLeadGroupModelFirestoreData(e, true))
        .toList() ??
    [];
