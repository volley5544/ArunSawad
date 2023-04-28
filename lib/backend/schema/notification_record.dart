import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notification_record.g.dart';

abstract class NotificationRecord
    implements Built<NotificationRecord, NotificationRecordBuilder> {
  static Serializer<NotificationRecord> get serializer =>
      _$notificationRecordSerializer;

  @BuiltValueField(wireName: 'noti_time')
  DateTime? get notiTime;

  @BuiltValueField(wireName: 'noti_title')
  String? get notiTitle;

  @BuiltValueField(wireName: 'noti_body')
  String? get notiBody;

  @BuiltValueField(wireName: 'noti_is_read')
  bool? get notiIsRead;

  @BuiltValueField(wireName: 'this_noti_is_read')
  bool? get thisNotiIsRead;

  @BuiltValueField(wireName: 'noti_type')
  String? get notiType;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(NotificationRecordBuilder builder) => builder
    ..notiTitle = ''
    ..notiBody = ''
    ..notiIsRead = false
    ..thisNotiIsRead = false
    ..notiType = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notification')
          : FirebaseFirestore.instance.collectionGroup('notification');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('notification').doc();

  static Stream<NotificationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotificationRecord._();
  factory NotificationRecord(
          [void Function(NotificationRecordBuilder) updates]) =
      _$NotificationRecord;

  static NotificationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotificationRecordData({
  DateTime? notiTime,
  String? notiTitle,
  String? notiBody,
  bool? notiIsRead,
  bool? thisNotiIsRead,
  String? notiType,
}) {
  final firestoreData = serializers.toFirestore(
    NotificationRecord.serializer,
    NotificationRecord(
      (n) => n
        ..notiTime = notiTime
        ..notiTitle = notiTitle
        ..notiBody = notiBody
        ..notiIsRead = notiIsRead
        ..thisNotiIsRead = thisNotiIsRead
        ..notiType = notiType,
    ),
  );

  return firestoreData;
}
