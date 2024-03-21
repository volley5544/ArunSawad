import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArunSawadImgBannerRecord extends FirestoreRecord {
  ArunSawadImgBannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "img_url" field.
  List<String>? _imgUrl;
  List<String> get imgUrl => _imgUrl ?? const [];
  bool hasImgUrl() => _imgUrl != null;

  // "isHaveLink" field.
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
    _imgUrl = getDataList(snapshotData['img_url']);
    _isHaveLink = getDataList(snapshotData['isHaveLink']);
    _linkUrl = getDataList(snapshotData['link_url']);
    _index = getDataList(snapshotData['index']);
    _blurHash = getDataList(snapshotData['blur_hash']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ArunSawadImgBanner');

  static Stream<ArunSawadImgBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArunSawadImgBannerRecord.fromSnapshot(s));

  static Future<ArunSawadImgBannerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ArunSawadImgBannerRecord.fromSnapshot(s));

  static ArunSawadImgBannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArunSawadImgBannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArunSawadImgBannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArunSawadImgBannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArunSawadImgBannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArunSawadImgBannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArunSawadImgBannerRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ArunSawadImgBannerRecordDocumentEquality
    implements Equality<ArunSawadImgBannerRecord> {
  const ArunSawadImgBannerRecordDocumentEquality();

  @override
  bool equals(ArunSawadImgBannerRecord? e1, ArunSawadImgBannerRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imgUrl, e2?.imgUrl) &&
        listEquality.equals(e1?.isHaveLink, e2?.isHaveLink) &&
        listEquality.equals(e1?.linkUrl, e2?.linkUrl) &&
        listEquality.equals(e1?.index, e2?.index) &&
        listEquality.equals(e1?.blurHash, e2?.blurHash);
  }

  @override
  int hash(ArunSawadImgBannerRecord? e) => const ListEquality()
      .hash([e?.imgUrl, e?.isHaveLink, e?.linkUrl, e?.index, e?.blurHash]);

  @override
  bool isValidKey(Object? o) => o is ArunSawadImgBannerRecord;
}
