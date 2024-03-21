import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileUploadRecord extends FirestoreRecord {
  FileUploadRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RecordId" field.
  String? _recordId;
  String get recordId => _recordId ?? '';
  bool hasRecordId() => _recordId != null;

  // "img_url" field.
  List<String>? _imgUrl;
  List<String> get imgUrl => _imgUrl ?? const [];
  bool hasImgUrl() => _imgUrl != null;

  // "pic_datetime" field.
  DateTime? _picDatetime;
  DateTime? get picDatetime => _picDatetime;
  bool hasPicDatetime() => _picDatetime != null;

  // "pic_coordinate" field.
  String? _picCoordinate;
  String get picCoordinate => _picCoordinate ?? '';
  bool hasPicCoordinate() => _picCoordinate != null;

  void _initializeFields() {
    _recordId = snapshotData['RecordId'] as String?;
    _imgUrl = getDataList(snapshotData['img_url']);
    _picDatetime = snapshotData['pic_datetime'] as DateTime?;
    _picCoordinate = snapshotData['pic_coordinate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FileUpload');

  static Stream<FileUploadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FileUploadRecord.fromSnapshot(s));

  static Future<FileUploadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FileUploadRecord.fromSnapshot(s));

  static FileUploadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FileUploadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FileUploadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FileUploadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FileUploadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FileUploadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFileUploadRecordData({
  String? recordId,
  DateTime? picDatetime,
  String? picCoordinate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RecordId': recordId,
      'pic_datetime': picDatetime,
      'pic_coordinate': picCoordinate,
    }.withoutNulls,
  );

  return firestoreData;
}

class FileUploadRecordDocumentEquality implements Equality<FileUploadRecord> {
  const FileUploadRecordDocumentEquality();

  @override
  bool equals(FileUploadRecord? e1, FileUploadRecord? e2) {
    const listEquality = ListEquality();
    return e1?.recordId == e2?.recordId &&
        listEquality.equals(e1?.imgUrl, e2?.imgUrl) &&
        e1?.picDatetime == e2?.picDatetime &&
        e1?.picCoordinate == e2?.picCoordinate;
  }

  @override
  int hash(FileUploadRecord? e) => const ListEquality()
      .hash([e?.recordId, e?.imgUrl, e?.picDatetime, e?.picCoordinate]);

  @override
  bool isValidKey(Object? o) => o is FileUploadRecord;
}
