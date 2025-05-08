import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchviewDropdownRecord extends FirestoreRecord {
  BranchviewDropdownRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dropdown_name" field.
  List<String>? _dropdownName;
  List<String> get dropdownName => _dropdownName ?? const [];
  bool hasDropdownName() => _dropdownName != null;

  // "dropdown_value" field.
  List<String>? _dropdownValue;
  List<String> get dropdownValue => _dropdownValue ?? const [];
  bool hasDropdownValue() => _dropdownValue != null;

  // "marketing_dropdown_value" field.
  List<String>? _marketingDropdownValue;
  List<String> get marketingDropdownValue =>
      _marketingDropdownValue ?? const [];
  bool hasMarketingDropdownValue() => _marketingDropdownValue != null;

  // "marketing_form_link" field.
  List<String>? _marketingFormLink;
  List<String> get marketingFormLink => _marketingFormLink ?? const [];
  bool hasMarketingFormLink() => _marketingFormLink != null;

  // "url_link" field.
  List<String>? _urlLink;
  List<String> get urlLink => _urlLink ?? const [];
  bool hasUrlLink() => _urlLink != null;

  void _initializeFields() {
    _dropdownName = getDataList(snapshotData['dropdown_name']);
    _dropdownValue = getDataList(snapshotData['dropdown_value']);
    _marketingDropdownValue =
        getDataList(snapshotData['marketing_dropdown_value']);
    _marketingFormLink = getDataList(snapshotData['marketing_form_link']);
    _urlLink = getDataList(snapshotData['url_link']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('branchviewDropdown');

  static Stream<BranchviewDropdownRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BranchviewDropdownRecord.fromSnapshot(s));

  static Future<BranchviewDropdownRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BranchviewDropdownRecord.fromSnapshot(s));

  static BranchviewDropdownRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BranchviewDropdownRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BranchviewDropdownRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BranchviewDropdownRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BranchviewDropdownRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BranchviewDropdownRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBranchviewDropdownRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class BranchviewDropdownRecordDocumentEquality
    implements Equality<BranchviewDropdownRecord> {
  const BranchviewDropdownRecordDocumentEquality();

  @override
  bool equals(BranchviewDropdownRecord? e1, BranchviewDropdownRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.dropdownName, e2?.dropdownName) &&
        listEquality.equals(e1?.dropdownValue, e2?.dropdownValue) &&
        listEquality.equals(
            e1?.marketingDropdownValue, e2?.marketingDropdownValue) &&
        listEquality.equals(e1?.marketingFormLink, e2?.marketingFormLink) &&
        listEquality.equals(e1?.urlLink, e2?.urlLink);
  }

  @override
  int hash(BranchviewDropdownRecord? e) => const ListEquality().hash([
        e?.dropdownName,
        e?.dropdownValue,
        e?.marketingDropdownValue,
        e?.marketingFormLink,
        e?.urlLink
      ]);

  @override
  bool isValidKey(Object? o) => o is BranchviewDropdownRecord;
}
