import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SplashPageHolidayImgRecord extends FirestoreRecord {
  SplashPageHolidayImgRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "HolidayImg" field.
  List<String>? _holidayImg;
  List<String> get holidayImg => _holidayImg ?? const [];
  bool hasHolidayImg() => _holidayImg != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "DateExp" field.
  DateTime? _dateExp;
  DateTime? get dateExp => _dateExp;
  bool hasDateExp() => _dateExp != null;

  // "is_have_link" field.
  List<bool>? _isHaveLink;
  List<bool> get isHaveLink => _isHaveLink ?? const [];
  bool hasIsHaveLink() => _isHaveLink != null;

  // "link_url" field.
  List<String>? _linkUrl;
  List<String> get linkUrl => _linkUrl ?? const [];
  bool hasLinkUrl() => _linkUrl != null;

  // "index" field.
  List<int>? _index;
  List<int> get index => _index ?? const [];
  bool hasIndex() => _index != null;

  // "blur_hash" field.
  List<String>? _blurHash;
  List<String> get blurHash => _blurHash ?? const [];
  bool hasBlurHash() => _blurHash != null;

  void _initializeFields() {
    _holidayImg = getDataList(snapshotData['HolidayImg']);
    _date = snapshotData['Date'] as DateTime?;
    _dateExp = snapshotData['DateExp'] as DateTime?;
    _isHaveLink = getDataList(snapshotData['is_have_link']);
    _linkUrl = getDataList(snapshotData['link_url']);
    _index = getDataList(snapshotData['index']);
    _blurHash = getDataList(snapshotData['blur_hash']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SplashPageHolidayImg');

  static Stream<SplashPageHolidayImgRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SplashPageHolidayImgRecord.fromSnapshot(s));

  static Future<SplashPageHolidayImgRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SplashPageHolidayImgRecord.fromSnapshot(s));

  static SplashPageHolidayImgRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SplashPageHolidayImgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SplashPageHolidayImgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SplashPageHolidayImgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SplashPageHolidayImgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SplashPageHolidayImgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSplashPageHolidayImgRecordData({
  DateTime? date,
  DateTime? dateExp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Date': date,
      'DateExp': dateExp,
    }.withoutNulls,
  );

  return firestoreData;
}

class SplashPageHolidayImgRecordDocumentEquality
    implements Equality<SplashPageHolidayImgRecord> {
  const SplashPageHolidayImgRecordDocumentEquality();

  @override
  bool equals(SplashPageHolidayImgRecord? e1, SplashPageHolidayImgRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.holidayImg, e2?.holidayImg) &&
        e1?.date == e2?.date &&
        e1?.dateExp == e2?.dateExp &&
        listEquality.equals(e1?.isHaveLink, e2?.isHaveLink) &&
        listEquality.equals(e1?.linkUrl, e2?.linkUrl) &&
        listEquality.equals(e1?.index, e2?.index) &&
        listEquality.equals(e1?.blurHash, e2?.blurHash);
  }

  @override
  int hash(SplashPageHolidayImgRecord? e) => const ListEquality().hash([
        e?.holidayImg,
        e?.date,
        e?.dateExp,
        e?.isHaveLink,
        e?.linkUrl,
        e?.index,
        e?.blurHash
      ]);

  @override
  bool isValidKey(Object? o) => o is SplashPageHolidayImgRecord;
}
