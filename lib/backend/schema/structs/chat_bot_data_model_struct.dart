// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatBotDataModelStruct extends FFFirebaseStruct {
  ChatBotDataModelStruct({
    DateTime? createdTime,
    String? messageText,
    String? messageType,
    String? messageImage,
    String? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdTime = createdTime,
        _messageText = messageText,
        _messageType = messageType,
        _messageImage = messageImage,
        _role = role,
        super(firestoreUtilData);

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  set messageText(String? val) => _messageText = val;

  bool hasMessageText() => _messageText != null;

  // "messageType" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  set messageType(String? val) => _messageType = val;

  bool hasMessageType() => _messageType != null;

  // "messageImage" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  set messageImage(String? val) => _messageImage = val;

  bool hasMessageImage() => _messageImage != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  static ChatBotDataModelStruct fromMap(Map<String, dynamic> data) =>
      ChatBotDataModelStruct(
        createdTime: data['createdTime'] as DateTime?,
        messageText: data['messageText'] as String?,
        messageType: data['messageType'] as String?,
        messageImage: data['messageImage'] as String?,
        role: data['role'] as String?,
      );

  static ChatBotDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatBotDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'createdTime': _createdTime,
        'messageText': _messageText,
        'messageType': _messageType,
        'messageImage': _messageImage,
        'role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'createdTime': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'messageText': serializeParam(
          _messageText,
          ParamType.String,
        ),
        'messageType': serializeParam(
          _messageType,
          ParamType.String,
        ),
        'messageImage': serializeParam(
          _messageImage,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatBotDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChatBotDataModelStruct(
        createdTime: deserializeParam(
          data['createdTime'],
          ParamType.DateTime,
          false,
        ),
        messageText: deserializeParam(
          data['messageText'],
          ParamType.String,
          false,
        ),
        messageType: deserializeParam(
          data['messageType'],
          ParamType.String,
          false,
        ),
        messageImage: deserializeParam(
          data['messageImage'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatBotDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatBotDataModelStruct &&
        createdTime == other.createdTime &&
        messageText == other.messageText &&
        messageType == other.messageType &&
        messageImage == other.messageImage &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([createdTime, messageText, messageType, messageImage, role]);
}

ChatBotDataModelStruct createChatBotDataModelStruct({
  DateTime? createdTime,
  String? messageText,
  String? messageType,
  String? messageImage,
  String? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatBotDataModelStruct(
      createdTime: createdTime,
      messageText: messageText,
      messageType: messageType,
      messageImage: messageImage,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatBotDataModelStruct? updateChatBotDataModelStruct(
  ChatBotDataModelStruct? chatBotDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatBotDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatBotDataModelStructData(
  Map<String, dynamic> firestoreData,
  ChatBotDataModelStruct? chatBotDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatBotDataModel == null) {
    return;
  }
  if (chatBotDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatBotDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatBotDataModelData =
      getChatBotDataModelFirestoreData(chatBotDataModel, forFieldValue);
  final nestedData =
      chatBotDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatBotDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatBotDataModelFirestoreData(
  ChatBotDataModelStruct? chatBotDataModel, [
  bool forFieldValue = false,
]) {
  if (chatBotDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatBotDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(chatBotDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatBotDataModelListFirestoreData(
  List<ChatBotDataModelStruct>? chatBotDataModels,
) =>
    chatBotDataModels
        ?.map((e) => getChatBotDataModelFirestoreData(e, true))
        .toList() ??
    [];
