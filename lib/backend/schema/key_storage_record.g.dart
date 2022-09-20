// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_storage_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KeyStorageRecord> _$keyStorageRecordSerializer =
    new _$KeyStorageRecordSerializer();

class _$KeyStorageRecordSerializer
    implements StructuredSerializer<KeyStorageRecord> {
  @override
  final Iterable<Type> types = const [KeyStorageRecord, _$KeyStorageRecord];
  @override
  final String wireName = 'KeyStorageRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, KeyStorageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.apiURL;
    if (value != null) {
      result
        ..add('api_URL')
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
  KeyStorageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KeyStorageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'api_URL':
          result.apiURL = serializers.deserialize(value,
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

class _$KeyStorageRecord extends KeyStorageRecord {
  @override
  final String? apiURL;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$KeyStorageRecord(
          [void Function(KeyStorageRecordBuilder)? updates]) =>
      (new KeyStorageRecordBuilder()..update(updates))._build();

  _$KeyStorageRecord._({this.apiURL, this.ffRef}) : super._();

  @override
  KeyStorageRecord rebuild(void Function(KeyStorageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KeyStorageRecordBuilder toBuilder() =>
      new KeyStorageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KeyStorageRecord &&
        apiURL == other.apiURL &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, apiURL.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KeyStorageRecord')
          ..add('apiURL', apiURL)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class KeyStorageRecordBuilder
    implements Builder<KeyStorageRecord, KeyStorageRecordBuilder> {
  _$KeyStorageRecord? _$v;

  String? _apiURL;
  String? get apiURL => _$this._apiURL;
  set apiURL(String? apiURL) => _$this._apiURL = apiURL;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  KeyStorageRecordBuilder() {
    KeyStorageRecord._initializeBuilder(this);
  }

  KeyStorageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiURL = $v.apiURL;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KeyStorageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KeyStorageRecord;
  }

  @override
  void update(void Function(KeyStorageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KeyStorageRecord build() => _build();

  _$KeyStorageRecord _build() {
    final _$result =
        _$v ?? new _$KeyStorageRecord._(apiURL: apiURL, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
