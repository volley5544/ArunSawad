import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionCallDropdownRecord extends FirestoreRecord {
  CollectionCallDropdownRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "collectionCallDropdown_value" field.
  List<String>? _collectionCallDropdownValue;
  List<String> get collectionCallDropdownValue =>
      _collectionCallDropdownValue ?? const [];
  bool hasCollectionCallDropdownValue() => _collectionCallDropdownValue != null;

  // "collectiionCallDropdown_name" field.
  List<String>? _collectiionCallDropdownName;
  List<String> get collectiionCallDropdownName =>
      _collectiionCallDropdownName ?? const [];
  bool hasCollectiionCallDropdownName() => _collectiionCallDropdownName != null;

  void _initializeFields() {
    _collectionCallDropdownValue =
        getDataList(snapshotData['collectionCallDropdown_value']);
    _collectiionCallDropdownName =
        getDataList(snapshotData['collectiionCallDropdown_name']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collectionCallDropdown');

  static Stream<CollectionCallDropdownRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CollectionCallDropdownRecord.fromSnapshot(s));

  static Future<CollectionCallDropdownRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CollectionCallDropdownRecord.fromSnapshot(s));

  static CollectionCallDropdownRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollectionCallDropdownRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollectionCallDropdownRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollectionCallDropdownRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollectionCallDropdownRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollectionCallDropdownRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollectionCallDropdownRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class CollectionCallDropdownRecordDocumentEquality
    implements Equality<CollectionCallDropdownRecord> {
  const CollectionCallDropdownRecordDocumentEquality();

  @override
  bool equals(
      CollectionCallDropdownRecord? e1, CollectionCallDropdownRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.collectionCallDropdownValue, e2?.collectionCallDropdownValue) &&
        listEquality.equals(
            e1?.collectiionCallDropdownName, e2?.collectiionCallDropdownName);
  }

  @override
  int hash(CollectionCallDropdownRecord? e) => const ListEquality()
      .hash([e?.collectionCallDropdownValue, e?.collectiionCallDropdownName]);

  @override
  bool isValidKey(Object? o) => o is CollectionCallDropdownRecord;
}
