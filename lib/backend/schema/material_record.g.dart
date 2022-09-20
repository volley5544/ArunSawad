// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MaterialRecord> _$materialRecordSerializer =
    new _$MaterialRecordSerializer();

class _$MaterialRecordSerializer
    implements StructuredSerializer<MaterialRecord> {
  @override
  final Iterable<Type> types = const [MaterialRecord, _$MaterialRecord];
  @override
  final String wireName = 'MaterialRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MaterialRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.matetialName;
    if (value != null) {
      result
        ..add('matetial_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgUrl;
    if (value != null) {
      result
        ..add('img_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recordId;
    if (value != null) {
      result
        ..add('record_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  MaterialRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MaterialRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'matetial_name':
          result.matetialName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img_url':
          result.imgUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'record_id':
          result.recordId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$MaterialRecord extends MaterialRecord {
  @override
  final String? matetialName;
  @override
  final String? imgUrl;
  @override
  final int? recordId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MaterialRecord([void Function(MaterialRecordBuilder)? updates]) =>
      (new MaterialRecordBuilder()..update(updates))._build();

  _$MaterialRecord._(
      {this.matetialName, this.imgUrl, this.recordId, this.ffRef})
      : super._();

  @override
  MaterialRecord rebuild(void Function(MaterialRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaterialRecordBuilder toBuilder() =>
      new MaterialRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaterialRecord &&
        matetialName == other.matetialName &&
        imgUrl == other.imgUrl &&
        recordId == other.recordId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, matetialName.hashCode), imgUrl.hashCode),
            recordId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaterialRecord')
          ..add('matetialName', matetialName)
          ..add('imgUrl', imgUrl)
          ..add('recordId', recordId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MaterialRecordBuilder
    implements Builder<MaterialRecord, MaterialRecordBuilder> {
  _$MaterialRecord? _$v;

  String? _matetialName;
  String? get matetialName => _$this._matetialName;
  set matetialName(String? matetialName) => _$this._matetialName = matetialName;

  String? _imgUrl;
  String? get imgUrl => _$this._imgUrl;
  set imgUrl(String? imgUrl) => _$this._imgUrl = imgUrl;

  int? _recordId;
  int? get recordId => _$this._recordId;
  set recordId(int? recordId) => _$this._recordId = recordId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MaterialRecordBuilder() {
    MaterialRecord._initializeBuilder(this);
  }

  MaterialRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _matetialName = $v.matetialName;
      _imgUrl = $v.imgUrl;
      _recordId = $v.recordId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaterialRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MaterialRecord;
  }

  @override
  void update(void Function(MaterialRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MaterialRecord build() => _build();

  _$MaterialRecord _build() {
    final _$result = _$v ??
        new _$MaterialRecord._(
            matetialName: matetialName,
            imgUrl: imgUrl,
            recordId: recordId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
