import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsRecord extends FirestoreRecord {
  LocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  bool hasBranchCode() => _branchCode != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  bool hasBranchName() => _branchName != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  bool hasLongitude() => _longitude != null;

  // "radius" field.
  String? _radius;
  String get radius => _radius ?? '';
  bool hasRadius() => _radius != null;

  // "company_code" field.
  String? _companyCode;
  String get companyCode => _companyCode ?? '';
  bool hasCompanyCode() => _companyCode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _branchCode = snapshotData['branch_code'] as String?;
    _branchName = snapshotData['branch_name'] as String?;
    _latitude = snapshotData['latitude'] as String?;
    _longitude = snapshotData['longitude'] as String?;
    _radius = snapshotData['radius'] as String?;
    _companyCode = snapshotData['company_code'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('locations')
          : FirebaseFirestore.instance.collectionGroup('locations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('locations').doc(id);

  static Stream<LocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationsRecord.fromSnapshot(s));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationsRecord.fromSnapshot(s));

  static LocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationsRecordData({
  String? branchCode,
  String? branchName,
  String? latitude,
  String? longitude,
  String? radius,
  String? companyCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'branch_code': branchCode,
      'branch_name': branchName,
      'latitude': latitude,
      'longitude': longitude,
      'radius': radius,
      'company_code': companyCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationsRecordDocumentEquality implements Equality<LocationsRecord> {
  const LocationsRecordDocumentEquality();

  @override
  bool equals(LocationsRecord? e1, LocationsRecord? e2) {
    return e1?.branchCode == e2?.branchCode &&
        e1?.branchName == e2?.branchName &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.radius == e2?.radius &&
        e1?.companyCode == e2?.companyCode;
  }

  @override
  int hash(LocationsRecord? e) => const ListEquality().hash([
        e?.branchCode,
        e?.branchName,
        e?.latitude,
        e?.longitude,
        e?.radius,
        e?.companyCode
      ]);

  @override
  bool isValidKey(Object? o) => o is LocationsRecord;
}
