import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLogRecord extends FirestoreRecord {
  UserLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "action_time" field.
  DateTime? _actionTime;
  DateTime? get actionTime => _actionTime;
  bool hasActionTime() => _actionTime != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "user_location" field.
  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  bool hasUserLocation() => _userLocation != null;

  // "hash_thai_id" field.
  String? _hashThaiId;
  String get hashThaiId => _hashThaiId ?? '';
  bool hasHashThaiId() => _hashThaiId != null;

  void _initializeFields() {
    _employeeId = snapshotData['employee_id'] as String?;
    _action = snapshotData['action'] as String?;
    _actionTime = snapshotData['action_time'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _userLocation = snapshotData['user_location'] as LatLng?;
    _hashThaiId = snapshotData['hash_thai_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_log');

  static Stream<UserLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserLogRecord.fromSnapshot(s));

  static Future<UserLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserLogRecord.fromSnapshot(s));

  static UserLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserLogRecordData({
  String? employeeId,
  String? action,
  DateTime? actionTime,
  DocumentReference? userRef,
  LatLng? userLocation,
  String? hashThaiId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employee_id': employeeId,
      'action': action,
      'action_time': actionTime,
      'user_ref': userRef,
      'user_location': userLocation,
      'hash_thai_id': hashThaiId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserLogRecordDocumentEquality implements Equality<UserLogRecord> {
  const UserLogRecordDocumentEquality();

  @override
  bool equals(UserLogRecord? e1, UserLogRecord? e2) {
    return e1?.employeeId == e2?.employeeId &&
        e1?.action == e2?.action &&
        e1?.actionTime == e2?.actionTime &&
        e1?.userRef == e2?.userRef &&
        e1?.userLocation == e2?.userLocation &&
        e1?.hashThaiId == e2?.hashThaiId;
  }

  @override
  int hash(UserLogRecord? e) => const ListEquality().hash([
        e?.employeeId,
        e?.action,
        e?.actionTime,
        e?.userRef,
        e?.userLocation,
        e?.hashThaiId
      ]);

  @override
  bool isValidKey(Object? o) => o is UserLogRecord;
}
