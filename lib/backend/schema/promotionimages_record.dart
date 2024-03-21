import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionimagesRecord extends FirestoreRecord {
  PromotionimagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "img_url" field.
  List<String>? _imgUrl;
  List<String> get imgUrl => _imgUrl ?? const [];
  bool hasImgUrl() => _imgUrl != null;

  void _initializeFields() {
    _imgUrl = getDataList(snapshotData['img_url']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotionimages');

  static Stream<PromotionimagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionimagesRecord.fromSnapshot(s));

  static Future<PromotionimagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionimagesRecord.fromSnapshot(s));

  static PromotionimagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionimagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionimagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionimagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionimagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionimagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionimagesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PromotionimagesRecordDocumentEquality
    implements Equality<PromotionimagesRecord> {
  const PromotionimagesRecordDocumentEquality();

  @override
  bool equals(PromotionimagesRecord? e1, PromotionimagesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imgUrl, e2?.imgUrl);
  }

  @override
  int hash(PromotionimagesRecord? e) => const ListEquality().hash([e?.imgUrl]);

  @override
  bool isValidKey(Object? o) => o is PromotionimagesRecord;
}
