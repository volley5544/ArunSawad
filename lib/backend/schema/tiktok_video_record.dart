import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TiktokVideoRecord extends FirestoreRecord {
  TiktokVideoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tiktokList" field.
  List<String>? _tiktokList;
  List<String> get tiktokList => _tiktokList ?? const [];
  bool hasTiktokList() => _tiktokList != null;

  void _initializeFields() {
    _tiktokList = getDataList(snapshotData['tiktokList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tiktokVideo');

  static Stream<TiktokVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TiktokVideoRecord.fromSnapshot(s));

  static Future<TiktokVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TiktokVideoRecord.fromSnapshot(s));

  static TiktokVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TiktokVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TiktokVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TiktokVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TiktokVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TiktokVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTiktokVideoRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TiktokVideoRecordDocumentEquality implements Equality<TiktokVideoRecord> {
  const TiktokVideoRecordDocumentEquality();

  @override
  bool equals(TiktokVideoRecord? e1, TiktokVideoRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tiktokList, e2?.tiktokList);
  }

  @override
  int hash(TiktokVideoRecord? e) => const ListEquality().hash([e?.tiktokList]);

  @override
  bool isValidKey(Object? o) => o is TiktokVideoRecord;
}
