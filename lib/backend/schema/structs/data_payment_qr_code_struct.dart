// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataPaymentQrCodeStruct extends FFFirebaseStruct {
  DataPaymentQrCodeStruct({
    String? prefix,
    String? suffix,
    String? taxid,
    String? amount,
    String? ref1,
    String? ref2,
    String? amountBefore,
    String? sum624,
    String? pay624,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _prefix = prefix,
        _suffix = suffix,
        _taxid = taxid,
        _amount = amount,
        _ref1 = ref1,
        _ref2 = ref2,
        _amountBefore = amountBefore,
        _sum624 = sum624,
        _pay624 = pay624,
        super(firestoreUtilData);

  // "prefix" field.
  String? _prefix;
  String get prefix => _prefix ?? '';
  set prefix(String? val) => _prefix = val;

  bool hasPrefix() => _prefix != null;

  // "suffix" field.
  String? _suffix;
  String get suffix => _suffix ?? '';
  set suffix(String? val) => _suffix = val;

  bool hasSuffix() => _suffix != null;

  // "taxid" field.
  String? _taxid;
  String get taxid => _taxid ?? '';
  set taxid(String? val) => _taxid = val;

  bool hasTaxid() => _taxid != null;

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  set amount(String? val) => _amount = val;

  bool hasAmount() => _amount != null;

  // "ref1" field.
  String? _ref1;
  String get ref1 => _ref1 ?? '';
  set ref1(String? val) => _ref1 = val;

  bool hasRef1() => _ref1 != null;

  // "ref2" field.
  String? _ref2;
  String get ref2 => _ref2 ?? '';
  set ref2(String? val) => _ref2 = val;

  bool hasRef2() => _ref2 != null;

  // "amount_before" field.
  String? _amountBefore;
  String get amountBefore => _amountBefore ?? '';
  set amountBefore(String? val) => _amountBefore = val;

  bool hasAmountBefore() => _amountBefore != null;

  // "sum_624" field.
  String? _sum624;
  String get sum624 => _sum624 ?? '';
  set sum624(String? val) => _sum624 = val;

  bool hasSum624() => _sum624 != null;

  // "pay_624" field.
  String? _pay624;
  String get pay624 => _pay624 ?? '';
  set pay624(String? val) => _pay624 = val;

  bool hasPay624() => _pay624 != null;

  static DataPaymentQrCodeStruct fromMap(Map<String, dynamic> data) =>
      DataPaymentQrCodeStruct(
        prefix: data['prefix'] as String?,
        suffix: data['suffix'] as String?,
        taxid: data['taxid'] as String?,
        amount: data['amount'] as String?,
        ref1: data['ref1'] as String?,
        ref2: data['ref2'] as String?,
        amountBefore: data['amount_before'] as String?,
        sum624: data['sum_624'] as String?,
        pay624: data['pay_624'] as String?,
      );

  static DataPaymentQrCodeStruct? maybeFromMap(dynamic data) => data is Map
      ? DataPaymentQrCodeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prefix': _prefix,
        'suffix': _suffix,
        'taxid': _taxid,
        'amount': _amount,
        'ref1': _ref1,
        'ref2': _ref2,
        'amount_before': _amountBefore,
        'sum_624': _sum624,
        'pay_624': _pay624,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'prefix': serializeParam(
          _prefix,
          ParamType.String,
        ),
        'suffix': serializeParam(
          _suffix,
          ParamType.String,
        ),
        'taxid': serializeParam(
          _taxid,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.String,
        ),
        'ref1': serializeParam(
          _ref1,
          ParamType.String,
        ),
        'ref2': serializeParam(
          _ref2,
          ParamType.String,
        ),
        'amount_before': serializeParam(
          _amountBefore,
          ParamType.String,
        ),
        'sum_624': serializeParam(
          _sum624,
          ParamType.String,
        ),
        'pay_624': serializeParam(
          _pay624,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataPaymentQrCodeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataPaymentQrCodeStruct(
        prefix: deserializeParam(
          data['prefix'],
          ParamType.String,
          false,
        ),
        suffix: deserializeParam(
          data['suffix'],
          ParamType.String,
          false,
        ),
        taxid: deserializeParam(
          data['taxid'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.String,
          false,
        ),
        ref1: deserializeParam(
          data['ref1'],
          ParamType.String,
          false,
        ),
        ref2: deserializeParam(
          data['ref2'],
          ParamType.String,
          false,
        ),
        amountBefore: deserializeParam(
          data['amount_before'],
          ParamType.String,
          false,
        ),
        sum624: deserializeParam(
          data['sum_624'],
          ParamType.String,
          false,
        ),
        pay624: deserializeParam(
          data['pay_624'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataPaymentQrCodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataPaymentQrCodeStruct &&
        prefix == other.prefix &&
        suffix == other.suffix &&
        taxid == other.taxid &&
        amount == other.amount &&
        ref1 == other.ref1 &&
        ref2 == other.ref2 &&
        amountBefore == other.amountBefore &&
        sum624 == other.sum624 &&
        pay624 == other.pay624;
  }

  @override
  int get hashCode => const ListEquality().hash([
        prefix,
        suffix,
        taxid,
        amount,
        ref1,
        ref2,
        amountBefore,
        sum624,
        pay624
      ]);
}

DataPaymentQrCodeStruct createDataPaymentQrCodeStruct({
  String? prefix,
  String? suffix,
  String? taxid,
  String? amount,
  String? ref1,
  String? ref2,
  String? amountBefore,
  String? sum624,
  String? pay624,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataPaymentQrCodeStruct(
      prefix: prefix,
      suffix: suffix,
      taxid: taxid,
      amount: amount,
      ref1: ref1,
      ref2: ref2,
      amountBefore: amountBefore,
      sum624: sum624,
      pay624: pay624,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataPaymentQrCodeStruct? updateDataPaymentQrCodeStruct(
  DataPaymentQrCodeStruct? dataPaymentQrCode, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataPaymentQrCode
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataPaymentQrCodeStructData(
  Map<String, dynamic> firestoreData,
  DataPaymentQrCodeStruct? dataPaymentQrCode,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataPaymentQrCode == null) {
    return;
  }
  if (dataPaymentQrCode.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataPaymentQrCode.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataPaymentQrCodeData =
      getDataPaymentQrCodeFirestoreData(dataPaymentQrCode, forFieldValue);
  final nestedData =
      dataPaymentQrCodeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataPaymentQrCode.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataPaymentQrCodeFirestoreData(
  DataPaymentQrCodeStruct? dataPaymentQrCode, [
  bool forFieldValue = false,
]) {
  if (dataPaymentQrCode == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataPaymentQrCode.toMap());

  // Add any Firestore field values
  dataPaymentQrCode.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataPaymentQrCodeListFirestoreData(
  List<DataPaymentQrCodeStruct>? dataPaymentQrCodes,
) =>
    dataPaymentQrCodes
        ?.map((e) => getDataPaymentQrCodeFirestoreData(e, true))
        .toList() ??
    [];
