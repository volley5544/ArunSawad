// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_custom_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserCustomRecord> _$userCustomRecordSerializer =
    new _$UserCustomRecordSerializer();

class _$UserCustomRecordSerializer
    implements StructuredSerializer<UserCustomRecord> {
  @override
  final Iterable<Type> types = const [UserCustomRecord, _$UserCustomRecord];
  @override
  final String wireName = 'UserCustomRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserCustomRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgProfile;
    if (value != null) {
      result
        ..add('img_profile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  UserCustomRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserCustomRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img_profile':
          result.imgProfile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$UserCustomRecord extends UserCustomRecord {
  @override
  final DateTime? createdTime;
  @override
  final String? email;
  @override
  final String? uid;
  @override
  final String? imgProfile;
  @override
  final String? employeeId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserCustomRecord(
          [void Function(UserCustomRecordBuilder)? updates]) =>
      (new UserCustomRecordBuilder()..update(updates))._build();

  _$UserCustomRecord._(
      {this.createdTime,
      this.email,
      this.uid,
      this.imgProfile,
      this.employeeId,
      this.ffRef})
      : super._();

  @override
  UserCustomRecord rebuild(void Function(UserCustomRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCustomRecordBuilder toBuilder() =>
      new UserCustomRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCustomRecord &&
        createdTime == other.createdTime &&
        email == other.email &&
        uid == other.uid &&
        imgProfile == other.imgProfile &&
        employeeId == other.employeeId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, imgProfile.hashCode);
    _$hash = $jc(_$hash, employeeId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCustomRecord')
          ..add('createdTime', createdTime)
          ..add('email', email)
          ..add('uid', uid)
          ..add('imgProfile', imgProfile)
          ..add('employeeId', employeeId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserCustomRecordBuilder
    implements Builder<UserCustomRecord, UserCustomRecordBuilder> {
  _$UserCustomRecord? _$v;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _imgProfile;
  String? get imgProfile => _$this._imgProfile;
  set imgProfile(String? imgProfile) => _$this._imgProfile = imgProfile;

  String? _employeeId;
  String? get employeeId => _$this._employeeId;
  set employeeId(String? employeeId) => _$this._employeeId = employeeId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserCustomRecordBuilder() {
    UserCustomRecord._initializeBuilder(this);
  }

  UserCustomRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _email = $v.email;
      _uid = $v.uid;
      _imgProfile = $v.imgProfile;
      _employeeId = $v.employeeId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCustomRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCustomRecord;
  }

  @override
  void update(void Function(UserCustomRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCustomRecord build() => _build();

  _$UserCustomRecord _build() {
    final _$result = _$v ??
        new _$UserCustomRecord._(
            createdTime: createdTime,
            email: email,
            uid: uid,
            imgProfile: imgProfile,
            employeeId: employeeId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
