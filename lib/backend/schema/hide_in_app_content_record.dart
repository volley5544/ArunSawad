import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HideInAppContentRecord extends FirestoreRecord {
  HideInAppContentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content_name" field.
  String? _contentName;
  String get contentName => _contentName ?? '';
  bool hasContentName() => _contentName != null;

  // "isShowContent" field.
  bool? _isShowContent;
  bool get isShowContent => _isShowContent ?? false;
  bool hasIsShowContent() => _isShowContent != null;

  void _initializeFields() {
    _contentName = snapshotData['content_name'] as String?;
    _isShowContent = snapshotData['isShowContent'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hideInAppContent');

  static Stream<HideInAppContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HideInAppContentRecord.fromSnapshot(s));

  static Future<HideInAppContentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HideInAppContentRecord.fromSnapshot(s));

  static HideInAppContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HideInAppContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HideInAppContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HideInAppContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HideInAppContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HideInAppContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHideInAppContentRecordData({
  String? contentName,
  bool? isShowContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content_name': contentName,
      'isShowContent': isShowContent,
    }.withoutNulls,
  );

  return firestoreData;
}

class HideInAppContentRecordDocumentEquality
    implements Equality<HideInAppContentRecord> {
  const HideInAppContentRecordDocumentEquality();

  @override
  bool equals(HideInAppContentRecord? e1, HideInAppContentRecord? e2) {
    return e1?.contentName == e2?.contentName &&
        e1?.isShowContent == e2?.isShowContent;
  }

  @override
  int hash(HideInAppContentRecord? e) =>
      const ListEquality().hash([e?.contentName, e?.isShowContent]);

  @override
  bool isValidKey(Object? o) => o is HideInAppContentRecord;
}
