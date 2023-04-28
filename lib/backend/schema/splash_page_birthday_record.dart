import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'splash_page_birthday_record.g.dart';

abstract class SplashPageBirthdayRecord
    implements
        Built<SplashPageBirthdayRecord, SplashPageBirthdayRecordBuilder> {
  static Serializer<SplashPageBirthdayRecord> get serializer =>
      _$splashPageBirthdayRecordSerializer;

  @BuiltValueField(wireName: 'BirthDateImg')
  BuiltList<String>? get birthDateImg;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SplashPageBirthdayRecordBuilder builder) =>
      builder..birthDateImg = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SplashPageBirthday');

  static Stream<SplashPageBirthdayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SplashPageBirthdayRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SplashPageBirthdayRecord._();
  factory SplashPageBirthdayRecord(
          [void Function(SplashPageBirthdayRecordBuilder) updates]) =
      _$SplashPageBirthdayRecord;

  static SplashPageBirthdayRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSplashPageBirthdayRecordData() {
  final firestoreData = serializers.toFirestore(
    SplashPageBirthdayRecord.serializer,
    SplashPageBirthdayRecord(
      (s) => s..birthDateImg = null,
    ),
  );

  return firestoreData;
}
