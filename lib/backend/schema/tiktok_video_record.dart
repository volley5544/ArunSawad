import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tiktok_video_record.g.dart';

abstract class TiktokVideoRecord
    implements Built<TiktokVideoRecord, TiktokVideoRecordBuilder> {
  static Serializer<TiktokVideoRecord> get serializer =>
      _$tiktokVideoRecordSerializer;

  BuiltList<String>? get tiktokList;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TiktokVideoRecordBuilder builder) =>
      builder..tiktokList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tiktokVideo');

  static Stream<TiktokVideoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TiktokVideoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TiktokVideoRecord._();
  factory TiktokVideoRecord([void Function(TiktokVideoRecordBuilder) updates]) =
      _$TiktokVideoRecord;

  static TiktokVideoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTiktokVideoRecordData() {
  final firestoreData = serializers.toFirestore(
    TiktokVideoRecord.serializer,
    TiktokVideoRecord(
      (t) => t..tiktokList = null,
    ),
  );

  return firestoreData;
}
