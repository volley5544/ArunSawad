import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkFollowUpChatRoomRecord extends FirestoreRecord {
  WorkFollowUpChatRoomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "room_name" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  bool hasRoomName() => _roomName != null;

  // "room_display_image" field.
  String? _roomDisplayImage;
  String get roomDisplayImage => _roomDisplayImage ?? '';
  bool hasRoomDisplayImage() => _roomDisplayImage != null;

  // "room_display_blur_hash" field.
  String? _roomDisplayBlurHash;
  String get roomDisplayBlurHash => _roomDisplayBlurHash ?? '';
  bool hasRoomDisplayBlurHash() => _roomDisplayBlurHash != null;

  // "region_code" field.
  String? _regionCode;
  String get regionCode => _regionCode ?? '';
  bool hasRegionCode() => _regionCode != null;

  // "max_showing_message" field.
  int? _maxShowingMessage;
  int get maxShowingMessage => _maxShowingMessage ?? 0;
  bool hasMaxShowingMessage() => _maxShowingMessage != null;

  // "work_system_name" field.
  String? _workSystemName;
  String get workSystemName => _workSystemName ?? '';
  bool hasWorkSystemName() => _workSystemName != null;

  // "extra_member" field.
  List<ChatMemberDataModelStruct>? _extraMember;
  List<ChatMemberDataModelStruct> get extraMember => _extraMember ?? const [];
  bool hasExtraMember() => _extraMember != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_by" field.
  String? _lastMessageBy;
  String get lastMessageBy => _lastMessageBy ?? '';
  bool hasLastMessageBy() => _lastMessageBy != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  void _initializeFields() {
    _roomName = snapshotData['room_name'] as String?;
    _roomDisplayImage = snapshotData['room_display_image'] as String?;
    _roomDisplayBlurHash = snapshotData['room_display_blur_hash'] as String?;
    _regionCode = snapshotData['region_code'] as String?;
    _maxShowingMessage = castToType<int>(snapshotData['max_showing_message']);
    _workSystemName = snapshotData['work_system_name'] as String?;
    _extraMember = getStructList(
      snapshotData['extra_member'],
      ChatMemberDataModelStruct.fromMap,
    );
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageBy = snapshotData['last_message_by'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('WorkFollowUpChatRoom');

  static Stream<WorkFollowUpChatRoomRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => WorkFollowUpChatRoomRecord.fromSnapshot(s));

  static Future<WorkFollowUpChatRoomRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkFollowUpChatRoomRecord.fromSnapshot(s));

  static WorkFollowUpChatRoomRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkFollowUpChatRoomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkFollowUpChatRoomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkFollowUpChatRoomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkFollowUpChatRoomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkFollowUpChatRoomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkFollowUpChatRoomRecordData({
  String? roomName,
  String? roomDisplayImage,
  String? roomDisplayBlurHash,
  String? regionCode,
  int? maxShowingMessage,
  String? workSystemName,
  String? lastMessage,
  String? lastMessageBy,
  DateTime? lastMessageTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'room_name': roomName,
      'room_display_image': roomDisplayImage,
      'room_display_blur_hash': roomDisplayBlurHash,
      'region_code': regionCode,
      'max_showing_message': maxShowingMessage,
      'work_system_name': workSystemName,
      'last_message': lastMessage,
      'last_message_by': lastMessageBy,
      'last_message_time': lastMessageTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkFollowUpChatRoomRecordDocumentEquality
    implements Equality<WorkFollowUpChatRoomRecord> {
  const WorkFollowUpChatRoomRecordDocumentEquality();

  @override
  bool equals(WorkFollowUpChatRoomRecord? e1, WorkFollowUpChatRoomRecord? e2) {
    const listEquality = ListEquality();
    return e1?.roomName == e2?.roomName &&
        e1?.roomDisplayImage == e2?.roomDisplayImage &&
        e1?.roomDisplayBlurHash == e2?.roomDisplayBlurHash &&
        e1?.regionCode == e2?.regionCode &&
        e1?.maxShowingMessage == e2?.maxShowingMessage &&
        e1?.workSystemName == e2?.workSystemName &&
        listEquality.equals(e1?.extraMember, e2?.extraMember) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageBy == e2?.lastMessageBy &&
        e1?.lastMessageTime == e2?.lastMessageTime;
  }

  @override
  int hash(WorkFollowUpChatRoomRecord? e) => const ListEquality().hash([
        e?.roomName,
        e?.roomDisplayImage,
        e?.roomDisplayBlurHash,
        e?.regionCode,
        e?.maxShowingMessage,
        e?.workSystemName,
        e?.extraMember,
        e?.lastMessage,
        e?.lastMessageBy,
        e?.lastMessageTime
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkFollowUpChatRoomRecord;
}
