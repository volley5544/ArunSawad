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
    var _$hash = 0;
    _$hash = $jc(_$hash, apiURL.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
