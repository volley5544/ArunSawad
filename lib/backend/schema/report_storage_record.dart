import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportStorageRecord extends FirestoreRecord {
  ReportStorageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "report_name" field.
  String? _reportName;
  String get reportName => _reportName ?? '';
  bool hasReportName() => _reportName != null;

  // "report_url" field.
  List<String>? _reportUrl;
  List<String> get reportUrl => _reportUrl ?? const [];
  bool hasReportUrl() => _reportUrl != null;

  // "report_url_name" field.
  List<String>? _reportUrlName;
  List<String> get reportUrlName => _reportUrlName ?? const [];
  bool hasReportUrlName() => _reportUrlName != null;

  void _initializeFields() {
    _reportName = snapshotData['report_name'] as String?;
    _reportUrl = getDataList(snapshotData['report_url']);
    _reportUrlName = getDataList(snapshotData['report_url_name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ReportStorage');

  static Stream<ReportStorageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportStorageRecord.fromSnapshot(s));

  static Future<ReportStorageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportStorageRecord.fromSnapshot(s));

  static ReportStorageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportStorageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportStorageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportStorageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportStorageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportStorageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportStorageRecordData({
  String? reportName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'report_name': reportName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportStorageRecordDocumentEquality
    implements Equality<ReportStorageRecord> {
  const ReportStorageRecordDocumentEquality();

  @override
  bool equals(ReportStorageRecord? e1, ReportStorageRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reportName == e2?.reportName &&
        listEquality.equals(e1?.reportUrl, e2?.reportUrl) &&
        listEquality.equals(e1?.reportUrlName, e2?.reportUrlName);
  }

  @override
  int hash(ReportStorageRecord? e) => const ListEquality()
      .hash([e?.reportName, e?.reportUrl, e?.reportUrlName]);

  @override
  bool isValidKey(Object? o) => o is ReportStorageRecord;
}
