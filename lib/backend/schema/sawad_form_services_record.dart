import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SawadFormServicesRecord extends FirestoreRecord {
  SawadFormServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "form_service_img" field.
  String? _formServiceImg;
  String get formServiceImg => _formServiceImg ?? '';
  bool hasFormServiceImg() => _formServiceImg != null;

  // "form_service_url" field.
  String? _formServiceUrl;
  String get formServiceUrl => _formServiceUrl ?? '';
  bool hasFormServiceUrl() => _formServiceUrl != null;

  // "form_service_name" field.
  String? _formServiceName;
  String get formServiceName => _formServiceName ?? '';
  bool hasFormServiceName() => _formServiceName != null;

  // "form_service_order" field.
  int? _formServiceOrder;
  int get formServiceOrder => _formServiceOrder ?? 0;
  bool hasFormServiceOrder() => _formServiceOrder != null;

  void _initializeFields() {
    _formServiceImg = snapshotData['form_service_img'] as String?;
    _formServiceUrl = snapshotData['form_service_url'] as String?;
    _formServiceName = snapshotData['form_service_name'] as String?;
    _formServiceOrder = castToType<int>(snapshotData['form_service_order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SawadFormServices');

  static Stream<SawadFormServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SawadFormServicesRecord.fromSnapshot(s));

  static Future<SawadFormServicesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SawadFormServicesRecord.fromSnapshot(s));

  static SawadFormServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SawadFormServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SawadFormServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SawadFormServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SawadFormServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SawadFormServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSawadFormServicesRecordData({
  String? formServiceImg,
  String? formServiceUrl,
  String? formServiceName,
  int? formServiceOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'form_service_img': formServiceImg,
      'form_service_url': formServiceUrl,
      'form_service_name': formServiceName,
      'form_service_order': formServiceOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class SawadFormServicesRecordDocumentEquality
    implements Equality<SawadFormServicesRecord> {
  const SawadFormServicesRecordDocumentEquality();

  @override
  bool equals(SawadFormServicesRecord? e1, SawadFormServicesRecord? e2) {
    return e1?.formServiceImg == e2?.formServiceImg &&
        e1?.formServiceUrl == e2?.formServiceUrl &&
        e1?.formServiceName == e2?.formServiceName &&
        e1?.formServiceOrder == e2?.formServiceOrder;
  }

  @override
  int hash(SawadFormServicesRecord? e) => const ListEquality().hash([
        e?.formServiceImg,
        e?.formServiceUrl,
        e?.formServiceName,
        e?.formServiceOrder
      ]);

  @override
  bool isValidKey(Object? o) => o is SawadFormServicesRecord;
}
