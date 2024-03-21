import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCheckinLogRecord extends FirestoreRecord {
  UserCheckinLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  // "checkin_date" field.
  String? _checkinDate;
  String get checkinDate => _checkinDate ?? '';
  bool hasCheckinDate() => _checkinDate != null;

  // "checkin_time" field.
  List<String>? _checkinTime;
  List<String> get checkinTime => _checkinTime ?? const [];
  bool hasCheckinTime() => _checkinTime != null;

  // "checkin_img_url" field.
  List<String>? _checkinImgUrl;
  List<String> get checkinImgUrl => _checkinImgUrl ?? const [];
  bool hasCheckinImgUrl() => _checkinImgUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _employeeId = snapshotData['employee_id'] as String?;
    _checkinDate = snapshotData['checkin_date'] as String?;
    _checkinTime = getDataList(snapshotData['checkin_time']);
    _checkinImgUrl = getDataList(snapshotData['checkin_img_url']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_checkin_log')
          : FirebaseFirestore.instance.collectionGroup('user_checkin_log');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_checkin_log').doc(id);

  static Stream<UserCheckinLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCheckinLogRecord.fromSnapshot(s));

  static Future<UserCheckinLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCheckinLogRecord.fromSnapshot(s));

  static UserCheckinLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCheckinLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCheckinLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCheckinLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCheckinLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCheckinLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCheckinLogRecordData({
  String? employeeId,
  String? checkinDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employee_id': employeeId,
      'checkin_date': checkinDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCheckinLogRecordDocumentEquality
    implements Equality<UserCheckinLogRecord> {
  const UserCheckinLogRecordDocumentEquality();

  @override
  bool equals(UserCheckinLogRecord? e1, UserCheckinLogRecord? e2) {
    const listEquality = ListEquality();
    return e1?.employeeId == e2?.employeeId &&
        e1?.checkinDate == e2?.checkinDate &&
        listEquality.equals(e1?.checkinTime, e2?.checkinTime) &&
        listEquality.equals(e1?.checkinImgUrl, e2?.checkinImgUrl);
  }

  @override
  int hash(UserCheckinLogRecord? e) => const ListEquality()
      .hash([e?.employeeId, e?.checkinDate, e?.checkinTime, e?.checkinImgUrl]);

  @override
  bool isValidKey(Object? o) => o is UserCheckinLogRecord;
}
