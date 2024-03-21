import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaveDaysAfterRecord extends FirestoreRecord {
  LeaveDaysAfterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "leaveListAllowDay" field.
  List<String>? _leaveListAllowDay;
  List<String> get leaveListAllowDay => _leaveListAllowDay ?? const [];
  bool hasLeaveListAllowDay() => _leaveListAllowDay != null;

  // "leaveListAllowInt" field.
  List<int>? _leaveListAllowInt;
  List<int> get leaveListAllowInt => _leaveListAllowInt ?? const [];
  bool hasLeaveListAllowInt() => _leaveListAllowInt != null;

  void _initializeFields() {
    _leaveListAllowDay = getDataList(snapshotData['leaveListAllowDay']);
    _leaveListAllowInt = getDataList(snapshotData['leaveListAllowInt']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leaveDaysAfter');

  static Stream<LeaveDaysAfterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeaveDaysAfterRecord.fromSnapshot(s));

  static Future<LeaveDaysAfterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeaveDaysAfterRecord.fromSnapshot(s));

  static LeaveDaysAfterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeaveDaysAfterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeaveDaysAfterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeaveDaysAfterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeaveDaysAfterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeaveDaysAfterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeaveDaysAfterRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class LeaveDaysAfterRecordDocumentEquality
    implements Equality<LeaveDaysAfterRecord> {
  const LeaveDaysAfterRecordDocumentEquality();

  @override
  bool equals(LeaveDaysAfterRecord? e1, LeaveDaysAfterRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.leaveListAllowDay, e2?.leaveListAllowDay) &&
        listEquality.equals(e1?.leaveListAllowInt, e2?.leaveListAllowInt);
  }

  @override
  int hash(LeaveDaysAfterRecord? e) =>
      const ListEquality().hash([e?.leaveListAllowDay, e?.leaveListAllowInt]);

  @override
  bool isValidKey(Object? o) => o is LeaveDaysAfterRecord;
}
