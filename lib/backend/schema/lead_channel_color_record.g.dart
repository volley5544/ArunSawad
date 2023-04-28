// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_channel_color_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LeadChannelColorRecord> _$leadChannelColorRecordSerializer =
    new _$LeadChannelColorRecordSerializer();

class _$LeadChannelColorRecordSerializer
    implements StructuredSerializer<LeadChannelColorRecord> {
  @override
  final Iterable<Type> types = const [
    LeadChannelColorRecord,
    _$LeadChannelColorRecord
  ];
  @override
  final String wireName = 'LeadChannelColorRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LeadChannelColorRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Color)])));
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
  LeadChannelColorRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LeadChannelColorRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'color':
          result.color.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Color)]))!
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

class _$LeadChannelColorRecord extends LeadChannelColorRecord {
  @override
  final BuiltList<Color>? color;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LeadChannelColorRecord(
          [void Function(LeadChannelColorRecordBuilder)? updates]) =>
      (new LeadChannelColorRecordBuilder()..update(updates))._build();

  _$LeadChannelColorRecord._({this.color, this.ffRef}) : super._();

  @override
  LeadChannelColorRecord rebuild(
          void Function(LeadChannelColorRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LeadChannelColorRecordBuilder toBuilder() =>
      new LeadChannelColorRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LeadChannelColorRecord &&
        color == other.color &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LeadChannelColorRecord')
          ..add('color', color)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LeadChannelColorRecordBuilder
    implements Builder<LeadChannelColorRecord, LeadChannelColorRecordBuilder> {
  _$LeadChannelColorRecord? _$v;

  ListBuilder<Color>? _color;
  ListBuilder<Color> get color => _$this._color ??= new ListBuilder<Color>();
  set color(ListBuilder<Color>? color) => _$this._color = color;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LeadChannelColorRecordBuilder() {
    LeadChannelColorRecord._initializeBuilder(this);
  }

  LeadChannelColorRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _color = $v.color?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LeadChannelColorRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LeadChannelColorRecord;
  }

  @override
  void update(void Function(LeadChannelColorRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LeadChannelColorRecord build() => _build();

  _$LeadChannelColorRecord _build() {
    _$LeadChannelColorRecord _$result;
    try {
      _$result = _$v ??
          new _$LeadChannelColorRecord._(color: _color?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'color';
        _color?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LeadChannelColorRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
