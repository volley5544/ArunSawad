// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_page_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LeavePageDataRecord> _$leavePageDataRecordSerializer =
    new _$LeavePageDataRecordSerializer();

class _$LeavePageDataRecordSerializer
    implements StructuredSerializer<LeavePageDataRecord> {
  @override
  final Iterable<Type> types = const [
    LeavePageDataRecord,
    _$LeavePageDataRecord
  ];
  @override
  final String wireName = 'LeavePageDataRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LeavePageDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.leaveTypeList;
    if (value != null) {
      result
        ..add('leave_type_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reasonToLeave;
    if (value != null) {
      result
        ..add('reason_to_leave')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.companyAsset;
    if (value != null) {
      result
        ..add('company_asset')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.daysLeaveTypeList;
    if (value != null) {
      result
        ..add('days_leave_type_list')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.showSendEmailBtn;
    if (value != null) {
      result
        ..add('showSendEmailBtn')
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
  LeavePageDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LeavePageDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'leave_type_list':
          result.leaveTypeList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'reason_to_leave':
          result.reasonToLeave.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'company_asset':
          result.companyAsset.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'days_leave_type_list':
          result.daysLeaveTypeList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'showSendEmailBtn':
          result.showSendEmailBtn = serializers.deserialize(value,
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

class _$LeavePageDataRecord extends LeavePageDataRecord {
  @override
  final BuiltList<String>? leaveTypeList;
  @override
  final BuiltList<String>? reasonToLeave;
  @override
  final BuiltList<String>? companyAsset;
  @override
  final BuiltList<String>? daysLeaveTypeList;
  @override
  final bool? showSendEmailBtn;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LeavePageDataRecord(
          [void Function(LeavePageDataRecordBuilder)? updates]) =>
      (new LeavePageDataRecordBuilder()..update(updates))._build();

  _$LeavePageDataRecord._(
      {this.leaveTypeList,
      this.reasonToLeave,
      this.companyAsset,
      this.daysLeaveTypeList,
      this.showSendEmailBtn,
      this.ffRef})
      : super._();

  @override
  LeavePageDataRecord rebuild(
          void Function(LeavePageDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LeavePageDataRecordBuilder toBuilder() =>
      new LeavePageDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LeavePageDataRecord &&
        leaveTypeList == other.leaveTypeList &&
        reasonToLeave == other.reasonToLeave &&
        companyAsset == other.companyAsset &&
        daysLeaveTypeList == other.daysLeaveTypeList &&
        showSendEmailBtn == other.showSendEmailBtn &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, leaveTypeList.hashCode);
    _$hash = $jc(_$hash, reasonToLeave.hashCode);
    _$hash = $jc(_$hash, companyAsset.hashCode);
    _$hash = $jc(_$hash, daysLeaveTypeList.hashCode);
    _$hash = $jc(_$hash, showSendEmailBtn.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LeavePageDataRecord')
          ..add('leaveTypeList', leaveTypeList)
          ..add('reasonToLeave', reasonToLeave)
          ..add('companyAsset', companyAsset)
          ..add('daysLeaveTypeList', daysLeaveTypeList)
          ..add('showSendEmailBtn', showSendEmailBtn)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LeavePageDataRecordBuilder
    implements Builder<LeavePageDataRecord, LeavePageDataRecordBuilder> {
  _$LeavePageDataRecord? _$v;

  ListBuilder<String>? _leaveTypeList;
  ListBuilder<String> get leaveTypeList =>
      _$this._leaveTypeList ??= new ListBuilder<String>();
  set leaveTypeList(ListBuilder<String>? leaveTypeList) =>
      _$this._leaveTypeList = leaveTypeList;

  ListBuilder<String>? _reasonToLeave;
  ListBuilder<String> get reasonToLeave =>
      _$this._reasonToLeave ??= new ListBuilder<String>();
  set reasonToLeave(ListBuilder<String>? reasonToLeave) =>
      _$this._reasonToLeave = reasonToLeave;

  ListBuilder<String>? _companyAsset;
  ListBuilder<String> get companyAsset =>
      _$this._companyAsset ??= new ListBuilder<String>();
  set companyAsset(ListBuilder<String>? companyAsset) =>
      _$this._companyAsset = companyAsset;

  ListBuilder<String>? _daysLeaveTypeList;
  ListBuilder<String> get daysLeaveTypeList =>
      _$this._daysLeaveTypeList ??= new ListBuilder<String>();
  set daysLeaveTypeList(ListBuilder<String>? daysLeaveTypeList) =>
      _$this._daysLeaveTypeList = daysLeaveTypeList;

  bool? _showSendEmailBtn;
  bool? get showSendEmailBtn => _$this._showSendEmailBtn;
  set showSendEmailBtn(bool? showSendEmailBtn) =>
      _$this._showSendEmailBtn = showSendEmailBtn;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LeavePageDataRecordBuilder() {
    LeavePageDataRecord._initializeBuilder(this);
  }

  LeavePageDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _leaveTypeList = $v.leaveTypeList?.toBuilder();
      _reasonToLeave = $v.reasonToLeave?.toBuilder();
      _companyAsset = $v.companyAsset?.toBuilder();
      _daysLeaveTypeList = $v.daysLeaveTypeList?.toBuilder();
      _showSendEmailBtn = $v.showSendEmailBtn;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LeavePageDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LeavePageDataRecord;
  }

  @override
  void update(void Function(LeavePageDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LeavePageDataRecord build() => _build();

  _$LeavePageDataRecord _build() {
    _$LeavePageDataRecord _$result;
    try {
      _$result = _$v ??
          new _$LeavePageDataRecord._(
              leaveTypeList: _leaveTypeList?.build(),
              reasonToLeave: _reasonToLeave?.build(),
              companyAsset: _companyAsset?.build(),
              daysLeaveTypeList: _daysLeaveTypeList?.build(),
              showSendEmailBtn: showSendEmailBtn,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'leaveTypeList';
        _leaveTypeList?.build();
        _$failedField = 'reasonToLeave';
        _reasonToLeave?.build();
        _$failedField = 'companyAsset';
        _companyAsset?.build();
        _$failedField = 'daysLeaveTypeList';
        _daysLeaveTypeList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LeavePageDataRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
