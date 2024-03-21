import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsuranceNotiDataRecord extends FirestoreRecord {
  InsuranceNotiDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "emp_id" field.
  String? _empId;
  String get empId => _empId ?? '';
  bool hasEmpId() => _empId != null;

  // "license_type" field.
  List<String>? _licenseType;
  List<String> get licenseType => _licenseType ?? const [];
  bool hasLicenseType() => _licenseType != null;

  // "noti_is_sent" field.
  List<bool>? _notiIsSent;
  List<bool> get notiIsSent => _notiIsSent ?? const [];
  bool hasNotiIsSent() => _notiIsSent != null;

  // "exp_insu_date" field.
  List<DateTime>? _expInsuDate;
  List<DateTime> get expInsuDate => _expInsuDate ?? const [];
  bool hasExpInsuDate() => _expInsuDate != null;

  void _initializeFields() {
    _empId = snapshotData['emp_id'] as String?;
    _licenseType = getDataList(snapshotData['license_type']);
    _notiIsSent = getDataList(snapshotData['noti_is_sent']);
    _expInsuDate = getDataList(snapshotData['exp_insu_date']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('insuranceNotiData');

  static Stream<InsuranceNotiDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsuranceNotiDataRecord.fromSnapshot(s));

  static Future<InsuranceNotiDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InsuranceNotiDataRecord.fromSnapshot(s));

  static InsuranceNotiDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsuranceNotiDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsuranceNotiDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsuranceNotiDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsuranceNotiDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsuranceNotiDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsuranceNotiDataRecordData({
  String? empId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'emp_id': empId,
    }.withoutNulls,
  );

  return firestoreData;
}

class InsuranceNotiDataRecordDocumentEquality
    implements Equality<InsuranceNotiDataRecord> {
  const InsuranceNotiDataRecordDocumentEquality();

  @override
  bool equals(InsuranceNotiDataRecord? e1, InsuranceNotiDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.empId == e2?.empId &&
        listEquality.equals(e1?.licenseType, e2?.licenseType) &&
        listEquality.equals(e1?.notiIsSent, e2?.notiIsSent) &&
        listEquality.equals(e1?.expInsuDate, e2?.expInsuDate);
  }

  @override
  int hash(InsuranceNotiDataRecord? e) => const ListEquality()
      .hash([e?.empId, e?.licenseType, e?.notiIsSent, e?.expInsuDate]);

  @override
  bool isValidKey(Object? o) => o is InsuranceNotiDataRecord;
}
