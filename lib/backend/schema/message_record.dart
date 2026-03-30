import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message_type" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  // "message_text" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "message_image" field.
  String? _messageImage;
  String get messageImage => _messageImage ?? '';
  bool hasMessageImage() => _messageImage != null;

  // "message_voice" field.
  String? _messageVoice;
  String get messageVoice => _messageVoice ?? '';
  bool hasMessageVoice() => _messageVoice != null;

  // "message_video" field.
  String? _messageVideo;
  String get messageVideo => _messageVideo ?? '';
  bool hasMessageVideo() => _messageVideo != null;

  // "user_level" field.
  String? _userLevel;
  String get userLevel => _userLevel ?? '';
  bool hasUserLevel() => _userLevel != null;

  // "user_branch_code" field.
  String? _userBranchCode;
  String get userBranchCode => _userBranchCode ?? '';
  bool hasUserBranchCode() => _userBranchCode != null;

  // "is_reply" field.
  bool? _isReply;
  bool get isReply => _isReply ?? false;
  bool hasIsReply() => _isReply != null;

  // "reply_message_ref" field.
  DocumentReference? _replyMessageRef;
  DocumentReference? get replyMessageRef => _replyMessageRef;
  bool hasReplyMessageRef() => _replyMessageRef != null;

  // "reply_message" field.
  String? _replyMessage;
  String get replyMessage => _replyMessage ?? '';
  bool hasReplyMessage() => _replyMessage != null;

  // "user_branch_name" field.
  String? _userBranchName;
  String get userBranchName => _userBranchName ?? '';
  bool hasUserBranchName() => _userBranchName != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "sender_type" field.
  String? _senderType;
  String get senderType => _senderType ?? '';
  bool hasSenderType() => _senderType != null;

  // "user_employee_id" field.
  String? _userEmployeeId;
  String get userEmployeeId => _userEmployeeId ?? '';
  bool hasUserEmployeeId() => _userEmployeeId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "message_image_blur_hash" field.
  String? _messageImageBlurHash;
  String get messageImageBlurHash => _messageImageBlurHash ?? '';
  bool hasMessageImageBlurHash() => _messageImageBlurHash != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messageType = snapshotData['message_type'] as String?;
    _messageText = snapshotData['message_text'] as String?;
    _messageImage = snapshotData['message_image'] as String?;
    _messageVoice = snapshotData['message_voice'] as String?;
    _messageVideo = snapshotData['message_video'] as String?;
    _userLevel = snapshotData['user_level'] as String?;
    _userBranchCode = snapshotData['user_branch_code'] as String?;
    _isReply = snapshotData['is_reply'] as bool?;
    _replyMessageRef = snapshotData['reply_message_ref'] as DocumentReference?;
    _replyMessage = snapshotData['reply_message'] as String?;
    _userBranchName = snapshotData['user_branch_name'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _senderType = snapshotData['sender_type'] as String?;
    _userEmployeeId = snapshotData['user_employee_id'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _messageImageBlurHash = snapshotData['message_image_blur_hash'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Message')
          : FirebaseFirestore.instance.collectionGroup('Message');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Message').doc(id);

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  String? messageType,
  String? messageText,
  String? messageImage,
  String? messageVoice,
  String? messageVideo,
  String? userLevel,
  String? userBranchCode,
  bool? isReply,
  DocumentReference? replyMessageRef,
  String? replyMessage,
  String? userBranchName,
  DateTime? time,
  String? senderType,
  String? userEmployeeId,
  String? userName,
  String? messageImageBlurHash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message_type': messageType,
      'message_text': messageText,
      'message_image': messageImage,
      'message_voice': messageVoice,
      'message_video': messageVideo,
      'user_level': userLevel,
      'user_branch_code': userBranchCode,
      'is_reply': isReply,
      'reply_message_ref': replyMessageRef,
      'reply_message': replyMessage,
      'user_branch_name': userBranchName,
      'time': time,
      'sender_type': senderType,
      'user_employee_id': userEmployeeId,
      'user_name': userName,
      'message_image_blur_hash': messageImageBlurHash,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.messageType == e2?.messageType &&
        e1?.messageText == e2?.messageText &&
        e1?.messageImage == e2?.messageImage &&
        e1?.messageVoice == e2?.messageVoice &&
        e1?.messageVideo == e2?.messageVideo &&
        e1?.userLevel == e2?.userLevel &&
        e1?.userBranchCode == e2?.userBranchCode &&
        e1?.isReply == e2?.isReply &&
        e1?.replyMessageRef == e2?.replyMessageRef &&
        e1?.replyMessage == e2?.replyMessage &&
        e1?.userBranchName == e2?.userBranchName &&
        e1?.time == e2?.time &&
        e1?.senderType == e2?.senderType &&
        e1?.userEmployeeId == e2?.userEmployeeId &&
        e1?.userName == e2?.userName &&
        e1?.messageImageBlurHash == e2?.messageImageBlurHash;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash([
        e?.messageType,
        e?.messageText,
        e?.messageImage,
        e?.messageVoice,
        e?.messageVideo,
        e?.userLevel,
        e?.userBranchCode,
        e?.isReply,
        e?.replyMessageRef,
        e?.replyMessage,
        e?.userBranchName,
        e?.time,
        e?.senderType,
        e?.userEmployeeId,
        e?.userName,
        e?.messageImageBlurHash
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
