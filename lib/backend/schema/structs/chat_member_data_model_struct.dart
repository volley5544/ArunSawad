// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMemberDataModelStruct extends FFFirebaseStruct {
  ChatMemberDataModelStruct({
    String? employeeId,
    String? name,
    String? positionName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _employeeId = employeeId,
        _name = name,
        _positionName = positionName,
        super(firestoreUtilData);

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  set employeeId(String? val) => _employeeId = val;

  bool hasEmployeeId() => _employeeId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "position_name" field.
  String? _positionName;
  String get positionName => _positionName ?? '';
  set positionName(String? val) => _positionName = val;

  bool hasPositionName() => _positionName != null;

  static ChatMemberDataModelStruct fromMap(Map<String, dynamic> data) =>
      ChatMemberDataModelStruct(
        employeeId: data['employee_id'] as String?,
        name: data['name'] as String?,
        positionName: data['position_name'] as String?,
      );

  static ChatMemberDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMemberDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'employee_id': _employeeId,
        'name': _name,
        'position_name': _positionName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'employee_id': serializeParam(
          _employeeId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'position_name': serializeParam(
          _positionName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatMemberDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChatMemberDataModelStruct(
        employeeId: deserializeParam(
          data['employee_id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        positionName: deserializeParam(
          data['position_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatMemberDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMemberDataModelStruct &&
        employeeId == other.employeeId &&
        name == other.name &&
        positionName == other.positionName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([employeeId, name, positionName]);
}

ChatMemberDataModelStruct createChatMemberDataModelStruct({
  String? employeeId,
  String? name,
  String? positionName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMemberDataModelStruct(
      employeeId: employeeId,
      name: name,
      positionName: positionName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMemberDataModelStruct? updateChatMemberDataModelStruct(
  ChatMemberDataModelStruct? chatMemberDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMemberDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMemberDataModelStructData(
  Map<String, dynamic> firestoreData,
  ChatMemberDataModelStruct? chatMemberDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMemberDataModel == null) {
    return;
  }
  if (chatMemberDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMemberDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMemberDataModelData =
      getChatMemberDataModelFirestoreData(chatMemberDataModel, forFieldValue);
  final nestedData =
      chatMemberDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      chatMemberDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMemberDataModelFirestoreData(
  ChatMemberDataModelStruct? chatMemberDataModel, [
  bool forFieldValue = false,
]) {
  if (chatMemberDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMemberDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(chatMemberDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMemberDataModelListFirestoreData(
  List<ChatMemberDataModelStruct>? chatMemberDataModels,
) =>
    chatMemberDataModels
        ?.map((e) => getChatMemberDataModelFirestoreData(e, true))
        .toList() ??
    [];
