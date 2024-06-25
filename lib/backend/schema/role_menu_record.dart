import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleMenuRecord extends FirestoreRecord {
  RoleMenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "roleName" field.
  String? _roleName;
  String get roleName => _roleName ?? '';
  bool hasRoleName() => _roleName != null;

  // "menuName" field.
  List<String>? _menuName;
  List<String> get menuName => _menuName ?? const [];
  bool hasMenuName() => _menuName != null;

  // "menuVisible" field.
  List<bool>? _menuVisible;
  List<bool> get menuVisible => _menuVisible ?? const [];
  bool hasMenuVisible() => _menuVisible != null;

  // "menuVisibleBranch" field.
  List<bool>? _menuVisibleBranch;
  List<bool> get menuVisibleBranch => _menuVisibleBranch ?? const [];
  bool hasMenuVisibleBranch() => _menuVisibleBranch != null;

  // "menuVisibleArea" field.
  List<bool>? _menuVisibleArea;
  List<bool> get menuVisibleArea => _menuVisibleArea ?? const [];
  bool hasMenuVisibleArea() => _menuVisibleArea != null;

  // "menuZone" field.
  List<bool>? _menuZone;
  List<bool> get menuZone => _menuZone ?? const [];
  bool hasMenuZone() => _menuZone != null;

  // "empAdmin" field.
  List<String>? _empAdmin;
  List<String> get empAdmin => _empAdmin ?? const [];
  bool hasEmpAdmin() => _empAdmin != null;

  // "adminRoleGroup" field.
  List<AdminRoleGroupStruct>? _adminRoleGroup;
  List<AdminRoleGroupStruct> get adminRoleGroup => _adminRoleGroup ?? const [];
  bool hasAdminRoleGroup() => _adminRoleGroup != null;

  // "servicemenuName" field.
  List<String>? _servicemenuName;
  List<String> get servicemenuName => _servicemenuName ?? const [];
  bool hasServicemenuName() => _servicemenuName != null;

  // "reportmenuName" field.
  List<String>? _reportmenuName;
  List<String> get reportmenuName => _reportmenuName ?? const [];
  bool hasReportmenuName() => _reportmenuName != null;

  // "othermenuName" field.
  List<String>? _othermenuName;
  List<String> get othermenuName => _othermenuName ?? const [];
  bool hasOthermenuName() => _othermenuName != null;

  // "serviecMenuIcon" field.
  List<String>? _serviecMenuIcon;
  List<String> get serviecMenuIcon => _serviecMenuIcon ?? const [];
  bool hasServiecMenuIcon() => _serviecMenuIcon != null;

  // "reportMenuIcon" field.
  List<String>? _reportMenuIcon;
  List<String> get reportMenuIcon => _reportMenuIcon ?? const [];
  bool hasReportMenuIcon() => _reportMenuIcon != null;

  // "otherMenuIcon" field.
  List<String>? _otherMenuIcon;
  List<String> get otherMenuIcon => _otherMenuIcon ?? const [];
  bool hasOtherMenuIcon() => _otherMenuIcon != null;

  void _initializeFields() {
    _roleName = snapshotData['roleName'] as String?;
    _menuName = getDataList(snapshotData['menuName']);
    _menuVisible = getDataList(snapshotData['menuVisible']);
    _menuVisibleBranch = getDataList(snapshotData['menuVisibleBranch']);
    _menuVisibleArea = getDataList(snapshotData['menuVisibleArea']);
    _menuZone = getDataList(snapshotData['menuZone']);
    _empAdmin = getDataList(snapshotData['empAdmin']);
    _adminRoleGroup = getStructList(
      snapshotData['adminRoleGroup'],
      AdminRoleGroupStruct.fromMap,
    );
    _servicemenuName = getDataList(snapshotData['servicemenuName']);
    _reportmenuName = getDataList(snapshotData['reportmenuName']);
    _othermenuName = getDataList(snapshotData['othermenuName']);
    _serviecMenuIcon = getDataList(snapshotData['serviecMenuIcon']);
    _reportMenuIcon = getDataList(snapshotData['reportMenuIcon']);
    _otherMenuIcon = getDataList(snapshotData['otherMenuIcon']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('role_menu');

  static Stream<RoleMenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoleMenuRecord.fromSnapshot(s));

  static Future<RoleMenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoleMenuRecord.fromSnapshot(s));

  static RoleMenuRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoleMenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoleMenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoleMenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoleMenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoleMenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoleMenuRecordData({
  String? roleName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'roleName': roleName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoleMenuRecordDocumentEquality implements Equality<RoleMenuRecord> {
  const RoleMenuRecordDocumentEquality();

  @override
  bool equals(RoleMenuRecord? e1, RoleMenuRecord? e2) {
    const listEquality = ListEquality();
    return e1?.roleName == e2?.roleName &&
        listEquality.equals(e1?.menuName, e2?.menuName) &&
        listEquality.equals(e1?.menuVisible, e2?.menuVisible) &&
        listEquality.equals(e1?.menuVisibleBranch, e2?.menuVisibleBranch) &&
        listEquality.equals(e1?.menuVisibleArea, e2?.menuVisibleArea) &&
        listEquality.equals(e1?.menuZone, e2?.menuZone) &&
        listEquality.equals(e1?.empAdmin, e2?.empAdmin) &&
        listEquality.equals(e1?.adminRoleGroup, e2?.adminRoleGroup) &&
        listEquality.equals(e1?.servicemenuName, e2?.servicemenuName) &&
        listEquality.equals(e1?.reportmenuName, e2?.reportmenuName) &&
        listEquality.equals(e1?.othermenuName, e2?.othermenuName) &&
        listEquality.equals(e1?.serviecMenuIcon, e2?.serviecMenuIcon) &&
        listEquality.equals(e1?.reportMenuIcon, e2?.reportMenuIcon) &&
        listEquality.equals(e1?.otherMenuIcon, e2?.otherMenuIcon);
  }

  @override
  int hash(RoleMenuRecord? e) => const ListEquality().hash([
        e?.roleName,
        e?.menuName,
        e?.menuVisible,
        e?.menuVisibleBranch,
        e?.menuVisibleArea,
        e?.menuZone,
        e?.empAdmin,
        e?.adminRoleGroup,
        e?.servicemenuName,
        e?.reportmenuName,
        e?.othermenuName,
        e?.serviecMenuIcon,
        e?.reportMenuIcon,
        e?.otherMenuIcon
      ]);

  @override
  bool isValidKey(Object? o) => o is RoleMenuRecord;
}
