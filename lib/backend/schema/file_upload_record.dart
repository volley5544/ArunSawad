import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'file_upload_record.g.dart';

abstract class FileUploadRecord
    implements Built<FileUploadRecord, FileUploadRecordBuilder> {
  static Serializer<FileUploadRecord> get serializer =>
      _$fileUploadRecordSerializer;

  @BuiltValueField(wireName: 'RecordId')
  String? get recordId;

  @BuiltValueField(wireName: 'img_url')
  BuiltList<String>? get imgUrl;

  @BuiltValueField(wireName: 'pic_datetime')
  DateTime? get picDatetime;

  @BuiltValueField(wireName: 'pic_coordinate')
  String? get picCoordinate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FileUploadRecordBuilder builder) => builder
    ..recordId = ''
    ..imgUrl = ListBuilder()
    ..picCoordinate = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FileUpload');

  static Stream<FileUploadRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FileUploadRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FileUploadRecord._();
  factory FileUploadRecord([void Function(FileUploadRecordBuilder) updates]) =
      _$FileUploadRecord;

  static FileUploadRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFileUploadRecordData({
  String? recordId,
  DateTime? picDatetime,
  String? picCoordinate,
}) {
  final firestoreData = serializers.toFirestore(
    FileUploadRecord.serializer,
    FileUploadRecord(
      (f) => f
        ..recordId = recordId
        ..imgUrl = null
        ..picDatetime = picDatetime
        ..picCoordinate = picCoordinate,
    ),
  );

  return firestoreData;
}
