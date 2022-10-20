import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'lead_channel_color_record.g.dart';

abstract class LeadChannelColorRecord
    implements Built<LeadChannelColorRecord, LeadChannelColorRecordBuilder> {
  static Serializer<LeadChannelColorRecord> get serializer =>
      _$leadChannelColorRecordSerializer;

  BuiltList<Color>? get color;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LeadChannelColorRecordBuilder builder) =>
      builder..color = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LeadChannelColor');

  static Stream<LeadChannelColorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LeadChannelColorRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LeadChannelColorRecord._();
  factory LeadChannelColorRecord(
          [void Function(LeadChannelColorRecordBuilder) updates]) =
      _$LeadChannelColorRecord;

  static LeadChannelColorRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLeadChannelColorRecordData() {
  final firestoreData = serializers.toFirestore(
    LeadChannelColorRecord.serializer,
    LeadChannelColorRecord(
      (l) => l..color = null,
    ),
  );

  return firestoreData;
}
