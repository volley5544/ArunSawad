import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_log_record.g.dart';

abstract class UserLogRecord
    implements Built<UserLogRecord, UserLogRecordBuilder> {
  static Serializer<UserLogRecord> get serializer => _$userLogRecordSerializer;

  @BuiltValueField(wireName: 'employee_id')
  String? get employeeId;

  String? get action;

  @BuiltValueField(wireName: 'action_time')
  DateTime? get actionTime;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'user_location')
  LatLng? get userLocation;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserLogRecordBuilder builder) => builder
    ..employeeId = ''
    ..action = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_log');

  static Stream<UserLogRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserLogRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserLogRecord._();
  factory UserLogRecord([void Function(UserLogRecordBuilder) updates]) =
      _$UserLogRecord;

  static UserLogRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserLogRecordData({
  String? employeeId,
  String? action,
  DateTime? actionTime,
  DocumentReference? userRef,
  LatLng? userLocation,
}) {
  final firestoreData = serializers.toFirestore(
    UserLogRecord.serializer,
    UserLogRecord(
      (u) => u
        ..employeeId = employeeId
        ..action = action
        ..actionTime = actionTime
        ..userRef = userRef
        ..userLocation = userLocation,
    ),
  );

  return firestoreData;
}
