// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRoomDataModelStruct extends FFFirebaseStruct {
  ChatRoomDataModelStruct({
    List<String>? usersEmplayeeId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usersEmplayeeId = usersEmplayeeId,
        super(firestoreUtilData);

  // "users_emplayee_id" field.
  List<String>? _usersEmplayeeId;
  List<String> get usersEmplayeeId => _usersEmplayeeId ?? const [];
  set usersEmplayeeId(List<String>? val) => _usersEmplayeeId = val;

  void updateUsersEmplayeeId(Function(List<String>) updateFn) {
    updateFn(_usersEmplayeeId ??= []);
  }

  bool hasUsersEmplayeeId() => _usersEmplayeeId != null;

  static ChatRoomDataModelStruct fromMap(Map<String, dynamic> data) =>
      ChatRoomDataModelStruct(
        usersEmplayeeId: getDataList(data['users_emplayee_id']),
      );

  static ChatRoomDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatRoomDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'users_emplayee_id': _usersEmplayeeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'users_emplayee_id': serializeParam(
          _usersEmplayeeId,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ChatRoomDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChatRoomDataModelStruct(
        usersEmplayeeId: deserializeParam<String>(
          data['users_emplayee_id'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ChatRoomDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatRoomDataModelStruct &&
        listEquality.equals(usersEmplayeeId, other.usersEmplayeeId);
  }

  @override
  int get hashCode => const ListEquality().hash([usersEmplayeeId]);
}

ChatRoomDataModelStruct createChatRoomDataModelStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatRoomDataModelStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatRoomDataModelStruct? updateChatRoomDataModelStruct(
  ChatRoomDataModelStruct? chatRoomDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatRoomDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatRoomDataModelStructData(
  Map<String, dynamic> firestoreData,
  ChatRoomDataModelStruct? chatRoomDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatRoomDataModel == null) {
    return;
  }
  if (chatRoomDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatRoomDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatRoomDataModelData =
      getChatRoomDataModelFirestoreData(chatRoomDataModel, forFieldValue);
  final nestedData =
      chatRoomDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatRoomDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatRoomDataModelFirestoreData(
  ChatRoomDataModelStruct? chatRoomDataModel, [
  bool forFieldValue = false,
]) {
  if (chatRoomDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatRoomDataModel.toMap());

  // Add any Firestore field values
  chatRoomDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatRoomDataModelListFirestoreData(
  List<ChatRoomDataModelStruct>? chatRoomDataModels,
) =>
    chatRoomDataModels
        ?.map((e) => getChatRoomDataModelFirestoreData(e, true))
        .toList() ??
    [];
