import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'key_storage2_record.g.dart';

abstract class KeyStorage2Record
    implements Built<KeyStorage2Record, KeyStorage2RecordBuilder> {
  static Serializer<KeyStorage2Record> get serializer =>
      _$keyStorage2RecordSerializer;

  @BuiltValueField(wireName: 'uat_api_url')
  String? get uatApiUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(KeyStorage2RecordBuilder builder) =>
      builder..uatApiUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Key_Storage2');

  static Stream<KeyStorage2Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<KeyStorage2Record> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  KeyStorage2Record._();
  factory KeyStorage2Record([void Function(KeyStorage2RecordBuilder) updates]) =
      _$KeyStorage2Record;

  static KeyStorage2Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createKeyStorage2RecordData({
  String? uatApiUrl,
}) {
  final firestoreData = serializers.toFirestore(
    KeyStorage2Record.serializer,
    KeyStorage2Record(
      (k) => k..uatApiUrl = uatApiUrl,
    ),
  );

  return firestoreData;
}
