import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'url_link_storage_record.g.dart';

abstract class UrlLinkStorageRecord
    implements Built<UrlLinkStorageRecord, UrlLinkStorageRecordBuilder> {
  static Serializer<UrlLinkStorageRecord> get serializer =>
      _$urlLinkStorageRecordSerializer;

  @BuiltValueField(wireName: 'url_name')
  String? get urlName;

  @BuiltValueField(wireName: 'url_link')
  String? get urlLink;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UrlLinkStorageRecordBuilder builder) => builder
    ..urlName = ''
    ..urlLink = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('urlLinkStorage');

  static Stream<UrlLinkStorageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UrlLinkStorageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UrlLinkStorageRecord._();
  factory UrlLinkStorageRecord(
          [void Function(UrlLinkStorageRecordBuilder) updates]) =
      _$UrlLinkStorageRecord;

  static UrlLinkStorageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUrlLinkStorageRecordData({
  String? urlName,
  String? urlLink,
}) {
  final firestoreData = serializers.toFirestore(
    UrlLinkStorageRecord.serializer,
    UrlLinkStorageRecord(
      (u) => u
        ..urlName = urlName
        ..urlLink = urlLink,
    ),
  );

  return firestoreData;
}
