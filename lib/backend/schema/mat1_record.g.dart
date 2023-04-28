// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mat1_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Mat1Record> _$mat1RecordSerializer = new _$Mat1RecordSerializer();

class _$Mat1RecordSerializer implements StructuredSerializer<Mat1Record> {
  @override
  final Iterable<Type> types = const [Mat1Record, _$Mat1Record];
  @override
  final String wireName = 'Mat1Record';

  @override
  Iterable<Object?> serialize(Serializers serializers, Mat1Record object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.recordID;
    if (value != null) {
      result
        ..add('recordID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recordIId;
    if (value != null) {
      result
        ..add('recordIId')
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
  Mat1Record deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Mat1RecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'recordID':
          result.recordID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recordIId':
          result.recordIId.replace(serializers.deserialize(value,
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

class _$Mat1Record extends Mat1Record {
  @override
  final String? recordID;
  @override
  final BuiltList<String>? recordIId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Mat1Record([void Function(Mat1RecordBuilder)? updates]) =>
      (new Mat1RecordBuilder()..update(updates))._build();

  _$Mat1Record._({this.recordID, this.recordIId, this.ffRef}) : super._();

  @override
  Mat1Record rebuild(void Function(Mat1RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Mat1RecordBuilder toBuilder() => new Mat1RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mat1Record &&
        recordID == other.recordID &&
        recordIId == other.recordIId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recordID.hashCode);
    _$hash = $jc(_$hash, recordIId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Mat1Record')
          ..add('recordID', recordID)
          ..add('recordIId', recordIId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Mat1RecordBuilder implements Builder<Mat1Record, Mat1RecordBuilder> {
  _$Mat1Record? _$v;

  String? _recordID;
  String? get recordID => _$this._recordID;
  set recordID(String? recordID) => _$this._recordID = recordID;

  ListBuilder<String>? _recordIId;
  ListBuilder<String> get recordIId =>
      _$this._recordIId ??= new ListBuilder<String>();
  set recordIId(ListBuilder<String>? recordIId) =>
      _$this._recordIId = recordIId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Mat1RecordBuilder() {
    Mat1Record._initializeBuilder(this);
  }

  Mat1RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recordID = $v.recordID;
      _recordIId = $v.recordIId?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Mat1Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Mat1Record;
  }

  @override
  void update(void Function(Mat1RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Mat1Record build() => _build();

  _$Mat1Record _build() {
    _$Mat1Record _$result;
    try {
      _$result = _$v ??
          new _$Mat1Record._(
              recordID: recordID, recordIId: _recordIId?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recordIId';
        _recordIId?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Mat1Record', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
