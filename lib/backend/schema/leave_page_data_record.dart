import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'leave_page_data_record.g.dart';

abstract class LeavePageDataRecord
    implements Built<LeavePageDataRecord, LeavePageDataRecordBuilder> {
  static Serializer<LeavePageDataRecord> get serializer =>
      _$leavePageDataRecordSerializer;

  @BuiltValueField(wireName: 'leave_type_list')
  BuiltList<String>? get leaveTypeList;

  @BuiltValueField(wireName: 'reason_to_leave')
  BuiltList<String>? get reasonToLeave;

  @BuiltValueField(wireName: 'company_asset')
  BuiltList<String>? get companyAsset;

  @BuiltValueField(wireName: 'days_leave_type_list')
  BuiltList<String>? get daysLeaveTypeList;

  bool? get showSendEmailBtn;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LeavePageDataRecordBuilder builder) => builder
    ..leaveTypeList = ListBuilder()
    ..reasonToLeave = ListBuilder()
    ..companyAsset = ListBuilder()
    ..daysLeaveTypeList = ListBuilder()
    ..showSendEmailBtn = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LeavePageData');

  static Stream<LeavePageDataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LeavePageDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LeavePageDataRecord._();
  factory LeavePageDataRecord(
          [void Function(LeavePageDataRecordBuilder) updates]) =
      _$LeavePageDataRecord;

  static LeavePageDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLeavePageDataRecordData({
  bool? showSendEmailBtn,
}) {
  final firestoreData = serializers.toFirestore(
    LeavePageDataRecord.serializer,
    LeavePageDataRecord(
      (l) => l
        ..leaveTypeList = null
        ..reasonToLeave = null
        ..companyAsset = null
        ..daysLeaveTypeList = null
        ..showSendEmailBtn = showSendEmailBtn,
    ),
  );

  return firestoreData;
}
