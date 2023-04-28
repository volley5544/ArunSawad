import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'splash_page_holiday_img_record.g.dart';

abstract class SplashPageHolidayImgRecord
    implements
        Built<SplashPageHolidayImgRecord, SplashPageHolidayImgRecordBuilder> {
  static Serializer<SplashPageHolidayImgRecord> get serializer =>
      _$splashPageHolidayImgRecordSerializer;

  @BuiltValueField(wireName: 'HolidayImg')
  BuiltList<String>? get holidayImg;

  @BuiltValueField(wireName: 'Date')
  DateTime? get date;

  @BuiltValueField(wireName: 'DateExp')
  DateTime? get dateExp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SplashPageHolidayImgRecordBuilder builder) =>
      builder..holidayImg = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SplashPageHolidayImg');

  static Stream<SplashPageHolidayImgRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SplashPageHolidayImgRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SplashPageHolidayImgRecord._();
  factory SplashPageHolidayImgRecord(
          [void Function(SplashPageHolidayImgRecordBuilder) updates]) =
      _$SplashPageHolidayImgRecord;

  static SplashPageHolidayImgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSplashPageHolidayImgRecordData({
  DateTime? date,
  DateTime? dateExp,
}) {
  final firestoreData = serializers.toFirestore(
    SplashPageHolidayImgRecord.serializer,
    SplashPageHolidayImgRecord(
      (s) => s
        ..holidayImg = null
        ..date = date
        ..dateExp = dateExp,
    ),
  );

  return firestoreData;
}
