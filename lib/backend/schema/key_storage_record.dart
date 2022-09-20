import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'key_storage_record.g.dart';

abstract class KeyStorageRecord
    implements Built<KeyStorageRecord, KeyStorageRecordBuilder> {
  static Serializer<KeyStorageRecord> get serializer =>
      _$keyStorageRecordSerializer;

  @BuiltValueField(wireName: 'api_URL')
  String? get apiURL;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(KeyStorageRecordBuilder builder) =>
      builder..apiURL = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Key_Storage');

  static Stream<KeyStorageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<KeyStorageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  KeyStorageRecord._();
  factory KeyStorageRecord([void Function(KeyStorageRecordBuilder) updates]) =
      _$KeyStorageRecord;

  static KeyStorageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createKeyStorageRecordData({
  String? apiURL,
}) {
  final firestoreData = serializers.toFirestore(
    KeyStorageRecord.serializer,
    KeyStorageRecord(
      (k) => k..apiURL = apiURL,
    ),
  );

  return firestoreData;
}
