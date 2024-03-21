import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsuranceLicenseDataRecord extends FirestoreRecord {
  InsuranceLicenseDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "license_name" field.
  List<String>? _licenseName;
  List<String> get licenseName => _licenseName ?? const [];
  bool hasLicenseName() => _licenseName != null;

  // "license_type" field.
  List<String>? _licenseType;
  List<String> get licenseType => _licenseType ?? const [];
  bool hasLicenseType() => _licenseType != null;

  void _initializeFields() {
    _licenseName = getDataList(snapshotData['license_name']);
    _licenseType = getDataList(snapshotData['license_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('InsuranceLicenseData');

  static Stream<InsuranceLicenseDataRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => InsuranceLicenseDataRecord.fromSnapshot(s));

  static Future<InsuranceLicenseDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InsuranceLicenseDataRecord.fromSnapshot(s));

  static InsuranceLicenseDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsuranceLicenseDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsuranceLicenseDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsuranceLicenseDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsuranceLicenseDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsuranceLicenseDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsuranceLicenseDataRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class InsuranceLicenseDataRecordDocumentEquality
    implements Equality<InsuranceLicenseDataRecord> {
  const InsuranceLicenseDataRecordDocumentEquality();

  @override
  bool equals(InsuranceLicenseDataRecord? e1, InsuranceLicenseDataRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.licenseName, e2?.licenseName) &&
        listEquality.equals(e1?.licenseType, e2?.licenseType);
  }

  @override
  int hash(InsuranceLicenseDataRecord? e) =>
      const ListEquality().hash([e?.licenseName, e?.licenseType]);

  @override
  bool isValidKey(Object? o) => o is InsuranceLicenseDataRecord;
}
