import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuIconOtherRecord extends FirestoreRecord {
  MenuIconOtherRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "link_url" field.
  String? _linkUrl;
  String get linkUrl => _linkUrl ?? '';
  bool hasLinkUrl() => _linkUrl != null;

  // "param_type" field.
  String? _paramType;
  String get paramType => _paramType ?? '';
  bool hasParamType() => _paramType != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "open_type" field.
  String? _openType;
  String get openType => _openType ?? '';
  bool hasOpenType() => _openType != null;

  // "icon_blur_hash" field.
  String? _iconBlurHash;
  String get iconBlurHash => _iconBlurHash ?? '';
  bool hasIconBlurHash() => _iconBlurHash != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _icon = snapshotData['icon'] as String?;
    _linkUrl = snapshotData['link_url'] as String?;
    _paramType = snapshotData['param_type'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _openType = snapshotData['open_type'] as String?;
    _iconBlurHash = snapshotData['icon_blur_hash'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MenuIconOther');

  static Stream<MenuIconOtherRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuIconOtherRecord.fromSnapshot(s));

  static Future<MenuIconOtherRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuIconOtherRecord.fromSnapshot(s));

  static MenuIconOtherRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuIconOtherRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuIconOtherRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuIconOtherRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuIconOtherRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuIconOtherRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuIconOtherRecordData({
  String? name,
  String? icon,
  String? linkUrl,
  String? paramType,
  int? order,
  String? openType,
  String? iconBlurHash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'icon': icon,
      'link_url': linkUrl,
      'param_type': paramType,
      'order': order,
      'open_type': openType,
      'icon_blur_hash': iconBlurHash,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuIconOtherRecordDocumentEquality
    implements Equality<MenuIconOtherRecord> {
  const MenuIconOtherRecordDocumentEquality();

  @override
  bool equals(MenuIconOtherRecord? e1, MenuIconOtherRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.icon == e2?.icon &&
        e1?.linkUrl == e2?.linkUrl &&
        e1?.paramType == e2?.paramType &&
        e1?.order == e2?.order &&
        e1?.openType == e2?.openType &&
        e1?.iconBlurHash == e2?.iconBlurHash;
  }

  @override
  int hash(MenuIconOtherRecord? e) => const ListEquality().hash([
        e?.name,
        e?.icon,
        e?.linkUrl,
        e?.paramType,
        e?.order,
        e?.openType,
        e?.iconBlurHash
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuIconOtherRecord;
}
