// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_storage2_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KeyStorage2Record> _$keyStorage2RecordSerializer =
    new _$KeyStorage2RecordSerializer();

class _$KeyStorage2RecordSerializer
    implements StructuredSerializer<KeyStorage2Record> {
  @override
  final Iterable<Type> types = const [KeyStorage2Record, _$KeyStorage2Record];
  @override
  final String wireName = 'KeyStorage2Record';

  @override
  Iterable<Object?> serialize(Serializers serializers, KeyStorage2Record object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uatApiUrl;
    if (value != null) {
      result
        ..add('uat_api_url')
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
  KeyStorage2Record deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KeyStorage2RecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uat_api_url':
          result.uatApiUrl = serializers.deserialize(value,
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

class _$KeyStorage2Record extends KeyStorage2Record {
  @override
  final String? uatApiUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$KeyStorage2Record(
          [void Function(KeyStorage2RecordBuilder)? updates]) =>
      (new KeyStorage2RecordBuilder()..update(updates))._build();

  _$KeyStorage2Record._({this.uatApiUrl, this.ffRef}) : super._();

  @override
  KeyStorage2Record rebuild(void Function(KeyStorage2RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KeyStorage2RecordBuilder toBuilder() =>
      new KeyStorage2RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KeyStorage2Record &&
        uatApiUrl == other.uatApiUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uatApiUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KeyStorage2Record')
          ..add('uatApiUrl', uatApiUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class KeyStorage2RecordBuilder
    implements Builder<KeyStorage2Record, KeyStorage2RecordBuilder> {
  _$KeyStorage2Record? _$v;

  String? _uatApiUrl;
  String? get uatApiUrl => _$this._uatApiUrl;
  set uatApiUrl(String? uatApiUrl) => _$this._uatApiUrl = uatApiUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  KeyStorage2RecordBuilder() {
    KeyStorage2Record._initializeBuilder(this);
  }

  KeyStorage2RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uatApiUrl = $v.uatApiUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KeyStorage2Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KeyStorage2Record;
  }

  @override
  void update(void Function(KeyStorage2RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KeyStorage2Record build() => _build();

  _$KeyStorage2Record _build() {
    final _$result =
        _$v ?? new _$KeyStorage2Record._(uatApiUrl: uatApiUrl, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
