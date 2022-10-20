import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_custom_record.g.dart';

abstract class UserCustomRecord
    implements Built<UserCustomRecord, UserCustomRecordBuilder> {
  static Serializer<UserCustomRecord> get serializer =>
      _$userCustomRecordSerializer;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  String? get email;

  String? get uid;

  @BuiltValueField(wireName: 'img_profile')
  String? get imgProfile;

  @BuiltValueField(wireName: 'employee_id')
  String? get employeeId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserCustomRecordBuilder builder) => builder
    ..email = ''
    ..uid = ''
    ..imgProfile = ''
    ..employeeId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_custom');

  static Stream<UserCustomRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserCustomRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserCustomRecord._();
  factory UserCustomRecord([void Function(UserCustomRecordBuilder) updates]) =
      _$UserCustomRecord;

  static UserCustomRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserCustomRecordData({
  DateTime? createdTime,
  String? email,
  String? uid,
  String? imgProfile,
  String? employeeId,
}) {
  final firestoreData = serializers.toFirestore(
    UserCustomRecord.serializer,
    UserCustomRecord(
      (u) => u
        ..createdTime = createdTime
        ..email = email
        ..uid = uid
        ..imgProfile = imgProfile
        ..employeeId = employeeId,
    ),
  );

  return firestoreData;
}
