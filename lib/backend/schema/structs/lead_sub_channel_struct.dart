// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadSubChannelStruct extends FFFirebaseStruct {
  LeadSubChannelStruct({
    String? typeOfLeads,
    int? count,
    int? percentage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _typeOfLeads = typeOfLeads,
        _count = count,
        _percentage = percentage,
        super(firestoreUtilData);

  // "type_of_leads" field.
  String? _typeOfLeads;
  String get typeOfLeads => _typeOfLeads ?? '';
  set typeOfLeads(String? val) => _typeOfLeads = val;

  bool hasTypeOfLeads() => _typeOfLeads != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "percentage" field.
  int? _percentage;
  int get percentage => _percentage ?? 0;
  set percentage(int? val) => _percentage = val;

  void incrementPercentage(int amount) => percentage = percentage + amount;

  bool hasPercentage() => _percentage != null;

  static LeadSubChannelStruct fromMap(Map<String, dynamic> data) =>
      LeadSubChannelStruct(
        typeOfLeads: data['type_of_leads'] as String?,
        count: castToType<int>(data['count']),
        percentage: castToType<int>(data['percentage']),
      );

  static LeadSubChannelStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadSubChannelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type_of_leads': _typeOfLeads,
        'count': _count,
        'percentage': _percentage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type_of_leads': serializeParam(
          _typeOfLeads,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'percentage': serializeParam(
          _percentage,
          ParamType.int,
        ),
      }.withoutNulls;

  static LeadSubChannelStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadSubChannelStruct(
        typeOfLeads: deserializeParam(
          data['type_of_leads'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        percentage: deserializeParam(
          data['percentage'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LeadSubChannelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadSubChannelStruct &&
        typeOfLeads == other.typeOfLeads &&
        count == other.count &&
        percentage == other.percentage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([typeOfLeads, count, percentage]);
}

LeadSubChannelStruct createLeadSubChannelStruct({
  String? typeOfLeads,
  int? count,
  int? percentage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadSubChannelStruct(
      typeOfLeads: typeOfLeads,
      count: count,
      percentage: percentage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadSubChannelStruct? updateLeadSubChannelStruct(
  LeadSubChannelStruct? leadSubChannel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadSubChannel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadSubChannelStructData(
  Map<String, dynamic> firestoreData,
  LeadSubChannelStruct? leadSubChannel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadSubChannel == null) {
    return;
  }
  if (leadSubChannel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadSubChannel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadSubChannelData =
      getLeadSubChannelFirestoreData(leadSubChannel, forFieldValue);
  final nestedData =
      leadSubChannelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadSubChannel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadSubChannelFirestoreData(
  LeadSubChannelStruct? leadSubChannel, [
  bool forFieldValue = false,
]) {
  if (leadSubChannel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadSubChannel.toMap());

  // Add any Firestore field values
  mapToFirestore(leadSubChannel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadSubChannelListFirestoreData(
  List<LeadSubChannelStruct>? leadSubChannels,
) =>
    leadSubChannels
        ?.map((e) => getLeadSubChannelFirestoreData(e, true))
        .toList() ??
    [];
