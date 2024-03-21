import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeyStorage2Record extends FirestoreRecord {
  KeyStorage2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uat_api_url" field.
  String? _uatApiUrl;
  String get uatApiUrl => _uatApiUrl ?? '';
  bool hasUatApiUrl() => _uatApiUrl != null;

  void _initializeFields() {
    _uatApiUrl = snapshotData['uat_api_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Key_Storage2');

  static Stream<KeyStorage2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KeyStorage2Record.fromSnapshot(s));

  static Future<KeyStorage2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KeyStorage2Record.fromSnapshot(s));

  static KeyStorage2Record fromSnapshot(DocumentSnapshot snapshot) =>
      KeyStorage2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KeyStorage2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KeyStorage2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KeyStorage2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KeyStorage2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKeyStorage2RecordData({
  String? uatApiUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uat_api_url': uatApiUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class KeyStorage2RecordDocumentEquality implements Equality<KeyStorage2Record> {
  const KeyStorage2RecordDocumentEquality();

  @override
  bool equals(KeyStorage2Record? e1, KeyStorage2Record? e2) {
    return e1?.uatApiUrl == e2?.uatApiUrl;
  }

  @override
  int hash(KeyStorage2Record? e) => const ListEquality().hash([e?.uatApiUrl]);

  @override
  bool isValidKey(Object? o) => o is KeyStorage2Record;
}
