// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sawad_announcement_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SawadAnnouncementRecord> _$sawadAnnouncementRecordSerializer =
    new _$SawadAnnouncementRecordSerializer();

class _$SawadAnnouncementRecordSerializer
    implements StructuredSerializer<SawadAnnouncementRecord> {
  @override
  final Iterable<Type> types = const [
    SawadAnnouncementRecord,
    _$SawadAnnouncementRecord
  ];
  @override
  final String wireName = 'SawadAnnouncementRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SawadAnnouncementRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.announceDate;
    if (value != null) {
      result
        ..add('announce_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.body;
    if (value != null) {
      result
        ..add('body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pdfUrl;
    if (value != null) {
      result
        ..add('pdf_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.order;
    if (value != null) {
      result
        ..add('order')
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
  SawadAnnouncementRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SawadAnnouncementRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'announce_date':
          result.announceDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pdf_url':
          result.pdfUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
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

class _$SawadAnnouncementRecord extends SawadAnnouncementRecord {
  @override
  final String? title;
  @override
  final String? announceDate;
  @override
  final String? body;
  @override
  final String? pdfUrl;
  @override
  final int? order;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SawadAnnouncementRecord(
          [void Function(SawadAnnouncementRecordBuilder)? updates]) =>
      (new SawadAnnouncementRecordBuilder()..update(updates))._build();

  _$SawadAnnouncementRecord._(
      {this.title,
      this.announceDate,
      this.body,
      this.pdfUrl,
      this.order,
      this.ffRef})
      : super._();

  @override
  SawadAnnouncementRecord rebuild(
          void Function(SawadAnnouncementRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SawadAnnouncementRecordBuilder toBuilder() =>
      new SawadAnnouncementRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SawadAnnouncementRecord &&
        title == other.title &&
        announceDate == other.announceDate &&
        body == other.body &&
        pdfUrl == other.pdfUrl &&
        order == other.order &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, announceDate.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, pdfUrl.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SawadAnnouncementRecord')
          ..add('title', title)
          ..add('announceDate', announceDate)
          ..add('body', body)
          ..add('pdfUrl', pdfUrl)
          ..add('order', order)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SawadAnnouncementRecordBuilder
    implements
        Builder<SawadAnnouncementRecord, SawadAnnouncementRecordBuilder> {
  _$SawadAnnouncementRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _announceDate;
  String? get announceDate => _$this._announceDate;
  set announceDate(String? announceDate) => _$this._announceDate = announceDate;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _pdfUrl;
  String? get pdfUrl => _$this._pdfUrl;
  set pdfUrl(String? pdfUrl) => _$this._pdfUrl = pdfUrl;

  int? _order;
  int? get order => _$this._order;
  set order(int? order) => _$this._order = order;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SawadAnnouncementRecordBuilder() {
    SawadAnnouncementRecord._initializeBuilder(this);
  }

  SawadAnnouncementRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _announceDate = $v.announceDate;
      _body = $v.body;
      _pdfUrl = $v.pdfUrl;
      _order = $v.order;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SawadAnnouncementRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SawadAnnouncementRecord;
  }

  @override
  void update(void Function(SawadAnnouncementRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SawadAnnouncementRecord build() => _build();

  _$SawadAnnouncementRecord _build() {
    final _$result = _$v ??
        new _$SawadAnnouncementRecord._(
            title: title,
            announceDate: announceDate,
            body: body,
            pdfUrl: pdfUrl,
            order: order,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
