import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCheckinHistoryRecord extends FirestoreRecord {
  UserCheckinHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  // "checkin_status_date" field.
  List<String>? _checkinStatusDate;
  List<String> get checkinStatusDate => _checkinStatusDate ?? const [];
  bool hasCheckinStatusDate() => _checkinStatusDate != null;

  // "checkin_status_timein" field.
  List<String>? _checkinStatusTimein;
  List<String> get checkinStatusTimein => _checkinStatusTimein ?? const [];
  bool hasCheckinStatusTimein() => _checkinStatusTimein != null;

  // "checkin_status_timeout" field.
  List<String>? _checkinStatusTimeout;
  List<String> get checkinStatusTimeout => _checkinStatusTimeout ?? const [];
  bool hasCheckinStatusTimeout() => _checkinStatusTimeout != null;

  // "checkin_lastmonth_date" field.
  List<String>? _checkinLastmonthDate;
  List<String> get checkinLastmonthDate => _checkinLastmonthDate ?? const [];
  bool hasCheckinLastmonthDate() => _checkinLastmonthDate != null;

  // "checkin_lastmonth_timein" field.
  List<String>? _checkinLastmonthTimein;
  List<String> get checkinLastmonthTimein =>
      _checkinLastmonthTimein ?? const [];
  bool hasCheckinLastmonthTimein() => _checkinLastmonthTimein != null;

  // "checkin_lastmonth_timeout" field.
  List<String>? _checkinLastmonthTimeout;
  List<String> get checkinLastmonthTimeout =>
      _checkinLastmonthTimeout ?? const [];
  bool hasCheckinLastmonthTimeout() => _checkinLastmonthTimeout != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _employeeId = snapshotData['employee_id'] as String?;
    _checkinStatusDate = getDataList(snapshotData['checkin_status_date']);
    _checkinStatusTimein = getDataList(snapshotData['checkin_status_timein']);
    _checkinStatusTimeout = getDataList(snapshotData['checkin_status_timeout']);
    _checkinLastmonthDate = getDataList(snapshotData['checkin_lastmonth_date']);
    _checkinLastmonthTimein =
        getDataList(snapshotData['checkin_lastmonth_timein']);
    _checkinLastmonthTimeout =
        getDataList(snapshotData['checkin_lastmonth_timeout']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_checkin_history')
          : FirebaseFirestore.instance.collectionGroup('user_checkin_history');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_checkin_history').doc(id);

  static Stream<UserCheckinHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCheckinHistoryRecord.fromSnapshot(s));

  static Future<UserCheckinHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserCheckinHistoryRecord.fromSnapshot(s));

  static UserCheckinHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCheckinHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCheckinHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCheckinHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCheckinHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCheckinHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCheckinHistoryRecordData({
  String? employeeId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'employee_id': employeeId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCheckinHistoryRecordDocumentEquality
    implements Equality<UserCheckinHistoryRecord> {
  const UserCheckinHistoryRecordDocumentEquality();

  @override
  bool equals(UserCheckinHistoryRecord? e1, UserCheckinHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.employeeId == e2?.employeeId &&
        listEquality.equals(e1?.checkinStatusDate, e2?.checkinStatusDate) &&
        listEquality.equals(e1?.checkinStatusTimein, e2?.checkinStatusTimein) &&
        listEquality.equals(
            e1?.checkinStatusTimeout, e2?.checkinStatusTimeout) &&
        listEquality.equals(
            e1?.checkinLastmonthDate, e2?.checkinLastmonthDate) &&
        listEquality.equals(
            e1?.checkinLastmonthTimein, e2?.checkinLastmonthTimein) &&
        listEquality.equals(
            e1?.checkinLastmonthTimeout, e2?.checkinLastmonthTimeout);
  }

  @override
  int hash(UserCheckinHistoryRecord? e) => const ListEquality().hash([
        e?.employeeId,
        e?.checkinStatusDate,
        e?.checkinStatusTimein,
        e?.checkinStatusTimeout,
        e?.checkinLastmonthDate,
        e?.checkinLastmonthTimein,
        e?.checkinLastmonthTimeout
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCheckinHistoryRecord;
}
