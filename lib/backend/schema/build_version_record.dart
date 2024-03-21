import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuildVersionRecord extends FirestoreRecord {
  BuildVersionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "app_version" field.
  String? _appVersion;
  String get appVersion => _appVersion ?? '';
  bool hasAppVersion() => _appVersion != null;

  // "app_version_ios" field.
  String? _appVersionIos;
  String get appVersionIos => _appVersionIos ?? '';
  bool hasAppVersionIos() => _appVersionIos != null;

  void _initializeFields() {
    _appVersion = snapshotData['app_version'] as String?;
    _appVersionIos = snapshotData['app_version_ios'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BuildVersion');

  static Stream<BuildVersionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuildVersionRecord.fromSnapshot(s));

  static Future<BuildVersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuildVersionRecord.fromSnapshot(s));

  static BuildVersionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BuildVersionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuildVersionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuildVersionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuildVersionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuildVersionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuildVersionRecordData({
  String? appVersion,
  String? appVersionIos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'app_version': appVersion,
      'app_version_ios': appVersionIos,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuildVersionRecordDocumentEquality
    implements Equality<BuildVersionRecord> {
  const BuildVersionRecordDocumentEquality();

  @override
  bool equals(BuildVersionRecord? e1, BuildVersionRecord? e2) {
    return e1?.appVersion == e2?.appVersion &&
        e1?.appVersionIos == e2?.appVersionIos;
  }

  @override
  int hash(BuildVersionRecord? e) =>
      const ListEquality().hash([e?.appVersion, e?.appVersionIos]);

  @override
  bool isValidKey(Object? o) => o is BuildVersionRecord;
}
