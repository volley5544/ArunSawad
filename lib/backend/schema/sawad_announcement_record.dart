import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sawad_announcement_record.g.dart';

abstract class SawadAnnouncementRecord
    implements Built<SawadAnnouncementRecord, SawadAnnouncementRecordBuilder> {
  static Serializer<SawadAnnouncementRecord> get serializer =>
      _$sawadAnnouncementRecordSerializer;

  String? get title;

  @BuiltValueField(wireName: 'announce_date')
  String? get announceDate;

  String? get body;

  @BuiltValueField(wireName: 'pdf_url')
  String? get pdfUrl;

  int? get order;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SawadAnnouncementRecordBuilder builder) =>
      builder
        ..title = ''
        ..announceDate = ''
        ..body = ''
        ..pdfUrl = ''
        ..order = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SawadAnnouncement');

  static Stream<SawadAnnouncementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SawadAnnouncementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SawadAnnouncementRecord._();
  factory SawadAnnouncementRecord(
          [void Function(SawadAnnouncementRecordBuilder) updates]) =
      _$SawadAnnouncementRecord;

  static SawadAnnouncementRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSawadAnnouncementRecordData({
  String? title,
  String? announceDate,
  String? body,
  String? pdfUrl,
  int? order,
}) {
  final firestoreData = serializers.toFirestore(
    SawadAnnouncementRecord.serializer,
    SawadAnnouncementRecord(
      (s) => s
        ..title = title
        ..announceDate = announceDate
        ..body = body
        ..pdfUrl = pdfUrl
        ..order = order,
    ),
  );

  return firestoreData;
}
