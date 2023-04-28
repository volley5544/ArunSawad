// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_page_img_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SplashPageImgRecord> _$splashPageImgRecordSerializer =
    new _$SplashPageImgRecordSerializer();

class _$SplashPageImgRecordSerializer
    implements StructuredSerializer<SplashPageImgRecord> {
  @override
  final Iterable<Type> types = const [
    SplashPageImgRecord,
    _$SplashPageImgRecord
  ];
  @override
  final String wireName = 'SplashPageImgRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SplashPageImgRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgURL;
    if (value != null) {
      result
        ..add('imgURL')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
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
  SplashPageImgRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SplashPageImgRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imgURL':
          result.imgURL.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'text':
          result.text.replace(serializers.deserialize(value,
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

class _$SplashPageImgRecord extends SplashPageImgRecord {
  @override
  final String? day;
  @override
  final BuiltList<String>? imgURL;
  @override
  final BuiltList<String>? text;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SplashPageImgRecord(
          [void Function(SplashPageImgRecordBuilder)? updates]) =>
      (new SplashPageImgRecordBuilder()..update(updates))._build();

  _$SplashPageImgRecord._({this.day, this.imgURL, this.text, this.ffRef})
      : super._();

  @override
  SplashPageImgRecord rebuild(
          void Function(SplashPageImgRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashPageImgRecordBuilder toBuilder() =>
      new SplashPageImgRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashPageImgRecord &&
        day == other.day &&
        imgURL == other.imgURL &&
        text == other.text &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, day.hashCode);
    _$hash = $jc(_$hash, imgURL.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashPageImgRecord')
          ..add('day', day)
          ..add('imgURL', imgURL)
          ..add('text', text)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SplashPageImgRecordBuilder
    implements Builder<SplashPageImgRecord, SplashPageImgRecordBuilder> {
  _$SplashPageImgRecord? _$v;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  ListBuilder<String>? _imgURL;
  ListBuilder<String> get imgURL =>
      _$this._imgURL ??= new ListBuilder<String>();
  set imgURL(ListBuilder<String>? imgURL) => _$this._imgURL = imgURL;

  ListBuilder<String>? _text;
  ListBuilder<String> get text => _$this._text ??= new ListBuilder<String>();
  set text(ListBuilder<String>? text) => _$this._text = text;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SplashPageImgRecordBuilder() {
    SplashPageImgRecord._initializeBuilder(this);
  }

  SplashPageImgRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _day = $v.day;
      _imgURL = $v.imgURL?.toBuilder();
      _text = $v.text?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashPageImgRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashPageImgRecord;
  }

  @override
  void update(void Function(SplashPageImgRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashPageImgRecord build() => _build();

  _$SplashPageImgRecord _build() {
    _$SplashPageImgRecord _$result;
    try {
      _$result = _$v ??
          new _$SplashPageImgRecord._(
              day: day,
              imgURL: _imgURL?.build(),
              text: _text?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imgURL';
        _imgURL?.build();
        _$failedField = 'text';
        _text?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SplashPageImgRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
