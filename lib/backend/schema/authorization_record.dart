import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorizationRecord extends FirestoreRecord {
  AuthorizationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content_name" field.
  String? _contentName;
  String get contentName => _contentName ?? '';
  bool hasContentName() => _contentName != null;

  // "employee_id_list" field.
  List<String>? _employeeIdList;
  List<String> get employeeIdList => _employeeIdList ?? const [];
  bool hasEmployeeIdList() => _employeeIdList != null;

  void _initializeFields() {
    _contentName = snapshotData['content_name'] as String?;
    _employeeIdList = getDataList(snapshotData['employee_id_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Authorization');

  static Stream<AuthorizationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuthorizationRecord.fromSnapshot(s));

  static Future<AuthorizationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuthorizationRecord.fromSnapshot(s));

  static AuthorizationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuthorizationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuthorizationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuthorizationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuthorizationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuthorizationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuthorizationRecordData({
  String? contentName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content_name': contentName,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuthorizationRecordDocumentEquality
    implements Equality<AuthorizationRecord> {
  const AuthorizationRecordDocumentEquality();

  @override
  bool equals(AuthorizationRecord? e1, AuthorizationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.contentName == e2?.contentName &&
        listEquality.equals(e1?.employeeIdList, e2?.employeeIdList);
  }

  @override
  int hash(AuthorizationRecord? e) =>
      const ListEquality().hash([e?.contentName, e?.employeeIdList]);

  @override
  bool isValidKey(Object? o) => o is AuthorizationRecord;
}
