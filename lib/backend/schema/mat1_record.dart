import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Mat1Record extends FirestoreRecord {
  Mat1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "recordID" field.
  String? _recordID;
  String get recordID => _recordID ?? '';
  bool hasRecordID() => _recordID != null;

  // "recordIId" field.
  List<String>? _recordIId;
  List<String> get recordIId => _recordIId ?? const [];
  bool hasRecordIId() => _recordIId != null;

  void _initializeFields() {
    _recordID = snapshotData['recordID'] as String?;
    _recordIId = getDataList(snapshotData['recordIId']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mat1');

  static Stream<Mat1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Mat1Record.fromSnapshot(s));

  static Future<Mat1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Mat1Record.fromSnapshot(s));

  static Mat1Record fromSnapshot(DocumentSnapshot snapshot) => Mat1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Mat1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Mat1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Mat1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Mat1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMat1RecordData({
  String? recordID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recordID': recordID,
    }.withoutNulls,
  );

  return firestoreData;
}

class Mat1RecordDocumentEquality implements Equality<Mat1Record> {
  const Mat1RecordDocumentEquality();

  @override
  bool equals(Mat1Record? e1, Mat1Record? e2) {
    const listEquality = ListEquality();
    return e1?.recordID == e2?.recordID &&
        listEquality.equals(e1?.recordIId, e2?.recordIId);
  }

  @override
  int hash(Mat1Record? e) =>
      const ListEquality().hash([e?.recordID, e?.recordIId]);

  @override
  bool isValidKey(Object? o) => o is Mat1Record;
}
