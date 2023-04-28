import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promotionimages_record.g.dart';

abstract class PromotionimagesRecord
    implements Built<PromotionimagesRecord, PromotionimagesRecordBuilder> {
  static Serializer<PromotionimagesRecord> get serializer =>
      _$promotionimagesRecordSerializer;

  @BuiltValueField(wireName: 'img_url')
  BuiltList<String>? get imgUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PromotionimagesRecordBuilder builder) =>
      builder..imgUrl = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotionimages');

  static Stream<PromotionimagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromotionimagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromotionimagesRecord._();
  factory PromotionimagesRecord(
          [void Function(PromotionimagesRecordBuilder) updates]) =
      _$PromotionimagesRecord;

  static PromotionimagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromotionimagesRecordData() {
  final firestoreData = serializers.toFirestore(
    PromotionimagesRecord.serializer,
    PromotionimagesRecord(
      (p) => p..imgUrl = null,
    ),
  );

  return firestoreData;
}
