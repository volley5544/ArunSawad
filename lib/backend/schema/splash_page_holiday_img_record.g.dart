// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_page_holiday_img_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SplashPageHolidayImgRecord> _$splashPageHolidayImgRecordSerializer =
    new _$SplashPageHolidayImgRecordSerializer();

class _$SplashPageHolidayImgRecordSerializer
    implements StructuredSerializer<SplashPageHolidayImgRecord> {
  @override
  final Iterable<Type> types = const [
    SplashPageHolidayImgRecord,
    _$SplashPageHolidayImgRecord
  ];
  @override
  final String wireName = 'SplashPageHolidayImgRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SplashPageHolidayImgRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.holidayImg;
    if (value != null) {
      result
        ..add('HolidayImg')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('Date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateExp;
    if (value != null) {
      result
        ..add('DateExp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  SplashPageHolidayImgRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SplashPageHolidayImgRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'HolidayImg':
          result.holidayImg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'DateExp':
          result.dateExp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$SplashPageHolidayImgRecord extends SplashPageHolidayImgRecord {
  @override
  final BuiltList<String>? holidayImg;
  @override
  final DateTime? date;
  @override
  final DateTime? dateExp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SplashPageHolidayImgRecord(
          [void Function(SplashPageHolidayImgRecordBuilder)? updates]) =>
      (new SplashPageHolidayImgRecordBuilder()..update(updates))._build();

  _$SplashPageHolidayImgRecord._(
      {this.holidayImg, this.date, this.dateExp, this.ffRef})
      : super._();

  @override
  SplashPageHolidayImgRecord rebuild(
          void Function(SplashPageHolidayImgRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashPageHolidayImgRecordBuilder toBuilder() =>
      new SplashPageHolidayImgRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashPageHolidayImgRecord &&
        holidayImg == other.holidayImg &&
        date == other.date &&
        dateExp == other.dateExp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, holidayImg.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, dateExp.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashPageHolidayImgRecord')
          ..add('holidayImg', holidayImg)
          ..add('date', date)
          ..add('dateExp', dateExp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SplashPageHolidayImgRecordBuilder
    implements
        Builder<SplashPageHolidayImgRecord, SplashPageHolidayImgRecordBuilder> {
  _$SplashPageHolidayImgRecord? _$v;

  ListBuilder<String>? _holidayImg;
  ListBuilder<String> get holidayImg =>
      _$this._holidayImg ??= new ListBuilder<String>();
  set holidayImg(ListBuilder<String>? holidayImg) =>
      _$this._holidayImg = holidayImg;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DateTime? _dateExp;
  DateTime? get dateExp => _$this._dateExp;
  set dateExp(DateTime? dateExp) => _$this._dateExp = dateExp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SplashPageHolidayImgRecordBuilder() {
    SplashPageHolidayImgRecord._initializeBuilder(this);
  }

  SplashPageHolidayImgRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _holidayImg = $v.holidayImg?.toBuilder();
      _date = $v.date;
      _dateExp = $v.dateExp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashPageHolidayImgRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashPageHolidayImgRecord;
  }

  @override
  void update(void Function(SplashPageHolidayImgRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashPageHolidayImgRecord build() => _build();

  _$SplashPageHolidayImgRecord _build() {
    _$SplashPageHolidayImgRecord _$result;
    try {
      _$result = _$v ??
          new _$SplashPageHolidayImgRecord._(
              holidayImg: _holidayImg?.build(),
              date: date,
              dateExp: dateExp,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'holidayImg';
        _holidayImg?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SplashPageHolidayImgRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
