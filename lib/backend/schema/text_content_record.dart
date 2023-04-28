import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'text_content_record.g.dart';

abstract class TextContentRecord
    implements Built<TextContentRecord, TextContentRecordBuilder> {
  static Serializer<TextContentRecord> get serializer =>
      _$textContentRecordSerializer;

  String? get kpiText;

  Color? get kpiTextcolor;

  bool? get kpiHideText;

  String? get contentName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TextContentRecordBuilder builder) => builder
    ..kpiText = ''
    ..kpiHideText = false
    ..contentName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('textContent');

  static Stream<TextContentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TextContentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TextContentRecord._();
  factory TextContentRecord([void Function(TextContentRecordBuilder) updates]) =
      _$TextContentRecord;

  static TextContentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTextContentRecordData({
  String? kpiText,
  Color? kpiTextcolor,
  bool? kpiHideText,
  String? contentName,
}) {
  final firestoreData = serializers.toFirestore(
    TextContentRecord.serializer,
    TextContentRecord(
      (t) => t
        ..kpiText = kpiText
        ..kpiTextcolor = kpiTextcolor
        ..kpiHideText = kpiHideText
        ..contentName = contentName,
    ),
  );

  return firestoreData;
}
