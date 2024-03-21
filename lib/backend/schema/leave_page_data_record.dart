import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeavePageDataRecord extends FirestoreRecord {
  LeavePageDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "leave_type_list" field.
  List<String>? _leaveTypeList;
  List<String> get leaveTypeList => _leaveTypeList ?? const [];
  bool hasLeaveTypeList() => _leaveTypeList != null;

  // "reason_to_leave" field.
  List<String>? _reasonToLeave;
  List<String> get reasonToLeave => _reasonToLeave ?? const [];
  bool hasReasonToLeave() => _reasonToLeave != null;

  // "company_asset" field.
  List<String>? _companyAsset;
  List<String> get companyAsset => _companyAsset ?? const [];
  bool hasCompanyAsset() => _companyAsset != null;

  // "days_leave_type_list" field.
  List<String>? _daysLeaveTypeList;
  List<String> get daysLeaveTypeList => _daysLeaveTypeList ?? const [];
  bool hasDaysLeaveTypeList() => _daysLeaveTypeList != null;

  // "showSendEmailBtn" field.
  bool? _showSendEmailBtn;
  bool get showSendEmailBtn => _showSendEmailBtn ?? false;
  bool hasShowSendEmailBtn() => _showSendEmailBtn != null;

  void _initializeFields() {
    _leaveTypeList = getDataList(snapshotData['leave_type_list']);
    _reasonToLeave = getDataList(snapshotData['reason_to_leave']);
    _companyAsset = getDataList(snapshotData['company_asset']);
    _daysLeaveTypeList = getDataList(snapshotData['days_leave_type_list']);
    _showSendEmailBtn = snapshotData['showSendEmailBtn'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LeavePageData');

  static Stream<LeavePageDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeavePageDataRecord.fromSnapshot(s));

  static Future<LeavePageDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeavePageDataRecord.fromSnapshot(s));

  static LeavePageDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeavePageDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeavePageDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeavePageDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeavePageDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeavePageDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeavePageDataRecordData({
  bool? showSendEmailBtn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'showSendEmailBtn': showSendEmailBtn,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeavePageDataRecordDocumentEquality
    implements Equality<LeavePageDataRecord> {
  const LeavePageDataRecordDocumentEquality();

  @override
  bool equals(LeavePageDataRecord? e1, LeavePageDataRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.leaveTypeList, e2?.leaveTypeList) &&
        listEquality.equals(e1?.reasonToLeave, e2?.reasonToLeave) &&
        listEquality.equals(e1?.companyAsset, e2?.companyAsset) &&
        listEquality.equals(e1?.daysLeaveTypeList, e2?.daysLeaveTypeList) &&
        e1?.showSendEmailBtn == e2?.showSendEmailBtn;
  }

  @override
  int hash(LeavePageDataRecord? e) => const ListEquality().hash([
        e?.leaveTypeList,
        e?.reasonToLeave,
        e?.companyAsset,
        e?.daysLeaveTypeList,
        e?.showSendEmailBtn
      ]);

  @override
  bool isValidKey(Object? o) => o is LeavePageDataRecord;
}
