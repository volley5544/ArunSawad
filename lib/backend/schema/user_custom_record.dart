import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCustomRecord extends FirestoreRecord {
  UserCustomRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "img_profile" field.
  String? _imgProfile;
  String get imgProfile => _imgProfile ?? '';
  bool hasImgProfile() => _imgProfile != null;

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _imgProfile = snapshotData['img_profile'] as String?;
    _employeeId = snapshotData['employee_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_custom');

  static Stream<UserCustomRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCustomRecord.fromSnapshot(s));

  static Future<UserCustomRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCustomRecord.fromSnapshot(s));

  static UserCustomRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCustomRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCustomRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCustomRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCustomRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCustomRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCustomRecordData({
  DateTime? createdTime,
  String? email,
  String? uid,
  String? imgProfile,
  String? employeeId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'email': email,
      'uid': uid,
      'img_profile': imgProfile,
      'employee_id': employeeId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCustomRecordDocumentEquality implements Equality<UserCustomRecord> {
  const UserCustomRecordDocumentEquality();

  @override
  bool equals(UserCustomRecord? e1, UserCustomRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.imgProfile == e2?.imgProfile &&
        e1?.employeeId == e2?.employeeId;
  }

  @override
  int hash(UserCustomRecord? e) => const ListEquality()
      .hash([e?.createdTime, e?.email, e?.uid, e?.imgProfile, e?.employeeId]);

  @override
  bool isValidKey(Object? o) => o is UserCustomRecord;
}
