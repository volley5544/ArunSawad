import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'material_record.g.dart';

abstract class MaterialRecord
    implements Built<MaterialRecord, MaterialRecordBuilder> {
  static Serializer<MaterialRecord> get serializer =>
      _$materialRecordSerializer;

  @BuiltValueField(wireName: 'matetial_name')
  String? get matetialName;

  @BuiltValueField(wireName: 'img_url')
  String? get imgUrl;

  @BuiltValueField(wireName: 'record_id')
  int? get recordId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MaterialRecordBuilder builder) => builder
    ..matetialName = ''
    ..imgUrl = ''
    ..recordId = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('material');

  static Stream<MaterialRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MaterialRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MaterialRecord._();
  factory MaterialRecord([void Function(MaterialRecordBuilder) updates]) =
      _$MaterialRecord;

  static MaterialRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMaterialRecordData({
  String? matetialName,
  String? imgUrl,
  int? recordId,
}) {
  final firestoreData = serializers.toFirestore(
    MaterialRecord.serializer,
    MaterialRecord(
      (m) => m
        ..matetialName = matetialName
        ..imgUrl = imgUrl
        ..recordId = recordId,
    ),
  );

  return firestoreData;
}
