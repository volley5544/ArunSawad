import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'f_c_m_token_record.g.dart';

abstract class FCMTokenRecord
    implements Built<FCMTokenRecord, FCMTokenRecordBuilder> {
  static Serializer<FCMTokenRecord> get serializer =>
      _$fCMTokenRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'device_type')
  String? get deviceType;

  @BuiltValueField(wireName: 'fcm_token')
  String? get fcmToken;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'employee_id')
  String? get employeeId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FCMTokenRecordBuilder builder) => builder
    ..deviceType = ''
    ..fcmToken = ''
    ..employeeId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FCM_Token');

  static Stream<FCMTokenRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FCMTokenRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FCMTokenRecord._();
  factory FCMTokenRecord([void Function(FCMTokenRecordBuilder) updates]) =
      _$FCMTokenRecord;

  static FCMTokenRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFCMTokenRecordData({
  DateTime? createdAt,
  String? deviceType,
  String? fcmToken,
  DocumentReference? userRef,
  String? employeeId,
}) {
  final firestoreData = serializers.toFirestore(
    FCMTokenRecord.serializer,
    FCMTokenRecord(
      (f) => f
        ..createdAt = createdAt
        ..deviceType = deviceType
        ..fcmToken = fcmToken
        ..userRef = userRef
        ..employeeId = employeeId,
    ),
  );

  return firestoreData;
}
