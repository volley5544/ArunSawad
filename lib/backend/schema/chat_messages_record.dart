import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message_by" field.
  DocumentReference? _messageBy;
  DocumentReference? get messageBy => _messageBy;
  bool hasMessageBy() => _messageBy != null;

  // "message_by_employee_id" field.
  String? _messageByEmployeeId;
  String get messageByEmployeeId => _messageByEmployeeId ?? '';
  bool hasMessageByEmployeeId() => _messageByEmployeeId != null;

  // "message_text" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "message_type" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  // "message_time" field.
  DateTime? _messageTime;
  DateTime? get messageTime => _messageTime;
  bool hasMessageTime() => _messageTime != null;

  // "message_image_url" field.
  String? _messageImageUrl;
  String get messageImageUrl => _messageImageUrl ?? '';
  bool hasMessageImageUrl() => _messageImageUrl != null;

  // "message_audio_url" field.
  String? _messageAudioUrl;
  String get messageAudioUrl => _messageAudioUrl ?? '';
  bool hasMessageAudioUrl() => _messageAudioUrl != null;

  // "message_video_url" field.
  String? _messageVideoUrl;
  String get messageVideoUrl => _messageVideoUrl ?? '';
  bool hasMessageVideoUrl() => _messageVideoUrl != null;

  // "message_by_display_url" field.
  String? _messageByDisplayUrl;
  String get messageByDisplayUrl => _messageByDisplayUrl ?? '';
  bool hasMessageByDisplayUrl() => _messageByDisplayUrl != null;

  // "message_by_name" field.
  String? _messageByName;
  String get messageByName => _messageByName ?? '';
  bool hasMessageByName() => _messageByName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messageBy = snapshotData['message_by'] as DocumentReference?;
    _messageByEmployeeId = snapshotData['message_by_employee_id'] as String?;
    _messageText = snapshotData['message_text'] as String?;
    _messageType = snapshotData['message_type'] as String?;
    _messageTime = snapshotData['message_time'] as DateTime?;
    _messageImageUrl = snapshotData['message_image_url'] as String?;
    _messageAudioUrl = snapshotData['message_audio_url'] as String?;
    _messageVideoUrl = snapshotData['message_video_url'] as String?;
    _messageByDisplayUrl = snapshotData['message_by_display_url'] as String?;
    _messageByName = snapshotData['message_by_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ChatMessages')
          : FirebaseFirestore.instance.collectionGroup('ChatMessages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ChatMessages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  DocumentReference? messageBy,
  String? messageByEmployeeId,
  String? messageText,
  String? messageType,
  DateTime? messageTime,
  String? messageImageUrl,
  String? messageAudioUrl,
  String? messageVideoUrl,
  String? messageByDisplayUrl,
  String? messageByName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message_by': messageBy,
      'message_by_employee_id': messageByEmployeeId,
      'message_text': messageText,
      'message_type': messageType,
      'message_time': messageTime,
      'message_image_url': messageImageUrl,
      'message_audio_url': messageAudioUrl,
      'message_video_url': messageVideoUrl,
      'message_by_display_url': messageByDisplayUrl,
      'message_by_name': messageByName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.messageBy == e2?.messageBy &&
        e1?.messageByEmployeeId == e2?.messageByEmployeeId &&
        e1?.messageText == e2?.messageText &&
        e1?.messageType == e2?.messageType &&
        e1?.messageTime == e2?.messageTime &&
        e1?.messageImageUrl == e2?.messageImageUrl &&
        e1?.messageAudioUrl == e2?.messageAudioUrl &&
        e1?.messageVideoUrl == e2?.messageVideoUrl &&
        e1?.messageByDisplayUrl == e2?.messageByDisplayUrl &&
        e1?.messageByName == e2?.messageByName;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.messageBy,
        e?.messageByEmployeeId,
        e?.messageText,
        e?.messageType,
        e?.messageTime,
        e?.messageImageUrl,
        e?.messageAudioUrl,
        e?.messageVideoUrl,
        e?.messageByDisplayUrl,
        e?.messageByName
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
