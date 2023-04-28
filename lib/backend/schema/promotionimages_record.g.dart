// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotionimages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromotionimagesRecord> _$promotionimagesRecordSerializer =
    new _$PromotionimagesRecordSerializer();

class _$PromotionimagesRecordSerializer
    implements StructuredSerializer<PromotionimagesRecord> {
  @override
  final Iterable<Type> types = const [
    PromotionimagesRecord,
    _$PromotionimagesRecord
  ];
  @override
  final String wireName = 'PromotionimagesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PromotionimagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.imgUrl;
    if (value != null) {
      result
        ..add('img_url')
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
  PromotionimagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromotionimagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'img_url':
          result.imgUrl.replace(serializers.deserialize(value,
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

class _$PromotionimagesRecord extends PromotionimagesRecord {
  @override
  final BuiltList<String>? imgUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromotionimagesRecord(
          [void Function(PromotionimagesRecordBuilder)? updates]) =>
      (new PromotionimagesRecordBuilder()..update(updates))._build();

  _$PromotionimagesRecord._({this.imgUrl, this.ffRef}) : super._();

  @override
  PromotionimagesRecord rebuild(
          void Function(PromotionimagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromotionimagesRecordBuilder toBuilder() =>
      new PromotionimagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromotionimagesRecord &&
        imgUrl == other.imgUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, imgUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromotionimagesRecord')
          ..add('imgUrl', imgUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromotionimagesRecordBuilder
    implements Builder<PromotionimagesRecord, PromotionimagesRecordBuilder> {
  _$PromotionimagesRecord? _$v;

  ListBuilder<String>? _imgUrl;
  ListBuilder<String> get imgUrl =>
      _$this._imgUrl ??= new ListBuilder<String>();
  set imgUrl(ListBuilder<String>? imgUrl) => _$this._imgUrl = imgUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromotionimagesRecordBuilder() {
    PromotionimagesRecord._initializeBuilder(this);
  }

  PromotionimagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imgUrl = $v.imgUrl?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromotionimagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromotionimagesRecord;
  }

  @override
  void update(void Function(PromotionimagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromotionimagesRecord build() => _build();

  _$PromotionimagesRecord _build() {
    _$PromotionimagesRecord _$result;
    try {
      _$result = _$v ??
          new _$PromotionimagesRecord._(imgUrl: _imgUrl?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imgUrl';
        _imgUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PromotionimagesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
