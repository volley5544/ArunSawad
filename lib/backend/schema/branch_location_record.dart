import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchLocationRecord extends FirestoreRecord {
  BranchLocationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "company_code" field.
  String? _companyCode;
  String get companyCode => _companyCode ?? '';
  bool hasCompanyCode() => _companyCode != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  void _initializeFields() {
    _companyCode = snapshotData['company_code'] as String?;
    _companyName = snapshotData['company_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BranchLocation');

  static Stream<BranchLocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BranchLocationRecord.fromSnapshot(s));

  static Future<BranchLocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BranchLocationRecord.fromSnapshot(s));

  static BranchLocationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BranchLocationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BranchLocationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BranchLocationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BranchLocationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BranchLocationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBranchLocationRecordData({
  String? companyCode,
  String? companyName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company_code': companyCode,
      'company_name': companyName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BranchLocationRecordDocumentEquality
    implements Equality<BranchLocationRecord> {
  const BranchLocationRecordDocumentEquality();

  @override
  bool equals(BranchLocationRecord? e1, BranchLocationRecord? e2) {
    return e1?.companyCode == e2?.companyCode &&
        e1?.companyName == e2?.companyName;
  }

  @override
  int hash(BranchLocationRecord? e) =>
      const ListEquality().hash([e?.companyCode, e?.companyName]);

  @override
  bool isValidKey(Object? o) => o is BranchLocationRecord;
}
