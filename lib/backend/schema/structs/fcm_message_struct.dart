// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FcmMessageStruct extends FFFirebaseStruct {
  FcmMessageStruct({
    String? token,
    NotificationStruct? notification,
    DataStruct? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _token = token,
        _notification = notification,
        _data = data,
        super(firestoreUtilData);

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "notification" field.
  NotificationStruct? _notification;
  NotificationStruct get notification => _notification ?? NotificationStruct();
  set notification(NotificationStruct? val) => _notification = val;

  void updateNotification(Function(NotificationStruct) updateFn) {
    updateFn(_notification ??= NotificationStruct());
  }

  bool hasNotification() => _notification != null;

  // "data" field.
  DataStruct? _data;
  DataStruct get data => _data ?? DataStruct();
  set data(DataStruct? val) => _data = val;

  void updateData(Function(DataStruct) updateFn) {
    updateFn(_data ??= DataStruct());
  }

  bool hasData() => _data != null;

  static FcmMessageStruct fromMap(Map<String, dynamic> data) =>
      FcmMessageStruct(
        token: data['token'] as String?,
        notification: data['notification'] is NotificationStruct
            ? data['notification']
            : NotificationStruct.maybeFromMap(data['notification']),
        data: data['data'] is DataStruct
            ? data['data']
            : DataStruct.maybeFromMap(data['data']),
      );

  static FcmMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? FcmMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
        'notification': _notification?.toMap(),
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'notification': serializeParam(
          _notification,
          ParamType.DataStruct,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FcmMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      FcmMessageStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        notification: deserializeStructParam(
          data['notification'],
          ParamType.DataStruct,
          false,
          structBuilder: NotificationStruct.fromSerializableMap,
        ),
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FcmMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FcmMessageStruct &&
        token == other.token &&
        notification == other.notification &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([token, notification, data]);
}

FcmMessageStruct createFcmMessageStruct({
  String? token,
  NotificationStruct? notification,
  DataStruct? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FcmMessageStruct(
      token: token,
      notification:
          notification ?? (clearUnsetFields ? NotificationStruct() : null),
      data: data ?? (clearUnsetFields ? DataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FcmMessageStruct? updateFcmMessageStruct(
  FcmMessageStruct? fcmMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fcmMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFcmMessageStructData(
  Map<String, dynamic> firestoreData,
  FcmMessageStruct? fcmMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fcmMessage == null) {
    return;
  }
  if (fcmMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fcmMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fcmMessageData = getFcmMessageFirestoreData(fcmMessage, forFieldValue);
  final nestedData = fcmMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fcmMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFcmMessageFirestoreData(
  FcmMessageStruct? fcmMessage, [
  bool forFieldValue = false,
]) {
  if (fcmMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fcmMessage.toMap());

  // Handle nested data for "notification" field.
  addNotificationStructData(
    firestoreData,
    fcmMessage.hasNotification() ? fcmMessage.notification : null,
    'notification',
    forFieldValue,
  );

  // Handle nested data for "data" field.
  addDataStructData(
    firestoreData,
    fcmMessage.hasData() ? fcmMessage.data : null,
    'data',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(fcmMessage.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFcmMessageListFirestoreData(
  List<FcmMessageStruct>? fcmMessages,
) =>
    fcmMessages?.map((e) => getFcmMessageFirestoreData(e, true)).toList() ?? [];
