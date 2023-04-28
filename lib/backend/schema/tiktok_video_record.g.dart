// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tiktok_video_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TiktokVideoRecord> _$tiktokVideoRecordSerializer =
    new _$TiktokVideoRecordSerializer();

class _$TiktokVideoRecordSerializer
    implements StructuredSerializer<TiktokVideoRecord> {
  @override
  final Iterable<Type> types = const [TiktokVideoRecord, _$TiktokVideoRecord];
  @override
  final String wireName = 'TiktokVideoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TiktokVideoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.tiktokList;
    if (value != null) {
      result
        ..add('tiktokList')
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
  TiktokVideoRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TiktokVideoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tiktokList':
          result.tiktokList.replace(serializers.deserialize(value,
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

class _$TiktokVideoRecord extends TiktokVideoRecord {
  @override
  final BuiltList<String>? tiktokList;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TiktokVideoRecord(
          [void Function(TiktokVideoRecordBuilder)? updates]) =>
      (new TiktokVideoRecordBuilder()..update(updates))._build();

  _$TiktokVideoRecord._({this.tiktokList, this.ffRef}) : super._();

  @override
  TiktokVideoRecord rebuild(void Function(TiktokVideoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TiktokVideoRecordBuilder toBuilder() =>
      new TiktokVideoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TiktokVideoRecord &&
        tiktokList == other.tiktokList &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tiktokList.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TiktokVideoRecord')
          ..add('tiktokList', tiktokList)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TiktokVideoRecordBuilder
    implements Builder<TiktokVideoRecord, TiktokVideoRecordBuilder> {
  _$TiktokVideoRecord? _$v;

  ListBuilder<String>? _tiktokList;
  ListBuilder<String> get tiktokList =>
      _$this._tiktokList ??= new ListBuilder<String>();
  set tiktokList(ListBuilder<String>? tiktokList) =>
      _$this._tiktokList = tiktokList;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TiktokVideoRecordBuilder() {
    TiktokVideoRecord._initializeBuilder(this);
  }

  TiktokVideoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tiktokList = $v.tiktokList?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TiktokVideoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TiktokVideoRecord;
  }

  @override
  void update(void Function(TiktokVideoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TiktokVideoRecord build() => _build();

  _$TiktokVideoRecord _build() {
    _$TiktokVideoRecord _$result;
    try {
      _$result = _$v ??
          new _$TiktokVideoRecord._(
              tiktokList: _tiktokList?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tiktokList';
        _tiktokList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TiktokVideoRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
