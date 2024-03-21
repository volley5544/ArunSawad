import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialRecord extends FirestoreRecord {
  MaterialRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "matetial_name" field.
  String? _matetialName;
  String get matetialName => _matetialName ?? '';
  bool hasMatetialName() => _matetialName != null;

  // "img_url" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "record_id" field.
  int? _recordId;
  int get recordId => _recordId ?? 0;
  bool hasRecordId() => _recordId != null;

  // "phone" field.
  List<String>? _phone;
  List<String> get phone => _phone ?? const [];
  bool hasPhone() => _phone != null;

  // "name" field.
  List<String>? _name;
  List<String> get name => _name ?? const [];
  bool hasName() => _name != null;

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  void _initializeFields() {
    _matetialName = snapshotData['matetial_name'] as String?;
    _imgUrl = snapshotData['img_url'] as String?;
    _recordId = castToType<int>(snapshotData['record_id']);
    _phone = getDataList(snapshotData['phone']);
    _name = getDataList(snapshotData['name']);
    _employeeId = snapshotData['employee_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('material');

  static Stream<MaterialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialRecord.fromSnapshot(s));

  static Future<MaterialRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialRecord.fromSnapshot(s));

  static MaterialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialRecordData({
  String? matetialName,
  String? imgUrl,
  int? recordId,
  String? employeeId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'matetial_name': matetialName,
      'img_url': imgUrl,
      'record_id': recordId,
      'employee_id': employeeId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialRecordDocumentEquality implements Equality<MaterialRecord> {
  const MaterialRecordDocumentEquality();

  @override
  bool equals(MaterialRecord? e1, MaterialRecord? e2) {
    const listEquality = ListEquality();
    return e1?.matetialName == e2?.matetialName &&
        e1?.imgUrl == e2?.imgUrl &&
        e1?.recordId == e2?.recordId &&
        listEquality.equals(e1?.phone, e2?.phone) &&
        listEquality.equals(e1?.name, e2?.name) &&
        e1?.employeeId == e2?.employeeId;
  }

  @override
  int hash(MaterialRecord? e) => const ListEquality().hash([
        e?.matetialName,
        e?.imgUrl,
        e?.recordId,
        e?.phone,
        e?.name,
        e?.employeeId
      ]);

  @override
  bool isValidKey(Object? o) => o is MaterialRecord;
}
