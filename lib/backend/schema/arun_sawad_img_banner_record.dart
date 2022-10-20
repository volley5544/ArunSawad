import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'arun_sawad_img_banner_record.g.dart';

abstract class ArunSawadImgBannerRecord
    implements
        Built<ArunSawadImgBannerRecord, ArunSawadImgBannerRecordBuilder> {
  static Serializer<ArunSawadImgBannerRecord> get serializer =>
      _$arunSawadImgBannerRecordSerializer;

  @BuiltValueField(wireName: 'img_url')
  BuiltList<String>? get imgUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ArunSawadImgBannerRecordBuilder builder) =>
      builder..imgUrl = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ArunSawadImgBanner');

  static Stream<ArunSawadImgBannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ArunSawadImgBannerRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ArunSawadImgBannerRecord._();
  factory ArunSawadImgBannerRecord(
          [void Function(ArunSawadImgBannerRecordBuilder) updates]) =
      _$ArunSawadImgBannerRecord;

  static ArunSawadImgBannerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createArunSawadImgBannerRecordData() {
  final firestoreData = serializers.toFirestore(
    ArunSawadImgBannerRecord.serializer,
    ArunSawadImgBannerRecord(
      (a) => a..imgUrl = null,
    ),
  );

  return firestoreData;
}
