// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arun_sawad_img_banner_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArunSawadImgBannerRecord> _$arunSawadImgBannerRecordSerializer =
    new _$ArunSawadImgBannerRecordSerializer();

class _$ArunSawadImgBannerRecordSerializer
    implements StructuredSerializer<ArunSawadImgBannerRecord> {
  @override
  final Iterable<Type> types = const [
    ArunSawadImgBannerRecord,
    _$ArunSawadImgBannerRecord
  ];
  @override
  final String wireName = 'ArunSawadImgBannerRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ArunSawadImgBannerRecord object,
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
  ArunSawadImgBannerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArunSawadImgBannerRecordBuilder();

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

class _$ArunSawadImgBannerRecord extends ArunSawadImgBannerRecord {
  @override
  final BuiltList<String>? imgUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ArunSawadImgBannerRecord(
          [void Function(ArunSawadImgBannerRecordBuilder)? updates]) =>
      (new ArunSawadImgBannerRecordBuilder()..update(updates))._build();

  _$ArunSawadImgBannerRecord._({this.imgUrl, this.ffRef}) : super._();

  @override
  ArunSawadImgBannerRecord rebuild(
          void Function(ArunSawadImgBannerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArunSawadImgBannerRecordBuilder toBuilder() =>
      new ArunSawadImgBannerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArunSawadImgBannerRecord &&
        imgUrl == other.imgUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, imgUrl.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArunSawadImgBannerRecord')
          ..add('imgUrl', imgUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ArunSawadImgBannerRecordBuilder
    implements
        Builder<ArunSawadImgBannerRecord, ArunSawadImgBannerRecordBuilder> {
  _$ArunSawadImgBannerRecord? _$v;

  ListBuilder<String>? _imgUrl;
  ListBuilder<String> get imgUrl =>
      _$this._imgUrl ??= new ListBuilder<String>();
  set imgUrl(ListBuilder<String>? imgUrl) => _$this._imgUrl = imgUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ArunSawadImgBannerRecordBuilder() {
    ArunSawadImgBannerRecord._initializeBuilder(this);
  }

  ArunSawadImgBannerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imgUrl = $v.imgUrl?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArunSawadImgBannerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArunSawadImgBannerRecord;
  }

  @override
  void update(void Function(ArunSawadImgBannerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArunSawadImgBannerRecord build() => _build();

  _$ArunSawadImgBannerRecord _build() {
    _$ArunSawadImgBannerRecord _$result;
    try {
      _$result = _$v ??
          new _$ArunSawadImgBannerRecord._(
              imgUrl: _imgUrl?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imgUrl';
        _imgUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ArunSawadImgBannerRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
