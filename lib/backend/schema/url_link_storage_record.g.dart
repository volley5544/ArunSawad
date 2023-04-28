// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_link_storage_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UrlLinkStorageRecord> _$urlLinkStorageRecordSerializer =
    new _$UrlLinkStorageRecordSerializer();

class _$UrlLinkStorageRecordSerializer
    implements StructuredSerializer<UrlLinkStorageRecord> {
  @override
  final Iterable<Type> types = const [
    UrlLinkStorageRecord,
    _$UrlLinkStorageRecord
  ];
  @override
  final String wireName = 'UrlLinkStorageRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UrlLinkStorageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.urlName;
    if (value != null) {
      result
        ..add('url_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.urlLink;
    if (value != null) {
      result
        ..add('url_link')
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
  UrlLinkStorageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UrlLinkStorageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url_name':
          result.urlName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url_link':
          result.urlLink = serializers.deserialize(value,
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

class _$UrlLinkStorageRecord extends UrlLinkStorageRecord {
  @override
  final String? urlName;
  @override
  final String? urlLink;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UrlLinkStorageRecord(
          [void Function(UrlLinkStorageRecordBuilder)? updates]) =>
      (new UrlLinkStorageRecordBuilder()..update(updates))._build();

  _$UrlLinkStorageRecord._({this.urlName, this.urlLink, this.ffRef})
      : super._();

  @override
  UrlLinkStorageRecord rebuild(
          void Function(UrlLinkStorageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UrlLinkStorageRecordBuilder toBuilder() =>
      new UrlLinkStorageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UrlLinkStorageRecord &&
        urlName == other.urlName &&
        urlLink == other.urlLink &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, urlName.hashCode);
    _$hash = $jc(_$hash, urlLink.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UrlLinkStorageRecord')
          ..add('urlName', urlName)
          ..add('urlLink', urlLink)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UrlLinkStorageRecordBuilder
    implements Builder<UrlLinkStorageRecord, UrlLinkStorageRecordBuilder> {
  _$UrlLinkStorageRecord? _$v;

  String? _urlName;
  String? get urlName => _$this._urlName;
  set urlName(String? urlName) => _$this._urlName = urlName;

  String? _urlLink;
  String? get urlLink => _$this._urlLink;
  set urlLink(String? urlLink) => _$this._urlLink = urlLink;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UrlLinkStorageRecordBuilder() {
    UrlLinkStorageRecord._initializeBuilder(this);
  }

  UrlLinkStorageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _urlName = $v.urlName;
      _urlLink = $v.urlLink;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UrlLinkStorageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UrlLinkStorageRecord;
  }

  @override
  void update(void Function(UrlLinkStorageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UrlLinkStorageRecord build() => _build();

  _$UrlLinkStorageRecord _build() {
    final _$result = _$v ??
        new _$UrlLinkStorageRecord._(
            urlName: urlName, urlLink: urlLink, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
