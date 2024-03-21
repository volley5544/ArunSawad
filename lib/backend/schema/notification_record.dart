import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "noti_time" field.
  DateTime? _notiTime;
  DateTime? get notiTime => _notiTime;
  bool hasNotiTime() => _notiTime != null;

  // "noti_title" field.
  String? _notiTitle;
  String get notiTitle => _notiTitle ?? '';
  bool hasNotiTitle() => _notiTitle != null;

  // "noti_body" field.
  String? _notiBody;
  String get notiBody => _notiBody ?? '';
  bool hasNotiBody() => _notiBody != null;

  // "noti_is_read" field.
  bool? _notiIsRead;
  bool get notiIsRead => _notiIsRead ?? false;
  bool hasNotiIsRead() => _notiIsRead != null;

  // "this_noti_is_read" field.
  bool? _thisNotiIsRead;
  bool get thisNotiIsRead => _thisNotiIsRead ?? false;
  bool hasThisNotiIsRead() => _thisNotiIsRead != null;

  // "noti_type" field.
  String? _notiType;
  String get notiType => _notiType ?? '';
  bool hasNotiType() => _notiType != null;

  // "license_type" field.
  List<String>? _licenseType;
  List<String> get licenseType => _licenseType ?? const [];
  bool hasLicenseType() => _licenseType != null;

  // "noti_is_sent" field.
  List<bool>? _notiIsSent;
  List<bool> get notiIsSent => _notiIsSent ?? const [];
  bool hasNotiIsSent() => _notiIsSent != null;

  // "insu_exp_date" field.
  List<DateTime>? _insuExpDate;
  List<DateTime> get insuExpDate => _insuExpDate ?? const [];
  bool hasInsuExpDate() => _insuExpDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notiTime = snapshotData['noti_time'] as DateTime?;
    _notiTitle = snapshotData['noti_title'] as String?;
    _notiBody = snapshotData['noti_body'] as String?;
    _notiIsRead = snapshotData['noti_is_read'] as bool?;
    _thisNotiIsRead = snapshotData['this_noti_is_read'] as bool?;
    _notiType = snapshotData['noti_type'] as String?;
    _licenseType = getDataList(snapshotData['license_type']);
    _notiIsSent = getDataList(snapshotData['noti_is_sent']);
    _insuExpDate = getDataList(snapshotData['insu_exp_date']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notification')
          : FirebaseFirestore.instance.collectionGroup('notification');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notification').doc(id);

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DateTime? notiTime,
  String? notiTitle,
  String? notiBody,
  bool? notiIsRead,
  bool? thisNotiIsRead,
  String? notiType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'noti_time': notiTime,
      'noti_title': notiTitle,
      'noti_body': notiBody,
      'noti_is_read': notiIsRead,
      'this_noti_is_read': thisNotiIsRead,
      'noti_type': notiType,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notiTime == e2?.notiTime &&
        e1?.notiTitle == e2?.notiTitle &&
        e1?.notiBody == e2?.notiBody &&
        e1?.notiIsRead == e2?.notiIsRead &&
        e1?.thisNotiIsRead == e2?.thisNotiIsRead &&
        e1?.notiType == e2?.notiType &&
        listEquality.equals(e1?.licenseType, e2?.licenseType) &&
        listEquality.equals(e1?.notiIsSent, e2?.notiIsSent) &&
        listEquality.equals(e1?.insuExpDate, e2?.insuExpDate);
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.notiTime,
        e?.notiTitle,
        e?.notiBody,
        e?.notiIsRead,
        e?.thisNotiIsRead,
        e?.notiType,
        e?.licenseType,
        e?.notiIsSent,
        e?.insuExpDate
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
