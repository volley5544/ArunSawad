import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextContentRecord extends FirestoreRecord {
  TextContentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "kpiText" field.
  String? _kpiText;
  String get kpiText => _kpiText ?? '';
  bool hasKpiText() => _kpiText != null;

  // "kpiTextcolor" field.
  Color? _kpiTextcolor;
  Color? get kpiTextcolor => _kpiTextcolor;
  bool hasKpiTextcolor() => _kpiTextcolor != null;

  // "kpiHideText" field.
  bool? _kpiHideText;
  bool get kpiHideText => _kpiHideText ?? false;
  bool hasKpiHideText() => _kpiHideText != null;

  // "contentName" field.
  String? _contentName;
  String get contentName => _contentName ?? '';
  bool hasContentName() => _contentName != null;

  void _initializeFields() {
    _kpiText = snapshotData['kpiText'] as String?;
    _kpiTextcolor = getSchemaColor(snapshotData['kpiTextcolor']);
    _kpiHideText = snapshotData['kpiHideText'] as bool?;
    _contentName = snapshotData['contentName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('textContent');

  static Stream<TextContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TextContentRecord.fromSnapshot(s));

  static Future<TextContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TextContentRecord.fromSnapshot(s));

  static TextContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TextContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TextContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TextContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TextContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TextContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTextContentRecordData({
  String? kpiText,
  Color? kpiTextcolor,
  bool? kpiHideText,
  String? contentName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'kpiText': kpiText,
      'kpiTextcolor': kpiTextcolor,
      'kpiHideText': kpiHideText,
      'contentName': contentName,
    }.withoutNulls,
  );

  return firestoreData;
}

class TextContentRecordDocumentEquality implements Equality<TextContentRecord> {
  const TextContentRecordDocumentEquality();

  @override
  bool equals(TextContentRecord? e1, TextContentRecord? e2) {
    return e1?.kpiText == e2?.kpiText &&
        e1?.kpiTextcolor == e2?.kpiTextcolor &&
        e1?.kpiHideText == e2?.kpiHideText &&
        e1?.contentName == e2?.contentName;
  }

  @override
  int hash(TextContentRecord? e) => const ListEquality()
      .hash([e?.kpiText, e?.kpiTextcolor, e?.kpiHideText, e?.contentName]);

  @override
  bool isValidKey(Object? o) => o is TextContentRecord;
}
