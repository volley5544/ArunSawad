import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRoleGroupRecord extends FirestoreRecord {
  AdminRoleGroupRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "menu_name" field.
  String? _menuName;
  String get menuName => _menuName ?? '';
  bool hasMenuName() => _menuName != null;

  // "admin_group" field.
  List<AdminRoleGroupStruct>? _adminGroup;
  List<AdminRoleGroupStruct> get adminGroup => _adminGroup ?? const [];
  bool hasAdminGroup() => _adminGroup != null;

  void _initializeFields() {
    _menuName = snapshotData['menu_name'] as String?;
    _adminGroup = getStructList(
      snapshotData['admin_group'],
      AdminRoleGroupStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AdminRoleGroup');

  static Stream<AdminRoleGroupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminRoleGroupRecord.fromSnapshot(s));

  static Future<AdminRoleGroupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminRoleGroupRecord.fromSnapshot(s));

  static AdminRoleGroupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminRoleGroupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminRoleGroupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminRoleGroupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminRoleGroupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminRoleGroupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminRoleGroupRecordData({
  String? menuName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'menu_name': menuName,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminRoleGroupRecordDocumentEquality
    implements Equality<AdminRoleGroupRecord> {
  const AdminRoleGroupRecordDocumentEquality();

  @override
  bool equals(AdminRoleGroupRecord? e1, AdminRoleGroupRecord? e2) {
    const listEquality = ListEquality();
    return e1?.menuName == e2?.menuName &&
        listEquality.equals(e1?.adminGroup, e2?.adminGroup);
  }

  @override
  int hash(AdminRoleGroupRecord? e) =>
      const ListEquality().hash([e?.menuName, e?.adminGroup]);

  @override
  bool isValidKey(Object? o) => o is AdminRoleGroupRecord;
}
