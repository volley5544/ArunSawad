// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_log_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserLogRecord> _$userLogRecordSerializer =
    new _$UserLogRecordSerializer();

class _$UserLogRecordSerializer implements StructuredSerializer<UserLogRecord> {
  @override
  final Iterable<Type> types = const [UserLogRecord, _$UserLogRecord];
  @override
  final String wireName = 'UserLogRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserLogRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.employeeId;
    if (value != null) {
      result
        ..add('employee_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.actionTime;
    if (value != null) {
      result
        ..add('action_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userLocation;
    if (value != null) {
      result
        ..add('user_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
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
  UserLogRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserLogRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'employee_id':
          result.employeeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'action':
          result.action = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'action_time':
          result.actionTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user_location':
          result.userLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
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

class _$UserLogRecord extends UserLogRecord {
  @override
  final String? employeeId;
  @override
  final String? action;
  @override
  final DateTime? actionTime;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final LatLng? userLocation;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserLogRecord([void Function(UserLogRecordBuilder)? updates]) =>
      (new UserLogRecordBuilder()..update(updates))._build();

  _$UserLogRecord._(
      {this.employeeId,
      this.action,
      this.actionTime,
      this.userRef,
      this.userLocation,
      this.ffRef})
      : super._();

  @override
  UserLogRecord rebuild(void Function(UserLogRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserLogRecordBuilder toBuilder() => new UserLogRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLogRecord &&
        employeeId == other.employeeId &&
        action == other.action &&
        actionTime == other.actionTime &&
        userRef == other.userRef &&
        userLocation == other.userLocation &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, employeeId.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jc(_$hash, actionTime.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, userLocation.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserLogRecord')
          ..add('employeeId', employeeId)
          ..add('action', action)
          ..add('actionTime', actionTime)
          ..add('userRef', userRef)
          ..add('userLocation', userLocation)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserLogRecordBuilder
    implements Builder<UserLogRecord, UserLogRecordBuilder> {
  _$UserLogRecord? _$v;

  String? _employeeId;
  String? get employeeId => _$this._employeeId;
  set employeeId(String? employeeId) => _$this._employeeId = employeeId;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  DateTime? _actionTime;
  DateTime? get actionTime => _$this._actionTime;
  set actionTime(DateTime? actionTime) => _$this._actionTime = actionTime;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  LatLng? _userLocation;
  LatLng? get userLocation => _$this._userLocation;
  set userLocation(LatLng? userLocation) => _$this._userLocation = userLocation;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserLogRecordBuilder() {
    UserLogRecord._initializeBuilder(this);
  }

  UserLogRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _employeeId = $v.employeeId;
      _action = $v.action;
      _actionTime = $v.actionTime;
      _userRef = $v.userRef;
      _userLocation = $v.userLocation;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserLogRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserLogRecord;
  }

  @override
  void update(void Function(UserLogRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserLogRecord build() => _build();

  _$UserLogRecord _build() {
    final _$result = _$v ??
        new _$UserLogRecord._(
            employeeId: employeeId,
            action: action,
            actionTime: actionTime,
            userRef: userRef,
            userLocation: userLocation,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
