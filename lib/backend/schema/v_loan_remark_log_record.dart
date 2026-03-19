import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VLoanRemarkLogRecord extends FirestoreRecord {
  VLoanRemarkLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "func" field.
  String? _func;
  String get func => _func ?? '';
  bool hasFunc() => _func != null;

  // "menu" field.
  String? _menu;
  String get menu => _menu ?? '';
  bool hasMenu() => _menu != null;

  // "record_id" field.
  String? _recordId;
  String get recordId => _recordId ?? '';
  bool hasRecordId() => _recordId != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "request_body" field.
  VloanRemarkRequestModelStruct? _requestBody;
  VloanRemarkRequestModelStruct get requestBody =>
      _requestBody ?? VloanRemarkRequestModelStruct();
  bool hasRequestBody() => _requestBody != null;

  // "response_body" field.
  VloanRemarkResponseModelStruct? _responseBody;
  VloanRemarkResponseModelStruct get responseBody =>
      _responseBody ?? VloanRemarkResponseModelStruct();
  bool hasResponseBody() => _responseBody != null;

  // "cont_no" field.
  String? _contNo;
  String get contNo => _contNo ?? '';
  bool hasContNo() => _contNo != null;

  void _initializeFields() {
    _func = snapshotData['func'] as String?;
    _menu = snapshotData['menu'] as String?;
    _recordId = snapshotData['record_id'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _requestBody = snapshotData['request_body'] is VloanRemarkRequestModelStruct
        ? snapshotData['request_body']
        : VloanRemarkRequestModelStruct.maybeFromMap(
            snapshotData['request_body']);
    _responseBody =
        snapshotData['response_body'] is VloanRemarkResponseModelStruct
            ? snapshotData['response_body']
            : VloanRemarkResponseModelStruct.maybeFromMap(
                snapshotData['response_body']);
    _contNo = snapshotData['cont_no'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VLoanRemarkLog');

  static Stream<VLoanRemarkLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VLoanRemarkLogRecord.fromSnapshot(s));

  static Future<VLoanRemarkLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VLoanRemarkLogRecord.fromSnapshot(s));

  static VLoanRemarkLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VLoanRemarkLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VLoanRemarkLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VLoanRemarkLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VLoanRemarkLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VLoanRemarkLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVLoanRemarkLogRecordData({
  String? func,
  String? menu,
  String? recordId,
  DateTime? time,
  VloanRemarkRequestModelStruct? requestBody,
  VloanRemarkResponseModelStruct? responseBody,
  String? contNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'func': func,
      'menu': menu,
      'record_id': recordId,
      'time': time,
      'request_body': VloanRemarkRequestModelStruct().toMap(),
      'response_body': VloanRemarkResponseModelStruct().toMap(),
      'cont_no': contNo,
    }.withoutNulls,
  );

  // Handle nested data for "request_body" field.
  addVloanRemarkRequestModelStructData(
      firestoreData, requestBody, 'request_body');

  // Handle nested data for "response_body" field.
  addVloanRemarkResponseModelStructData(
      firestoreData, responseBody, 'response_body');

  return firestoreData;
}

class VLoanRemarkLogRecordDocumentEquality
    implements Equality<VLoanRemarkLogRecord> {
  const VLoanRemarkLogRecordDocumentEquality();

  @override
  bool equals(VLoanRemarkLogRecord? e1, VLoanRemarkLogRecord? e2) {
    return e1?.func == e2?.func &&
        e1?.menu == e2?.menu &&
        e1?.recordId == e2?.recordId &&
        e1?.time == e2?.time &&
        e1?.requestBody == e2?.requestBody &&
        e1?.responseBody == e2?.responseBody &&
        e1?.contNo == e2?.contNo;
  }

  @override
  int hash(VLoanRemarkLogRecord? e) => const ListEquality().hash([
        e?.func,
        e?.menu,
        e?.recordId,
        e?.time,
        e?.requestBody,
        e?.responseBody,
        e?.contNo
      ]);

  @override
  bool isValidKey(Object? o) => o is VLoanRemarkLogRecord;
}
