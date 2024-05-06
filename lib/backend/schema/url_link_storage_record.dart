import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrlLinkStorageRecord extends FirestoreRecord {
  UrlLinkStorageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "url_name" field.
  String? _urlName;
  String get urlName => _urlName ?? '';
  bool hasUrlName() => _urlName != null;

  // "url_link" field.
  String? _urlLink;
  String get urlLink => _urlLink ?? '';
  bool hasUrlLink() => _urlLink != null;

  // "url_token" field.
  String? _urlToken;
  String get urlToken => _urlToken ?? '';
  bool hasUrlToken() => _urlToken != null;

  void _initializeFields() {
    _urlName = snapshotData['url_name'] as String?;
    _urlLink = snapshotData['url_link'] as String?;
    _urlToken = snapshotData['url_token'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('urlLinkStorage');

  static Stream<UrlLinkStorageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UrlLinkStorageRecord.fromSnapshot(s));

  static Future<UrlLinkStorageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UrlLinkStorageRecord.fromSnapshot(s));

  static UrlLinkStorageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UrlLinkStorageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UrlLinkStorageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UrlLinkStorageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UrlLinkStorageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UrlLinkStorageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUrlLinkStorageRecordData({
  String? urlName,
  String? urlLink,
  String? urlToken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url_name': urlName,
      'url_link': urlLink,
      'url_token': urlToken,
    }.withoutNulls,
  );

  return firestoreData;
}

class UrlLinkStorageRecordDocumentEquality
    implements Equality<UrlLinkStorageRecord> {
  const UrlLinkStorageRecordDocumentEquality();

  @override
  bool equals(UrlLinkStorageRecord? e1, UrlLinkStorageRecord? e2) {
    return e1?.urlName == e2?.urlName &&
        e1?.urlLink == e2?.urlLink &&
        e1?.urlToken == e2?.urlToken;
  }

  @override
  int hash(UrlLinkStorageRecord? e) =>
      const ListEquality().hash([e?.urlName, e?.urlLink, e?.urlToken]);

  @override
  bool isValidKey(Object? o) => o is UrlLinkStorageRecord;
}
