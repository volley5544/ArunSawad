import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mat1_record.g.dart';

abstract class Mat1Record implements Built<Mat1Record, Mat1RecordBuilder> {
  static Serializer<Mat1Record> get serializer => _$mat1RecordSerializer;

  String? get recordID;

  BuiltList<String>? get recordIId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(Mat1RecordBuilder builder) => builder
    ..recordID = ''
    ..recordIId = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mat1');

  static Stream<Mat1Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<Mat1Record> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  Mat1Record._();
  factory Mat1Record([void Function(Mat1RecordBuilder) updates]) = _$Mat1Record;

  static Mat1Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMat1RecordData({
  String? recordID,
}) {
  final firestoreData = serializers.toFirestore(
    Mat1Record.serializer,
    Mat1Record(
      (m) => m
        ..recordID = recordID
        ..recordIId = null,
    ),
  );

  return firestoreData;
}
