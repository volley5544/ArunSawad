// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_content_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TextContentRecord> _$textContentRecordSerializer =
    new _$TextContentRecordSerializer();

class _$TextContentRecordSerializer
    implements StructuredSerializer<TextContentRecord> {
  @override
  final Iterable<Type> types = const [TextContentRecord, _$TextContentRecord];
  @override
  final String wireName = 'TextContentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TextContentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.kpiText;
    if (value != null) {
      result
        ..add('kpiText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kpiTextcolor;
    if (value != null) {
      result
        ..add('kpiTextcolor')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Color)));
    }
    value = object.kpiHideText;
    if (value != null) {
      result
        ..add('kpiHideText')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.contentName;
    if (value != null) {
      result
        ..add('contentName')
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
  TextContentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TextContentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'kpiText':
          result.kpiText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kpiTextcolor':
          result.kpiTextcolor = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color?;
          break;
        case 'kpiHideText':
          result.kpiHideText = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'contentName':
          result.contentName = serializers.deserialize(value,
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

class _$TextContentRecord extends TextContentRecord {
  @override
  final String? kpiText;
  @override
  final Color? kpiTextcolor;
  @override
  final bool? kpiHideText;
  @override
  final String? contentName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TextContentRecord(
          [void Function(TextContentRecordBuilder)? updates]) =>
      (new TextContentRecordBuilder()..update(updates))._build();

  _$TextContentRecord._(
      {this.kpiText,
      this.kpiTextcolor,
      this.kpiHideText,
      this.contentName,
      this.ffRef})
      : super._();

  @override
  TextContentRecord rebuild(void Function(TextContentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextContentRecordBuilder toBuilder() =>
      new TextContentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextContentRecord &&
        kpiText == other.kpiText &&
        kpiTextcolor == other.kpiTextcolor &&
        kpiHideText == other.kpiHideText &&
        contentName == other.contentName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kpiText.hashCode);
    _$hash = $jc(_$hash, kpiTextcolor.hashCode);
    _$hash = $jc(_$hash, kpiHideText.hashCode);
    _$hash = $jc(_$hash, contentName.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextContentRecord')
          ..add('kpiText', kpiText)
          ..add('kpiTextcolor', kpiTextcolor)
          ..add('kpiHideText', kpiHideText)
          ..add('contentName', contentName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TextContentRecordBuilder
    implements Builder<TextContentRecord, TextContentRecordBuilder> {
  _$TextContentRecord? _$v;

  String? _kpiText;
  String? get kpiText => _$this._kpiText;
  set kpiText(String? kpiText) => _$this._kpiText = kpiText;

  Color? _kpiTextcolor;
  Color? get kpiTextcolor => _$this._kpiTextcolor;
  set kpiTextcolor(Color? kpiTextcolor) => _$this._kpiTextcolor = kpiTextcolor;

  bool? _kpiHideText;
  bool? get kpiHideText => _$this._kpiHideText;
  set kpiHideText(bool? kpiHideText) => _$this._kpiHideText = kpiHideText;

  String? _contentName;
  String? get contentName => _$this._contentName;
  set contentName(String? contentName) => _$this._contentName = contentName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TextContentRecordBuilder() {
    TextContentRecord._initializeBuilder(this);
  }

  TextContentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kpiText = $v.kpiText;
      _kpiTextcolor = $v.kpiTextcolor;
      _kpiHideText = $v.kpiHideText;
      _contentName = $v.contentName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextContentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextContentRecord;
  }

  @override
  void update(void Function(TextContentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextContentRecord build() => _build();

  _$TextContentRecord _build() {
    final _$result = _$v ??
        new _$TextContentRecord._(
            kpiText: kpiText,
            kpiTextcolor: kpiTextcolor,
            kpiHideText: kpiHideText,
            contentName: contentName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
