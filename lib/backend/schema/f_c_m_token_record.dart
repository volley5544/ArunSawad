import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FCMTokenRecord extends FirestoreRecord {
  FCMTokenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "device_type" field.
  String? _deviceType;
  String get deviceType => _deviceType ?? '';
  bool hasDeviceType() => _deviceType != null;

  // "fcm_token" field.
  String? _fcmToken;
  String get fcmToken => _fcmToken ?? '';
  bool hasFcmToken() => _fcmToken != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _deviceType = snapshotData['device_type'] as String?;
    _fcmToken = snapshotData['fcm_token'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _employeeId = snapshotData['employee_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FCM_Token');

  static Stream<FCMTokenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FCMTokenRecord.fromSnapshot(s));

  static Future<FCMTokenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FCMTokenRecord.fromSnapshot(s));

  static FCMTokenRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FCMTokenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FCMTokenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FCMTokenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FCMTokenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FCMTokenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFCMTokenRecordData({
  DateTime? createdAt,
  String? deviceType,
  String? fcmToken,
  DocumentReference? userRef,
  String? employeeId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'device_type': deviceType,
      'fcm_token': fcmToken,
      'user_ref': userRef,
      'employee_id': employeeId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FCMTokenRecordDocumentEquality implements Equality<FCMTokenRecord> {
  const FCMTokenRecordDocumentEquality();

  @override
  bool equals(FCMTokenRecord? e1, FCMTokenRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.deviceType == e2?.deviceType &&
        e1?.fcmToken == e2?.fcmToken &&
        e1?.userRef == e2?.userRef &&
        e1?.employeeId == e2?.employeeId;
  }

  @override
  int hash(FCMTokenRecord? e) => const ListEquality().hash(
      [e?.createdAt, e?.deviceType, e?.fcmToken, e?.userRef, e?.employeeId]);

  @override
  bool isValidKey(Object? o) => o is FCMTokenRecord;
}
