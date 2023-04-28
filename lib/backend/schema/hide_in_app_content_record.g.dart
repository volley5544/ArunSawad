// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hide_in_app_content_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HideInAppContentRecord> _$hideInAppContentRecordSerializer =
    new _$HideInAppContentRecordSerializer();

class _$HideInAppContentRecordSerializer
    implements StructuredSerializer<HideInAppContentRecord> {
  @override
  final Iterable<Type> types = const [
    HideInAppContentRecord,
    _$HideInAppContentRecord
  ];
  @override
  final String wireName = 'HideInAppContentRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HideInAppContentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.contentName;
    if (value != null) {
      result
        ..add('content_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isShowContent;
    if (value != null) {
      result
        ..add('isShowContent')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  HideInAppContentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HideInAppContentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'content_name':
          result.contentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isShowContent':
          result.isShowContent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$HideInAppContentRecord extends HideInAppContentRecord {
  @override
  final String? contentName;
  @override
  final bool? isShowContent;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$HideInAppContentRecord(
          [void Function(HideInAppContentRecordBuilder)? updates]) =>
      (new HideInAppContentRecordBuilder()..update(updates))._build();

  _$HideInAppContentRecord._({this.contentName, this.isShowContent, this.ffRef})
      : super._();

  @override
  HideInAppContentRecord rebuild(
          void Function(HideInAppContentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HideInAppContentRecordBuilder toBuilder() =>
      new HideInAppContentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HideInAppContentRecord &&
        contentName == other.contentName &&
        isShowContent == other.isShowContent &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentName.hashCode);
    _$hash = $jc(_$hash, isShowContent.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HideInAppContentRecord')
          ..add('contentName', contentName)
          ..add('isShowContent', isShowContent)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class HideInAppContentRecordBuilder
    implements Builder<HideInAppContentRecord, HideInAppContentRecordBuilder> {
  _$HideInAppContentRecord? _$v;

  String? _contentName;
  String? get contentName => _$this._contentName;
  set contentName(String? contentName) => _$this._contentName = contentName;

  bool? _isShowContent;
  bool? get isShowContent => _$this._isShowContent;
  set isShowContent(bool? isShowContent) =>
      _$this._isShowContent = isShowContent;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  HideInAppContentRecordBuilder() {
    HideInAppContentRecord._initializeBuilder(this);
  }

  HideInAppContentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentName = $v.contentName;
      _isShowContent = $v.isShowContent;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HideInAppContentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HideInAppContentRecord;
  }

  @override
  void update(void Function(HideInAppContentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HideInAppContentRecord build() => _build();

  _$HideInAppContentRecord _build() {
    final _$result = _$v ??
        new _$HideInAppContentRecord._(
            contentName: contentName,
            isShowContent: isShowContent,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
