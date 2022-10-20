// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sawad_form_services_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SawadFormServicesRecord> _$sawadFormServicesRecordSerializer =
    new _$SawadFormServicesRecordSerializer();

class _$SawadFormServicesRecordSerializer
    implements StructuredSerializer<SawadFormServicesRecord> {
  @override
  final Iterable<Type> types = const [
    SawadFormServicesRecord,
    _$SawadFormServicesRecord
  ];
  @override
  final String wireName = 'SawadFormServicesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SawadFormServicesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.formServiceImg;
    if (value != null) {
      result
        ..add('form_service_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.formServiceUrl;
    if (value != null) {
      result
        ..add('form_service_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.formServiceName;
    if (value != null) {
      result
        ..add('form_service_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.formServiceOrder;
    if (value != null) {
      result
        ..add('form_service_order')
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
  SawadFormServicesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SawadFormServicesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'form_service_img':
          result.formServiceImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'form_service_url':
          result.formServiceUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'form_service_name':
          result.formServiceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'form_service_order':
          result.formServiceOrder = serializers.deserialize(value,
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

class _$SawadFormServicesRecord extends SawadFormServicesRecord {
  @override
  final String? formServiceImg;
  @override
  final String? formServiceUrl;
  @override
  final String? formServiceName;
  @override
  final int? formServiceOrder;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SawadFormServicesRecord(
          [void Function(SawadFormServicesRecordBuilder)? updates]) =>
      (new SawadFormServicesRecordBuilder()..update(updates))._build();

  _$SawadFormServicesRecord._(
      {this.formServiceImg,
      this.formServiceUrl,
      this.formServiceName,
      this.formServiceOrder,
      this.ffRef})
      : super._();

  @override
  SawadFormServicesRecord rebuild(
          void Function(SawadFormServicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SawadFormServicesRecordBuilder toBuilder() =>
      new SawadFormServicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SawadFormServicesRecord &&
        formServiceImg == other.formServiceImg &&
        formServiceUrl == other.formServiceUrl &&
        formServiceName == other.formServiceName &&
        formServiceOrder == other.formServiceOrder &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, formServiceImg.hashCode), formServiceUrl.hashCode),
                formServiceName.hashCode),
            formServiceOrder.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SawadFormServicesRecord')
          ..add('formServiceImg', formServiceImg)
          ..add('formServiceUrl', formServiceUrl)
          ..add('formServiceName', formServiceName)
          ..add('formServiceOrder', formServiceOrder)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SawadFormServicesRecordBuilder
    implements
        Builder<SawadFormServicesRecord, SawadFormServicesRecordBuilder> {
  _$SawadFormServicesRecord? _$v;

  String? _formServiceImg;
  String? get formServiceImg => _$this._formServiceImg;
  set formServiceImg(String? formServiceImg) =>
      _$this._formServiceImg = formServiceImg;

  String? _formServiceUrl;
  String? get formServiceUrl => _$this._formServiceUrl;
  set formServiceUrl(String? formServiceUrl) =>
      _$this._formServiceUrl = formServiceUrl;

  String? _formServiceName;
  String? get formServiceName => _$this._formServiceName;
  set formServiceName(String? formServiceName) =>
      _$this._formServiceName = formServiceName;

  int? _formServiceOrder;
  int? get formServiceOrder => _$this._formServiceOrder;
  set formServiceOrder(int? formServiceOrder) =>
      _$this._formServiceOrder = formServiceOrder;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SawadFormServicesRecordBuilder() {
    SawadFormServicesRecord._initializeBuilder(this);
  }

  SawadFormServicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _formServiceImg = $v.formServiceImg;
      _formServiceUrl = $v.formServiceUrl;
      _formServiceName = $v.formServiceName;
      _formServiceOrder = $v.formServiceOrder;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SawadFormServicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SawadFormServicesRecord;
  }

  @override
  void update(void Function(SawadFormServicesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SawadFormServicesRecord build() => _build();

  _$SawadFormServicesRecord _build() {
    final _$result = _$v ??
        new _$SawadFormServicesRecord._(
            formServiceImg: formServiceImg,
            formServiceUrl: formServiceUrl,
            formServiceName: formServiceName,
            formServiceOrder: formServiceOrder,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
