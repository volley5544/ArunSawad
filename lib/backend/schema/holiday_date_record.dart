import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HolidayDateRecord extends FirestoreRecord {
  HolidayDateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "company_code" field.
  String? _companyCode;
  String get companyCode => _companyCode ?? '';
  bool hasCompanyCode() => _companyCode != null;

  // "holiday_date" field.
  List<String>? _holidayDate;
  List<String> get holidayDate => _holidayDate ?? const [];
  bool hasHolidayDate() => _holidayDate != null;

  // "holiday_name" field.
  List<String>? _holidayName;
  List<String> get holidayName => _holidayName ?? const [];
  bool hasHolidayName() => _holidayName != null;

  void _initializeFields() {
    _companyCode = snapshotData['company_code'] as String?;
    _holidayDate = getDataList(snapshotData['holiday_date']);
    _holidayName = getDataList(snapshotData['holiday_name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HolidayDate');

  static Stream<HolidayDateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HolidayDateRecord.fromSnapshot(s));

  static Future<HolidayDateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HolidayDateRecord.fromSnapshot(s));

  static HolidayDateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HolidayDateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HolidayDateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HolidayDateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HolidayDateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HolidayDateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHolidayDateRecordData({
  String? companyCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company_code': companyCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class HolidayDateRecordDocumentEquality implements Equality<HolidayDateRecord> {
  const HolidayDateRecordDocumentEquality();

  @override
  bool equals(HolidayDateRecord? e1, HolidayDateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.companyCode == e2?.companyCode &&
        listEquality.equals(e1?.holidayDate, e2?.holidayDate) &&
        listEquality.equals(e1?.holidayName, e2?.holidayName);
  }

  @override
  int hash(HolidayDateRecord? e) => const ListEquality()
      .hash([e?.companyCode, e?.holidayDate, e?.holidayName]);

  @override
  bool isValidKey(Object? o) => o is HolidayDateRecord;
}
