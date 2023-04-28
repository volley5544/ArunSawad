// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_version_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuildVersionRecord> _$buildVersionRecordSerializer =
    new _$BuildVersionRecordSerializer();

class _$BuildVersionRecordSerializer
    implements StructuredSerializer<BuildVersionRecord> {
  @override
  final Iterable<Type> types = const [BuildVersionRecord, _$BuildVersionRecord];
  @override
  final String wireName = 'BuildVersionRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BuildVersionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.appVersion;
    if (value != null) {
      result
        ..add('app_version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appVersionIos;
    if (value != null) {
      result
        ..add('app_version_ios')
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
  BuildVersionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuildVersionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'app_version':
          result.appVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_version_ios':
          result.appVersionIos = serializers.deserialize(value,
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

class _$BuildVersionRecord extends BuildVersionRecord {
  @override
  final String? appVersion;
  @override
  final String? appVersionIos;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BuildVersionRecord(
          [void Function(BuildVersionRecordBuilder)? updates]) =>
      (new BuildVersionRecordBuilder()..update(updates))._build();

  _$BuildVersionRecord._({this.appVersion, this.appVersionIos, this.ffRef})
      : super._();

  @override
  BuildVersionRecord rebuild(
          void Function(BuildVersionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuildVersionRecordBuilder toBuilder() =>
      new BuildVersionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuildVersionRecord &&
        appVersion == other.appVersion &&
        appVersionIos == other.appVersionIos &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jc(_$hash, appVersionIos.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuildVersionRecord')
          ..add('appVersion', appVersion)
          ..add('appVersionIos', appVersionIos)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BuildVersionRecordBuilder
    implements Builder<BuildVersionRecord, BuildVersionRecordBuilder> {
  _$BuildVersionRecord? _$v;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  String? _appVersionIos;
  String? get appVersionIos => _$this._appVersionIos;
  set appVersionIos(String? appVersionIos) =>
      _$this._appVersionIos = appVersionIos;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BuildVersionRecordBuilder() {
    BuildVersionRecord._initializeBuilder(this);
  }

  BuildVersionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appVersion = $v.appVersion;
      _appVersionIos = $v.appVersionIos;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuildVersionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuildVersionRecord;
  }

  @override
  void update(void Function(BuildVersionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuildVersionRecord build() => _build();

  _$BuildVersionRecord _build() {
    final _$result = _$v ??
        new _$BuildVersionRecord._(
            appVersion: appVersion, appVersionIos: appVersionIos, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
