import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpoundCarMasterRecord extends FirestoreRecord {
  ImpoundCarMasterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "impound_car_locate_id" field.
  List<String>? _impoundCarLocateId;
  List<String> get impoundCarLocateId => _impoundCarLocateId ?? const [];
  bool hasImpoundCarLocateId() => _impoundCarLocateId != null;

  // "locate_name" field.
  List<String>? _locateName;
  List<String> get locateName => _locateName ?? const [];
  bool hasLocateName() => _locateName != null;

  // "locate_code" field.
  List<String>? _locateCode;
  List<String> get locateCode => _locateCode ?? const [];
  bool hasLocateCode() => _locateCode != null;

  void _initializeFields() {
    _impoundCarLocateId = getDataList(snapshotData['impound_car_locate_id']);
    _locateName = getDataList(snapshotData['locate_name']);
    _locateCode = getDataList(snapshotData['locate_code']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ImpoundCarMaster');

  static Stream<ImpoundCarMasterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImpoundCarMasterRecord.fromSnapshot(s));

  static Future<ImpoundCarMasterRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ImpoundCarMasterRecord.fromSnapshot(s));

  static ImpoundCarMasterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImpoundCarMasterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImpoundCarMasterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImpoundCarMasterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImpoundCarMasterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImpoundCarMasterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImpoundCarMasterRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ImpoundCarMasterRecordDocumentEquality
    implements Equality<ImpoundCarMasterRecord> {
  const ImpoundCarMasterRecordDocumentEquality();

  @override
  bool equals(ImpoundCarMasterRecord? e1, ImpoundCarMasterRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(
            e1?.impoundCarLocateId, e2?.impoundCarLocateId) &&
        listEquality.equals(e1?.locateName, e2?.locateName) &&
        listEquality.equals(e1?.locateCode, e2?.locateCode);
  }

  @override
  int hash(ImpoundCarMasterRecord? e) => const ListEquality()
      .hash([e?.impoundCarLocateId, e?.locateName, e?.locateCode]);

  @override
  bool isValidKey(Object? o) => o is ImpoundCarMasterRecord;
}
