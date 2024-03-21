import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SawadAnnouncementRecord extends FirestoreRecord {
  SawadAnnouncementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "announce_date" field.
  String? _announceDate;
  String get announceDate => _announceDate ?? '';
  bool hasAnnounceDate() => _announceDate != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "pdf_url" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "new_announcement" field.
  bool? _newAnnouncement;
  bool get newAnnouncement => _newAnnouncement ?? false;
  bool hasNewAnnouncement() => _newAnnouncement != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _announceDate = snapshotData['announce_date'] as String?;
    _body = snapshotData['body'] as String?;
    _pdfUrl = snapshotData['pdf_url'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _newAnnouncement = snapshotData['new_announcement'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SawadAnnouncement');

  static Stream<SawadAnnouncementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SawadAnnouncementRecord.fromSnapshot(s));

  static Future<SawadAnnouncementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SawadAnnouncementRecord.fromSnapshot(s));

  static SawadAnnouncementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SawadAnnouncementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SawadAnnouncementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SawadAnnouncementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SawadAnnouncementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SawadAnnouncementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSawadAnnouncementRecordData({
  String? title,
  String? announceDate,
  String? body,
  String? pdfUrl,
  int? order,
  bool? newAnnouncement,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'announce_date': announceDate,
      'body': body,
      'pdf_url': pdfUrl,
      'order': order,
      'new_announcement': newAnnouncement,
    }.withoutNulls,
  );

  return firestoreData;
}

class SawadAnnouncementRecordDocumentEquality
    implements Equality<SawadAnnouncementRecord> {
  const SawadAnnouncementRecordDocumentEquality();

  @override
  bool equals(SawadAnnouncementRecord? e1, SawadAnnouncementRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.announceDate == e2?.announceDate &&
        e1?.body == e2?.body &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.order == e2?.order &&
        e1?.newAnnouncement == e2?.newAnnouncement;
  }

  @override
  int hash(SawadAnnouncementRecord? e) => const ListEquality().hash([
        e?.title,
        e?.announceDate,
        e?.body,
        e?.pdfUrl,
        e?.order,
        e?.newAnnouncement
      ]);

  @override
  bool isValidKey(Object? o) => o is SawadAnnouncementRecord;
}
