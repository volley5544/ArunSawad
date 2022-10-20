import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'splash_page_img_record.g.dart';

abstract class SplashPageImgRecord
    implements Built<SplashPageImgRecord, SplashPageImgRecordBuilder> {
  static Serializer<SplashPageImgRecord> get serializer =>
      _$splashPageImgRecordSerializer;

  String? get day;

  BuiltList<String>? get imgURL;

  BuiltList<String>? get text;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SplashPageImgRecordBuilder builder) => builder
    ..day = ''
    ..imgURL = ListBuilder()
    ..text = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SplashPageImg');

  static Stream<SplashPageImgRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SplashPageImgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SplashPageImgRecord._();
  factory SplashPageImgRecord(
          [void Function(SplashPageImgRecordBuilder) updates]) =
      _$SplashPageImgRecord;

  static SplashPageImgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSplashPageImgRecordData({
  String? day,
}) {
  final firestoreData = serializers.toFirestore(
    SplashPageImgRecord.serializer,
    SplashPageImgRecord(
      (s) => s
        ..day = day
        ..imgURL = null
        ..text = null,
    ),
  );

  return firestoreData;
}
