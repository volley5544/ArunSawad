// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationRecord> _$notificationRecordSerializer =
    new _$NotificationRecordSerializer();

class _$NotificationRecordSerializer
    implements StructuredSerializer<NotificationRecord> {
  @override
  final Iterable<Type> types = const [NotificationRecord, _$NotificationRecord];
  @override
  final String wireName = 'NotificationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.notiTime;
    if (value != null) {
      result
        ..add('noti_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.notiTitle;
    if (value != null) {
      result
        ..add('noti_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notiBody;
    if (value != null) {
      result
        ..add('noti_body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notiIsRead;
    if (value != null) {
      result
        ..add('noti_is_read')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.thisNotiIsRead;
    if (value != null) {
      result
        ..add('this_noti_is_read')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.notiType;
    if (value != null) {
      result
        ..add('noti_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  NotificationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'noti_time':
          result.notiTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'noti_title':
          result.notiTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'noti_body':
          result.notiBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'noti_is_read':
          result.notiIsRead = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'this_noti_is_read':
          result.thisNotiIsRead = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'noti_type':
          result.notiType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationRecord extends NotificationRecord {
  @override
  final DateTime? notiTime;
  @override
  final String? notiTitle;
  @override
  final String? notiBody;
  @override
  final bool? notiIsRead;
  @override
  final bool? thisNotiIsRead;
  @override
  final String? notiType;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotificationRecord(
          [void Function(NotificationRecordBuilder)? updates]) =>
      (new NotificationRecordBuilder()..update(updates))._build();

  _$NotificationRecord._(
      {this.notiTime,
      this.notiTitle,
      this.notiBody,
      this.notiIsRead,
      this.thisNotiIsRead,
      this.notiType,
      this.ffRef})
      : super._();

  @override
  NotificationRecord rebuild(
          void Function(NotificationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationRecordBuilder toBuilder() =>
      new NotificationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationRecord &&
        notiTime == other.notiTime &&
        notiTitle == other.notiTitle &&
        notiBody == other.notiBody &&
        notiIsRead == other.notiIsRead &&
        thisNotiIsRead == other.thisNotiIsRead &&
        notiType == other.notiType &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notiTime.hashCode);
    _$hash = $jc(_$hash, notiTitle.hashCode);
    _$hash = $jc(_$hash, notiBody.hashCode);
    _$hash = $jc(_$hash, notiIsRead.hashCode);
    _$hash = $jc(_$hash, thisNotiIsRead.hashCode);
    _$hash = $jc(_$hash, notiType.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationRecord')
          ..add('notiTime', notiTime)
          ..add('notiTitle', notiTitle)
          ..add('notiBody', notiBody)
          ..add('notiIsRead', notiIsRead)
          ..add('thisNotiIsRead', thisNotiIsRead)
          ..add('notiType', notiType)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotificationRecordBuilder
    implements Builder<NotificationRecord, NotificationRecordBuilder> {
  _$NotificationRecord? _$v;

  DateTime? _notiTime;
  DateTime? get notiTime => _$this._notiTime;
  set notiTime(DateTime? notiTime) => _$this._notiTime = notiTime;

  String? _notiTitle;
  String? get notiTitle => _$this._notiTitle;
  set notiTitle(String? notiTitle) => _$this._notiTitle = notiTitle;

  String? _notiBody;
  String? get notiBody => _$this._notiBody;
  set notiBody(String? notiBody) => _$this._notiBody = notiBody;

  bool? _notiIsRead;
  bool? get notiIsRead => _$this._notiIsRead;
  set notiIsRead(bool? notiIsRead) => _$this._notiIsRead = notiIsRead;

  bool? _thisNotiIsRead;
  bool? get thisNotiIsRead => _$this._thisNotiIsRead;
  set thisNotiIsRead(bool? thisNotiIsRead) =>
      _$this._thisNotiIsRead = thisNotiIsRead;

  String? _notiType;
  String? get notiType => _$this._notiType;
  set notiType(String? notiType) => _$this._notiType = notiType;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotificationRecordBuilder() {
    NotificationRecord._initializeBuilder(this);
  }

  NotificationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notiTime = $v.notiTime;
      _notiTitle = $v.notiTitle;
      _notiBody = $v.notiBody;
      _notiIsRead = $v.notiIsRead;
      _thisNotiIsRead = $v.thisNotiIsRead;
      _notiType = $v.notiType;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationRecord;
  }

  @override
  void update(void Function(NotificationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationRecord build() => _build();

  _$NotificationRecord _build() {
    final _$result = _$v ??
        new _$NotificationRecord._(
            notiTime: notiTime,
            notiTitle: notiTitle,
            notiBody: notiBody,
            notiIsRead: notiIsRead,
            thisNotiIsRead: thisNotiIsRead,
            notiType: notiType,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
