import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FakeLocationLogRecord extends FirestoreRecord {
  FakeLocationLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "device_id" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "operating_system" field.
  String? _operatingSystem;
  String get operatingSystem => _operatingSystem ?? '';
  bool hasOperatingSystem() => _operatingSystem != null;

  // "log_from" field.
  String? _logFrom;
  String get logFrom => _logFrom ?? '';
  bool hasLogFrom() => _logFrom != null;

  void _initializeFields() {
    _employeeId = snapshotData['employee_id'] as String?;
    _dateTime = snapshotData['date_time'] as DateTime?;
    _deviceId = snapshotData['device_id'] as String?;
    _operatingSystem = snapshotData['operating_system'] as String?;
    _logFrom = snapshotData['log_from'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FakeLocationLog');

  static Stream<FakeLocationLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FakeLocationLogRecord.fromSnapshot(s));

  static Future<FakeLocationLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FakeLocationLogRecord.fromSnapshot(s));

  static FakeLocationLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FakeLocationLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FakeLocationLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FakeLocationLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FakeLocationLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FakeLocationLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFakeLocationLogRecordData({
  String? employeeId,
  DateTime? dateTime,
  String? deviceId,
  String? operatingSystem,
  String? logFrom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employee_id': employeeId,
      'date_time': dateTime,
      'device_id': deviceId,
      'operating_system': operatingSystem,
      'log_from': logFrom,
    }.withoutNulls,
  );

  return firestoreData;
}

class FakeLocationLogRecordDocumentEquality
    implements Equality<FakeLocationLogRecord> {
  const FakeLocationLogRecordDocumentEquality();

  @override
  bool equals(FakeLocationLogRecord? e1, FakeLocationLogRecord? e2) {
    return e1?.employeeId == e2?.employeeId &&
        e1?.dateTime == e2?.dateTime &&
        e1?.deviceId == e2?.deviceId &&
        e1?.operatingSystem == e2?.operatingSystem &&
        e1?.logFrom == e2?.logFrom;
  }

  @override
  int hash(FakeLocationLogRecord? e) => const ListEquality().hash([
        e?.employeeId,
        e?.dateTime,
        e?.deviceId,
        e?.operatingSystem,
        e?.logFrom
      ]);

  @override
  bool isValidKey(Object? o) => o is FakeLocationLogRecord;
}
