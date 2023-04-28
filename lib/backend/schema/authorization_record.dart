import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'authorization_record.g.dart';

abstract class AuthorizationRecord
    implements Built<AuthorizationRecord, AuthorizationRecordBuilder> {
  static Serializer<AuthorizationRecord> get serializer =>
      _$authorizationRecordSerializer;

  @BuiltValueField(wireName: 'content_name')
  String? get contentName;

  @BuiltValueField(wireName: 'employee_id_list')
  BuiltList<String>? get employeeIdList;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AuthorizationRecordBuilder builder) => builder
    ..contentName = ''
    ..employeeIdList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Authorization');

  static Stream<AuthorizationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AuthorizationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AuthorizationRecord._();
  factory AuthorizationRecord(
          [void Function(AuthorizationRecordBuilder) updates]) =
      _$AuthorizationRecord;

  static AuthorizationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAuthorizationRecordData({
  String? contentName,
}) {
  final firestoreData = serializers.toFirestore(
    AuthorizationRecord.serializer,
    AuthorizationRecord(
      (a) => a
        ..contentName = contentName
        ..employeeIdList = null,
    ),
  );

  return firestoreData;
}
