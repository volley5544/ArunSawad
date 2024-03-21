import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KPIAllChangeRecord extends FirestoreRecord {
  KPIAllChangeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "danger" field.
  double? _danger;
  double get danger => _danger ?? 0.0;
  bool hasDanger() => _danger != null;

  // "normal" field.
  double? _normal;
  double get normal => _normal ?? 0.0;
  bool hasNormal() => _normal != null;

  // "dangerColor" field.
  Color? _dangerColor;
  Color? get dangerColor => _dangerColor;
  bool hasDangerColor() => _dangerColor != null;

  // "normalColor" field.
  Color? _normalColor;
  Color? get normalColor => _normalColor;
  bool hasNormalColor() => _normalColor != null;

  // "goodColor" field.
  Color? _goodColor;
  Color? get goodColor => _goodColor;
  bool hasGoodColor() => _goodColor != null;

  void _initializeFields() {
    _danger = castToType<double>(snapshotData['danger']);
    _normal = castToType<double>(snapshotData['normal']);
    _dangerColor = getSchemaColor(snapshotData['dangerColor']);
    _normalColor = getSchemaColor(snapshotData['normalColor']);
    _goodColor = getSchemaColor(snapshotData['goodColor']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('KPIAllChange');

  static Stream<KPIAllChangeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KPIAllChangeRecord.fromSnapshot(s));

  static Future<KPIAllChangeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KPIAllChangeRecord.fromSnapshot(s));

  static KPIAllChangeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KPIAllChangeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KPIAllChangeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KPIAllChangeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KPIAllChangeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KPIAllChangeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKPIAllChangeRecordData({
  double? danger,
  double? normal,
  Color? dangerColor,
  Color? normalColor,
  Color? goodColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'danger': danger,
      'normal': normal,
      'dangerColor': dangerColor,
      'normalColor': normalColor,
      'goodColor': goodColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class KPIAllChangeRecordDocumentEquality
    implements Equality<KPIAllChangeRecord> {
  const KPIAllChangeRecordDocumentEquality();

  @override
  bool equals(KPIAllChangeRecord? e1, KPIAllChangeRecord? e2) {
    return e1?.danger == e2?.danger &&
        e1?.normal == e2?.normal &&
        e1?.dangerColor == e2?.dangerColor &&
        e1?.normalColor == e2?.normalColor &&
        e1?.goodColor == e2?.goodColor;
  }

  @override
  int hash(KPIAllChangeRecord? e) => const ListEquality().hash(
      [e?.danger, e?.normal, e?.dangerColor, e?.normalColor, e?.goodColor]);

  @override
  bool isValidKey(Object? o) => o is KPIAllChangeRecord;
}
