// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_page_birthday_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SplashPageBirthdayRecord> _$splashPageBirthdayRecordSerializer =
    new _$SplashPageBirthdayRecordSerializer();

class _$SplashPageBirthdayRecordSerializer
    implements StructuredSerializer<SplashPageBirthdayRecord> {
  @override
  final Iterable<Type> types = const [
    SplashPageBirthdayRecord,
    _$SplashPageBirthdayRecord
  ];
  @override
  final String wireName = 'SplashPageBirthdayRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SplashPageBirthdayRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.birthDateImg;
    if (value != null) {
      result
        ..add('BirthDateImg')
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
  SplashPageBirthdayRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SplashPageBirthdayRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'BirthDateImg':
          result.birthDateImg.replace(serializers.deserialize(value,
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

class _$SplashPageBirthdayRecord extends SplashPageBirthdayRecord {
  @override
  final BuiltList<String>? birthDateImg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SplashPageBirthdayRecord(
          [void Function(SplashPageBirthdayRecordBuilder)? updates]) =>
      (new SplashPageBirthdayRecordBuilder()..update(updates))._build();

  _$SplashPageBirthdayRecord._({this.birthDateImg, this.ffRef}) : super._();

  @override
  SplashPageBirthdayRecord rebuild(
          void Function(SplashPageBirthdayRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashPageBirthdayRecordBuilder toBuilder() =>
      new SplashPageBirthdayRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashPageBirthdayRecord &&
        birthDateImg == other.birthDateImg &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, birthDateImg.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashPageBirthdayRecord')
          ..add('birthDateImg', birthDateImg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SplashPageBirthdayRecordBuilder
    implements
        Builder<SplashPageBirthdayRecord, SplashPageBirthdayRecordBuilder> {
  _$SplashPageBirthdayRecord? _$v;

  ListBuilder<String>? _birthDateImg;
  ListBuilder<String> get birthDateImg =>
      _$this._birthDateImg ??= new ListBuilder<String>();
  set birthDateImg(ListBuilder<String>? birthDateImg) =>
      _$this._birthDateImg = birthDateImg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SplashPageBirthdayRecordBuilder() {
    SplashPageBirthdayRecord._initializeBuilder(this);
  }

  SplashPageBirthdayRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _birthDateImg = $v.birthDateImg?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashPageBirthdayRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashPageBirthdayRecord;
  }

  @override
  void update(void Function(SplashPageBirthdayRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashPageBirthdayRecord build() => _build();

  _$SplashPageBirthdayRecord _build() {
    _$SplashPageBirthdayRecord _$result;
    try {
      _$result = _$v ??
          new _$SplashPageBirthdayRecord._(
              birthDateImg: _birthDateImg?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'birthDateImg';
        _birthDateImg?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SplashPageBirthdayRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
