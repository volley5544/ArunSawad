import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sawad_form_services_record.g.dart';

abstract class SawadFormServicesRecord
    implements Built<SawadFormServicesRecord, SawadFormServicesRecordBuilder> {
  static Serializer<SawadFormServicesRecord> get serializer =>
      _$sawadFormServicesRecordSerializer;

  @BuiltValueField(wireName: 'form_service_img')
  String? get formServiceImg;

  @BuiltValueField(wireName: 'form_service_url')
  String? get formServiceUrl;

  @BuiltValueField(wireName: 'form_service_name')
  String? get formServiceName;

  @BuiltValueField(wireName: 'form_service_order')
  int? get formServiceOrder;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SawadFormServicesRecordBuilder builder) =>
      builder
        ..formServiceImg = ''
        ..formServiceUrl = ''
        ..formServiceName = ''
        ..formServiceOrder = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SawadFormServices');

  static Stream<SawadFormServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SawadFormServicesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SawadFormServicesRecord._();
  factory SawadFormServicesRecord(
          [void Function(SawadFormServicesRecordBuilder) updates]) =
      _$SawadFormServicesRecord;

  static SawadFormServicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSawadFormServicesRecordData({
  String? formServiceImg,
  String? formServiceUrl,
  String? formServiceName,
  int? formServiceOrder,
}) {
  final firestoreData = serializers.toFirestore(
    SawadFormServicesRecord.serializer,
    SawadFormServicesRecord(
      (s) => s
        ..formServiceImg = formServiceImg
        ..formServiceUrl = formServiceUrl
        ..formServiceName = formServiceName
        ..formServiceOrder = formServiceOrder,
    ),
  );

  return firestoreData;
}
