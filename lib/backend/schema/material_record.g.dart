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
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.employeeId;
    if (value != null) {
      result
        ..add('employee_id')
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
        case 'phone':
          result.phone.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'name':
          result.name.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'employee_id':
          result.employeeId = serializers.deserialize(value,
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

class _$MaterialRecord extends MaterialRecord {
  @override
  final String? matetialName;
  @override
  final String? imgUrl;
  @override
  final int? recordId;
  @override
  final BuiltList<String>? phone;
  @override
  final BuiltList<String>? name;
  @override
  final String? employeeId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MaterialRecord([void Function(MaterialRecordBuilder)? updates]) =>
      (new MaterialRecordBuilder()..update(updates))._build();

  _$MaterialRecord._(
      {this.matetialName,
      this.imgUrl,
      this.recordId,
      this.phone,
      this.name,
      this.employeeId,
      this.ffRef})
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
        phone == other.phone &&
        name == other.name &&
        employeeId == other.employeeId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, matetialName.hashCode);
    _$hash = $jc(_$hash, imgUrl.hashCode);
    _$hash = $jc(_$hash, recordId.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, employeeId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaterialRecord')
          ..add('matetialName', matetialName)
          ..add('imgUrl', imgUrl)
          ..add('recordId', recordId)
          ..add('phone', phone)
          ..add('name', name)
          ..add('employeeId', employeeId)
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

  ListBuilder<String>? _phone;
  ListBuilder<String> get phone => _$this._phone ??= new ListBuilder<String>();
  set phone(ListBuilder<String>? phone) => _$this._phone = phone;

  ListBuilder<String>? _name;
  ListBuilder<String> get name => _$this._name ??= new ListBuilder<String>();
  set name(ListBuilder<String>? name) => _$this._name = name;

  String? _employeeId;
  String? get employeeId => _$this._employeeId;
  set employeeId(String? employeeId) => _$this._employeeId = employeeId;

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
      _phone = $v.phone?.toBuilder();
      _name = $v.name?.toBuilder();
      _employeeId = $v.employeeId;
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
    _$MaterialRecord _$result;
    try {
      _$result = _$v ??
          new _$MaterialRecord._(
              matetialName: matetialName,
              imgUrl: imgUrl,
              recordId: recordId,
              phone: _phone?.build(),
              name: _name?.build(),
              employeeId: employeeId,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'phone';
        _phone?.build();
        _$failedField = 'name';
        _name?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MaterialRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
