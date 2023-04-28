// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FileUploadRecord> _$fileUploadRecordSerializer =
    new _$FileUploadRecordSerializer();

class _$FileUploadRecordSerializer
    implements StructuredSerializer<FileUploadRecord> {
  @override
  final Iterable<Type> types = const [FileUploadRecord, _$FileUploadRecord];
  @override
  final String wireName = 'FileUploadRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FileUploadRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.recordId;
    if (value != null) {
      result
        ..add('RecordId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgUrl;
    if (value != null) {
      result
        ..add('img_url')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.picDatetime;
    if (value != null) {
      result
        ..add('pic_datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.picCoordinate;
    if (value != null) {
      result
        ..add('pic_coordinate')
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
  FileUploadRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FileUploadRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'RecordId':
          result.recordId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img_url':
          result.imgUrl.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'pic_datetime':
          result.picDatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'pic_coordinate':
          result.picCoordinate = serializers.deserialize(value,
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

class _$FileUploadRecord extends FileUploadRecord {
  @override
  final String? recordId;
  @override
  final BuiltList<String>? imgUrl;
  @override
  final DateTime? picDatetime;
  @override
  final String? picCoordinate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FileUploadRecord(
          [void Function(FileUploadRecordBuilder)? updates]) =>
      (new FileUploadRecordBuilder()..update(updates))._build();

  _$FileUploadRecord._(
      {this.recordId,
      this.imgUrl,
      this.picDatetime,
      this.picCoordinate,
      this.ffRef})
      : super._();

  @override
  FileUploadRecord rebuild(void Function(FileUploadRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileUploadRecordBuilder toBuilder() =>
      new FileUploadRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileUploadRecord &&
        recordId == other.recordId &&
        imgUrl == other.imgUrl &&
        picDatetime == other.picDatetime &&
        picCoordinate == other.picCoordinate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recordId.hashCode);
    _$hash = $jc(_$hash, imgUrl.hashCode);
    _$hash = $jc(_$hash, picDatetime.hashCode);
    _$hash = $jc(_$hash, picCoordinate.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FileUploadRecord')
          ..add('recordId', recordId)
          ..add('imgUrl', imgUrl)
          ..add('picDatetime', picDatetime)
          ..add('picCoordinate', picCoordinate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FileUploadRecordBuilder
    implements Builder<FileUploadRecord, FileUploadRecordBuilder> {
  _$FileUploadRecord? _$v;

  String? _recordId;
  String? get recordId => _$this._recordId;
  set recordId(String? recordId) => _$this._recordId = recordId;

  ListBuilder<String>? _imgUrl;
  ListBuilder<String> get imgUrl =>
      _$this._imgUrl ??= new ListBuilder<String>();
  set imgUrl(ListBuilder<String>? imgUrl) => _$this._imgUrl = imgUrl;

  DateTime? _picDatetime;
  DateTime? get picDatetime => _$this._picDatetime;
  set picDatetime(DateTime? picDatetime) => _$this._picDatetime = picDatetime;

  String? _picCoordinate;
  String? get picCoordinate => _$this._picCoordinate;
  set picCoordinate(String? picCoordinate) =>
      _$this._picCoordinate = picCoordinate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FileUploadRecordBuilder() {
    FileUploadRecord._initializeBuilder(this);
  }

  FileUploadRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recordId = $v.recordId;
      _imgUrl = $v.imgUrl?.toBuilder();
      _picDatetime = $v.picDatetime;
      _picCoordinate = $v.picCoordinate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileUploadRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FileUploadRecord;
  }

  @override
  void update(void Function(FileUploadRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FileUploadRecord build() => _build();

  _$FileUploadRecord _build() {
    _$FileUploadRecord _$result;
    try {
      _$result = _$v ??
          new _$FileUploadRecord._(
              recordId: recordId,
              imgUrl: _imgUrl?.build(),
              picDatetime: picDatetime,
              picCoordinate: picCoordinate,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'imgUrl';
        _imgUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FileUploadRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
