import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "last_message_sent_by" field.
  DocumentReference? _lastMessageSentBy;
  DocumentReference? get lastMessageSentBy => _lastMessageSentBy;
  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "last_message_seen_by" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "user_a_name" field.
  String? _userAName;
  String get userAName => _userAName ?? '';
  bool hasUserAName() => _userAName != null;

  // "user_a_nickname" field.
  String? _userANickname;
  String get userANickname => _userANickname ?? '';
  bool hasUserANickname() => _userANickname != null;

  // "user_b_name" field.
  String? _userBName;
  String get userBName => _userBName ?? '';
  bool hasUserBName() => _userBName != null;

  // "user_b_nickname" field.
  String? _userBNickname;
  String get userBNickname => _userBNickname ?? '';
  bool hasUserBNickname() => _userBNickname != null;

  // "user_a_employee_id" field.
  String? _userAEmployeeId;
  String get userAEmployeeId => _userAEmployeeId ?? '';
  bool hasUserAEmployeeId() => _userAEmployeeId != null;

  // "user_b_employee_id" field.
  String? _userBEmployeeId;
  String get userBEmployeeId => _userBEmployeeId ?? '';
  bool hasUserBEmployeeId() => _userBEmployeeId != null;

  // "user_a_profile_image" field.
  String? _userAProfileImage;
  String get userAProfileImage => _userAProfileImage ?? '';
  bool hasUserAProfileImage() => _userAProfileImage != null;

  // "user_b_profile_image" field.
  String? _userBProfileImage;
  String get userBProfileImage => _userBProfileImage ?? '';
  bool hasUserBProfileImage() => _userBProfileImage != null;

  void _initializeFields() {
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _users = getDataList(snapshotData['users']);
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _lastMessageSentBy =
        snapshotData['last_message_sent_by'] as DocumentReference?;
    _lastMessageSeenBy = getDataList(snapshotData['last_message_seen_by']);
    _userAName = snapshotData['user_a_name'] as String?;
    _userANickname = snapshotData['user_a_nickname'] as String?;
    _userBName = snapshotData['user_b_name'] as String?;
    _userBNickname = snapshotData['user_b_nickname'] as String?;
    _userAEmployeeId = snapshotData['user_a_employee_id'] as String?;
    _userBEmployeeId = snapshotData['user_b_employee_id'] as String?;
    _userAProfileImage = snapshotData['user_a_profile_image'] as String?;
    _userBProfileImage = snapshotData['user_b_profile_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? userA,
  DocumentReference? userB,
  DocumentReference? lastMessageSentBy,
  String? userAName,
  String? userANickname,
  String? userBName,
  String? userBNickname,
  String? userAEmployeeId,
  String? userBEmployeeId,
  String? userAProfileImage,
  String? userBProfileImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'user_a': userA,
      'user_b': userB,
      'last_message_sent_by': lastMessageSentBy,
      'user_a_name': userAName,
      'user_a_nickname': userANickname,
      'user_b_name': userBName,
      'user_b_nickname': userBNickname,
      'user_a_employee_id': userAEmployeeId,
      'user_b_employee_id': userBEmployeeId,
      'user_a_profile_image': userAProfileImage,
      'user_b_profile_image': userBProfileImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        e1?.lastMessageSentBy == e2?.lastMessageSentBy &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy) &&
        e1?.userAName == e2?.userAName &&
        e1?.userANickname == e2?.userANickname &&
        e1?.userBName == e2?.userBName &&
        e1?.userBNickname == e2?.userBNickname &&
        e1?.userAEmployeeId == e2?.userAEmployeeId &&
        e1?.userBEmployeeId == e2?.userBEmployeeId &&
        e1?.userAProfileImage == e2?.userAProfileImage &&
        e1?.userBProfileImage == e2?.userBProfileImage;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.users,
        e?.userA,
        e?.userB,
        e?.lastMessageSentBy,
        e?.lastMessageSeenBy,
        e?.userAName,
        e?.userANickname,
        e?.userBName,
        e?.userBNickname,
        e?.userAEmployeeId,
        e?.userBEmployeeId,
        e?.userAProfileImage,
        e?.userBProfileImage
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
