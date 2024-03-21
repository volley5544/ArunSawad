import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeyStorageRecord extends FirestoreRecord {
  KeyStorageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "api_URL" field.
  String? _apiURL;
  String get apiURL => _apiURL ?? '';
  bool hasApiURL() => _apiURL != null;

  void _initializeFields() {
    _apiURL = snapshotData['api_URL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Key_Storage');

  static Stream<KeyStorageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KeyStorageRecord.fromSnapshot(s));

  static Future<KeyStorageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KeyStorageRecord.fromSnapshot(s));

  static KeyStorageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KeyStorageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KeyStorageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KeyStorageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KeyStorageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KeyStorageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKeyStorageRecordData({
  String? apiURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'api_URL': apiURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class KeyStorageRecordDocumentEquality implements Equality<KeyStorageRecord> {
  const KeyStorageRecordDocumentEquality();

  @override
  bool equals(KeyStorageRecord? e1, KeyStorageRecord? e2) {
    return e1?.apiURL == e2?.apiURL;
  }

  @override
  int hash(KeyStorageRecord? e) => const ListEquality().hash([e?.apiURL]);

  @override
  bool isValidKey(Object? o) => o is KeyStorageRecord;
}
