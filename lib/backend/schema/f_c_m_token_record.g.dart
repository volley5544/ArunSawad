// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_c_m_token_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FCMTokenRecord> _$fCMTokenRecordSerializer =
    new _$FCMTokenRecordSerializer();

class _$FCMTokenRecordSerializer
    implements StructuredSerializer<FCMTokenRecord> {
  @override
  final Iterable<Type> types = const [FCMTokenRecord, _$FCMTokenRecord];
  @override
  final String wireName = 'FCMTokenRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FCMTokenRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.deviceType;
    if (value != null) {
      result
        ..add('device_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fcmToken;
    if (value != null) {
      result
        ..add('fcm_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.employeeId;
    if (value != null) {
      result
        ..add('employee_id')
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
  FCMTokenRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FCMTokenRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'device_type':
          result.deviceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fcm_token':
          result.fcmToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'employee_id':
          result.employeeId = serializers.deserialize(value,
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

class _$FCMTokenRecord extends FCMTokenRecord {
  @override
  final DateTime? createdAt;
  @override
  final String? deviceType;
  @override
  final String? fcmToken;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? employeeId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FCMTokenRecord([void Function(FCMTokenRecordBuilder)? updates]) =>
      (new FCMTokenRecordBuilder()..update(updates))._build();

  _$FCMTokenRecord._(
      {this.createdAt,
      this.deviceType,
      this.fcmToken,
      this.userRef,
      this.employeeId,
      this.ffRef})
      : super._();

  @override
  FCMTokenRecord rebuild(void Function(FCMTokenRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FCMTokenRecordBuilder toBuilder() =>
      new FCMTokenRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FCMTokenRecord &&
        createdAt == other.createdAt &&
        deviceType == other.deviceType &&
        fcmToken == other.fcmToken &&
        userRef == other.userRef &&
        employeeId == other.employeeId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, deviceType.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, employeeId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FCMTokenRecord')
          ..add('createdAt', createdAt)
          ..add('deviceType', deviceType)
          ..add('fcmToken', fcmToken)
          ..add('userRef', userRef)
          ..add('employeeId', employeeId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FCMTokenRecordBuilder
    implements Builder<FCMTokenRecord, FCMTokenRecordBuilder> {
  _$FCMTokenRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _deviceType;
  String? get deviceType => _$this._deviceType;
  set deviceType(String? deviceType) => _$this._deviceType = deviceType;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _employeeId;
  String? get employeeId => _$this._employeeId;
  set employeeId(String? employeeId) => _$this._employeeId = employeeId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FCMTokenRecordBuilder() {
    FCMTokenRecord._initializeBuilder(this);
  }

  FCMTokenRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _deviceType = $v.deviceType;
      _fcmToken = $v.fcmToken;
      _userRef = $v.userRef;
      _employeeId = $v.employeeId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FCMTokenRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FCMTokenRecord;
  }

  @override
  void update(void Function(FCMTokenRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FCMTokenRecord build() => _build();

  _$FCMTokenRecord _build() {
    final _$result = _$v ??
        new _$FCMTokenRecord._(
            createdAt: createdAt,
            deviceType: deviceType,
            fcmToken: fcmToken,
            userRef: userRef,
            employeeId: employeeId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
