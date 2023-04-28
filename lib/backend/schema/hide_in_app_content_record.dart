import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'hide_in_app_content_record.g.dart';

abstract class HideInAppContentRecord
    implements Built<HideInAppContentRecord, HideInAppContentRecordBuilder> {
  static Serializer<HideInAppContentRecord> get serializer =>
      _$hideInAppContentRecordSerializer;

  @BuiltValueField(wireName: 'content_name')
  String? get contentName;

  bool? get isShowContent;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(HideInAppContentRecordBuilder builder) =>
      builder
        ..contentName = ''
        ..isShowContent = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hideInAppContent');

  static Stream<HideInAppContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<HideInAppContentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  HideInAppContentRecord._();
  factory HideInAppContentRecord(
          [void Function(HideInAppContentRecordBuilder) updates]) =
      _$HideInAppContentRecord;

  static HideInAppContentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createHideInAppContentRecordData({
  String? contentName,
  bool? isShowContent,
}) {
  final firestoreData = serializers.toFirestore(
    HideInAppContentRecord.serializer,
    HideInAppContentRecord(
      (h) => h
        ..contentName = contentName
        ..isShowContent = isShowContent,
    ),
  );

  return firestoreData;
}
