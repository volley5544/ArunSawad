import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SawadChatRoomRecord extends FirestoreRecord {
  SawadChatRoomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "users_ref" field.
  List<DocumentReference>? _usersRef;
  List<DocumentReference> get usersRef => _usersRef ?? const [];
  bool hasUsersRef() => _usersRef != null;

  // "users_emplayee_id" field.
  List<String>? _usersEmplayeeId;
  List<String> get usersEmplayeeId => _usersEmplayeeId ?? const [];
  bool hasUsersEmplayeeId() => _usersEmplayeeId != null;

  // "last_seen_users_ref" field.
  List<DocumentReference>? _lastSeenUsersRef;
  List<DocumentReference> get lastSeenUsersRef => _lastSeenUsersRef ?? const [];
  bool hasLastSeenUsersRef() => _lastSeenUsersRef != null;

  // "last_message_text" field.
  String? _lastMessageText;
  String get lastMessageText => _lastMessageText ?? '';
  bool hasLastMessageText() => _lastMessageText != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_by" field.
  DocumentReference? _lastMessageBy;
  DocumentReference? get lastMessageBy => _lastMessageBy;
  bool hasLastMessageBy() => _lastMessageBy != null;

  // "last_message_by_employee_id" field.
  String? _lastMessageByEmployeeId;
  String get lastMessageByEmployeeId => _lastMessageByEmployeeId ?? '';
  bool hasLastMessageByEmployeeId() => _lastMessageByEmployeeId != null;

  // "last_message_type" field.
  String? _lastMessageType;
  String get lastMessageType => _lastMessageType ?? '';
  bool hasLastMessageType() => _lastMessageType != null;

  // "chat_room_name" field.
  String? _chatRoomName;
  String get chatRoomName => _chatRoomName ?? '';
  bool hasChatRoomName() => _chatRoomName != null;

  // "chat_room_type" field.
  String? _chatRoomType;
  String get chatRoomType => _chatRoomType ?? '';
  bool hasChatRoomType() => _chatRoomType != null;

  // "chat_room_display_image_url" field.
  String? _chatRoomDisplayImageUrl;
  String get chatRoomDisplayImageUrl => _chatRoomDisplayImageUrl ?? '';
  bool hasChatRoomDisplayImageUrl() => _chatRoomDisplayImageUrl != null;

  // "users_name" field.
  List<String>? _usersName;
  List<String> get usersName => _usersName ?? const [];
  bool hasUsersName() => _usersName != null;

  // "users_display_image" field.
  List<String>? _usersDisplayImage;
  List<String> get usersDisplayImage => _usersDisplayImage ?? const [];
  bool hasUsersDisplayImage() => _usersDisplayImage != null;

  // "users_display_image_blur_hash" field.
  List<String>? _usersDisplayImageBlurHash;
  List<String> get usersDisplayImageBlurHash =>
      _usersDisplayImageBlurHash ?? const [];
  bool hasUsersDisplayImageBlurHash() => _usersDisplayImageBlurHash != null;

  // "chat_room_display_image_blur_hash" field.
  String? _chatRoomDisplayImageBlurHash;
  String get chatRoomDisplayImageBlurHash =>
      _chatRoomDisplayImageBlurHash ?? '';
  bool hasChatRoomDisplayImageBlurHash() =>
      _chatRoomDisplayImageBlurHash != null;

  void _initializeFields() {
    _usersRef = getDataList(snapshotData['users_ref']);
    _usersEmplayeeId = getDataList(snapshotData['users_emplayee_id']);
    _lastSeenUsersRef = getDataList(snapshotData['last_seen_users_ref']);
    _lastMessageText = snapshotData['last_message_text'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _lastMessageBy = snapshotData['last_message_by'] as DocumentReference?;
    _lastMessageByEmployeeId =
        snapshotData['last_message_by_employee_id'] as String?;
    _lastMessageType = snapshotData['last_message_type'] as String?;
    _chatRoomName = snapshotData['chat_room_name'] as String?;
    _chatRoomType = snapshotData['chat_room_type'] as String?;
    _chatRoomDisplayImageUrl =
        snapshotData['chat_room_display_image_url'] as String?;
    _usersName = getDataList(snapshotData['users_name']);
    _usersDisplayImage = getDataList(snapshotData['users_display_image']);
    _usersDisplayImageBlurHash =
        getDataList(snapshotData['users_display_image_blur_hash']);
    _chatRoomDisplayImageBlurHash =
        snapshotData['chat_room_display_image_blur_hash'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SawadChatRoom');

  static Stream<SawadChatRoomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SawadChatRoomRecord.fromSnapshot(s));

  static Future<SawadChatRoomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SawadChatRoomRecord.fromSnapshot(s));

  static SawadChatRoomRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SawadChatRoomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SawadChatRoomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SawadChatRoomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SawadChatRoomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SawadChatRoomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSawadChatRoomRecordData({
  String? lastMessageText,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageBy,
  String? lastMessageByEmployeeId,
  String? lastMessageType,
  String? chatRoomName,
  String? chatRoomType,
  String? chatRoomDisplayImageUrl,
  String? chatRoomDisplayImageBlurHash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message_text': lastMessageText,
      'last_message_time': lastMessageTime,
      'last_message_by': lastMessageBy,
      'last_message_by_employee_id': lastMessageByEmployeeId,
      'last_message_type': lastMessageType,
      'chat_room_name': chatRoomName,
      'chat_room_type': chatRoomType,
      'chat_room_display_image_url': chatRoomDisplayImageUrl,
      'chat_room_display_image_blur_hash': chatRoomDisplayImageBlurHash,
    }.withoutNulls,
  );

  return firestoreData;
}

class SawadChatRoomRecordDocumentEquality
    implements Equality<SawadChatRoomRecord> {
  const SawadChatRoomRecordDocumentEquality();

  @override
  bool equals(SawadChatRoomRecord? e1, SawadChatRoomRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.usersRef, e2?.usersRef) &&
        listEquality.equals(e1?.usersEmplayeeId, e2?.usersEmplayeeId) &&
        listEquality.equals(e1?.lastSeenUsersRef, e2?.lastSeenUsersRef) &&
        e1?.lastMessageText == e2?.lastMessageText &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.lastMessageBy == e2?.lastMessageBy &&
        e1?.lastMessageByEmployeeId == e2?.lastMessageByEmployeeId &&
        e1?.lastMessageType == e2?.lastMessageType &&
        e1?.chatRoomName == e2?.chatRoomName &&
        e1?.chatRoomType == e2?.chatRoomType &&
        e1?.chatRoomDisplayImageUrl == e2?.chatRoomDisplayImageUrl &&
        listEquality.equals(e1?.usersName, e2?.usersName) &&
        listEquality.equals(e1?.usersDisplayImage, e2?.usersDisplayImage) &&
        listEquality.equals(
            e1?.usersDisplayImageBlurHash, e2?.usersDisplayImageBlurHash) &&
        e1?.chatRoomDisplayImageBlurHash == e2?.chatRoomDisplayImageBlurHash;
  }

  @override
  int hash(SawadChatRoomRecord? e) => const ListEquality().hash([
        e?.usersRef,
        e?.usersEmplayeeId,
        e?.lastSeenUsersRef,
        e?.lastMessageText,
        e?.lastMessageTime,
        e?.lastMessageBy,
        e?.lastMessageByEmployeeId,
        e?.lastMessageType,
        e?.chatRoomName,
        e?.chatRoomType,
        e?.chatRoomDisplayImageUrl,
        e?.usersName,
        e?.usersDisplayImage,
        e?.usersDisplayImageBlurHash,
        e?.chatRoomDisplayImageBlurHash
      ]);

  @override
  bool isValidKey(Object? o) => o is SawadChatRoomRecord;
}
