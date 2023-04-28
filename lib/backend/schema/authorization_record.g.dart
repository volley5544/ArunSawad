// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthorizationRecord> _$authorizationRecordSerializer =
    new _$AuthorizationRecordSerializer();

class _$AuthorizationRecordSerializer
    implements StructuredSerializer<AuthorizationRecord> {
  @override
  final Iterable<Type> types = const [
    AuthorizationRecord,
    _$AuthorizationRecord
  ];
  @override
  final String wireName = 'AuthorizationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AuthorizationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.contentName;
    if (value != null) {
      result
        ..add('content_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.employeeIdList;
    if (value != null) {
      result
        ..add('employee_id_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  AuthorizationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthorizationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'content_name':
          result.contentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'employee_id_list':
          result.employeeIdList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$AuthorizationRecord extends AuthorizationRecord {
  @override
  final String? contentName;
  @override
  final BuiltList<String>? employeeIdList;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AuthorizationRecord(
          [void Function(AuthorizationRecordBuilder)? updates]) =>
      (new AuthorizationRecordBuilder()..update(updates))._build();

  _$AuthorizationRecord._({this.contentName, this.employeeIdList, this.ffRef})
      : super._();

  @override
  AuthorizationRecord rebuild(
          void Function(AuthorizationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorizationRecordBuilder toBuilder() =>
      new AuthorizationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorizationRecord &&
        contentName == other.contentName &&
        employeeIdList == other.employeeIdList &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentName.hashCode);
    _$hash = $jc(_$hash, employeeIdList.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthorizationRecord')
          ..add('contentName', contentName)
          ..add('employeeIdList', employeeIdList)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AuthorizationRecordBuilder
    implements Builder<AuthorizationRecord, AuthorizationRecordBuilder> {
  _$AuthorizationRecord? _$v;

  String? _contentName;
  String? get contentName => _$this._contentName;
  set contentName(String? contentName) => _$this._contentName = contentName;

  ListBuilder<String>? _employeeIdList;
  ListBuilder<String> get employeeIdList =>
      _$this._employeeIdList ??= new ListBuilder<String>();
  set employeeIdList(ListBuilder<String>? employeeIdList) =>
      _$this._employeeIdList = employeeIdList;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AuthorizationRecordBuilder() {
    AuthorizationRecord._initializeBuilder(this);
  }

  AuthorizationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentName = $v.contentName;
      _employeeIdList = $v.employeeIdList?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorizationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthorizationRecord;
  }

  @override
  void update(void Function(AuthorizationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthorizationRecord build() => _build();

  _$AuthorizationRecord _build() {
    _$AuthorizationRecord _$result;
    try {
      _$result = _$v ??
          new _$AuthorizationRecord._(
              contentName: contentName,
              employeeIdList: _employeeIdList?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'employeeIdList';
        _employeeIdList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthorizationRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
