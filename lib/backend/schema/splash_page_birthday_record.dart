import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SplashPageBirthdayRecord extends FirestoreRecord {
  SplashPageBirthdayRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "BirthDateImg" field.
  List<String>? _birthDateImg;
  List<String> get birthDateImg => _birthDateImg ?? const [];
  bool hasBirthDateImg() => _birthDateImg != null;

  void _initializeFields() {
    _birthDateImg = getDataList(snapshotData['BirthDateImg']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SplashPageBirthday');

  static Stream<SplashPageBirthdayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SplashPageBirthdayRecord.fromSnapshot(s));

  static Future<SplashPageBirthdayRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SplashPageBirthdayRecord.fromSnapshot(s));

  static SplashPageBirthdayRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SplashPageBirthdayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SplashPageBirthdayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SplashPageBirthdayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SplashPageBirthdayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SplashPageBirthdayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSplashPageBirthdayRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SplashPageBirthdayRecordDocumentEquality
    implements Equality<SplashPageBirthdayRecord> {
  const SplashPageBirthdayRecordDocumentEquality();

  @override
  bool equals(SplashPageBirthdayRecord? e1, SplashPageBirthdayRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.birthDateImg, e2?.birthDateImg);
  }

  @override
  int hash(SplashPageBirthdayRecord? e) =>
      const ListEquality().hash([e?.birthDateImg]);

  @override
  bool isValidKey(Object? o) => o is SplashPageBirthdayRecord;
}
