import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SplashPageImgRecord extends FirestoreRecord {
  SplashPageImgRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "imgURL" field.
  List<String>? _imgURL;
  List<String> get imgURL => _imgURL ?? const [];
  bool hasImgURL() => _imgURL != null;

  // "text" field.
  List<String>? _text;
  List<String> get text => _text ?? const [];
  bool hasText() => _text != null;

  // "blur_hash" field.
  List<String>? _blurHash;
  List<String> get blurHash => _blurHash ?? const [];
  bool hasBlurHash() => _blurHash != null;

  void _initializeFields() {
    _day = snapshotData['day'] as String?;
    _imgURL = getDataList(snapshotData['imgURL']);
    _text = getDataList(snapshotData['text']);
    _blurHash = getDataList(snapshotData['blur_hash']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SplashPageImg');

  static Stream<SplashPageImgRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SplashPageImgRecord.fromSnapshot(s));

  static Future<SplashPageImgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SplashPageImgRecord.fromSnapshot(s));

  static SplashPageImgRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SplashPageImgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SplashPageImgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SplashPageImgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SplashPageImgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SplashPageImgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSplashPageImgRecordData({
  String? day,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
    }.withoutNulls,
  );

  return firestoreData;
}

class SplashPageImgRecordDocumentEquality
    implements Equality<SplashPageImgRecord> {
  const SplashPageImgRecordDocumentEquality();

  @override
  bool equals(SplashPageImgRecord? e1, SplashPageImgRecord? e2) {
    const listEquality = ListEquality();
    return e1?.day == e2?.day &&
        listEquality.equals(e1?.imgURL, e2?.imgURL) &&
        listEquality.equals(e1?.text, e2?.text) &&
        listEquality.equals(e1?.blurHash, e2?.blurHash);
  }

  @override
  int hash(SplashPageImgRecord? e) =>
      const ListEquality().hash([e?.day, e?.imgURL, e?.text, e?.blurHash]);

  @override
  bool isValidKey(Object? o) => o is SplashPageImgRecord;
}
