import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'build_version_record.g.dart';

abstract class BuildVersionRecord
    implements Built<BuildVersionRecord, BuildVersionRecordBuilder> {
  static Serializer<BuildVersionRecord> get serializer =>
      _$buildVersionRecordSerializer;

  @BuiltValueField(wireName: 'app_version')
  String? get appVersion;

  @BuiltValueField(wireName: 'app_version_ios')
  String? get appVersionIos;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BuildVersionRecordBuilder builder) => builder
    ..appVersion = ''
    ..appVersionIos = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BuildVersion');

  static Stream<BuildVersionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BuildVersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BuildVersionRecord._();
  factory BuildVersionRecord(
          [void Function(BuildVersionRecordBuilder) updates]) =
      _$BuildVersionRecord;

  static BuildVersionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBuildVersionRecordData({
  String? appVersion,
  String? appVersionIos,
}) {
  final firestoreData = serializers.toFirestore(
    BuildVersionRecord.serializer,
    BuildVersionRecord(
      (b) => b
        ..appVersion = appVersion
        ..appVersionIos = appVersionIos,
    ),
  );

  return firestoreData;
}
