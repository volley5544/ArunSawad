// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SLSQrCodePaymentDataModelStruct extends FFFirebaseStruct {
  SLSQrCodePaymentDataModelStruct({
    String? companyCode,
    String? contractNo,
    String? qrPipe,
    String? qrTaxId,
    String? qrContractNo,
    String? qrPaymentType,
    String? qrDefaultAmt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyCode = companyCode,
        _contractNo = contractNo,
        _qrPipe = qrPipe,
        _qrTaxId = qrTaxId,
        _qrContractNo = qrContractNo,
        _qrPaymentType = qrPaymentType,
        _qrDefaultAmt = qrDefaultAmt,
        super(firestoreUtilData);

  // "companyCode" field.
  String? _companyCode;
  String get companyCode => _companyCode ?? '';
  set companyCode(String? val) => _companyCode = val;

  bool hasCompanyCode() => _companyCode != null;

  // "contractNo" field.
  String? _contractNo;
  String get contractNo => _contractNo ?? '';
  set contractNo(String? val) => _contractNo = val;

  bool hasContractNo() => _contractNo != null;

  // "qrPipe" field.
  String? _qrPipe;
  String get qrPipe => _qrPipe ?? '';
  set qrPipe(String? val) => _qrPipe = val;

  bool hasQrPipe() => _qrPipe != null;

  // "qrTaxId" field.
  String? _qrTaxId;
  String get qrTaxId => _qrTaxId ?? '';
  set qrTaxId(String? val) => _qrTaxId = val;

  bool hasQrTaxId() => _qrTaxId != null;

  // "qrContractNo" field.
  String? _qrContractNo;
  String get qrContractNo => _qrContractNo ?? '';
  set qrContractNo(String? val) => _qrContractNo = val;

  bool hasQrContractNo() => _qrContractNo != null;

  // "qrPaymentType" field.
  String? _qrPaymentType;
  String get qrPaymentType => _qrPaymentType ?? '';
  set qrPaymentType(String? val) => _qrPaymentType = val;

  bool hasQrPaymentType() => _qrPaymentType != null;

  // "qrDefaultAmt" field.
  String? _qrDefaultAmt;
  String get qrDefaultAmt => _qrDefaultAmt ?? '';
  set qrDefaultAmt(String? val) => _qrDefaultAmt = val;

  bool hasQrDefaultAmt() => _qrDefaultAmt != null;

  static SLSQrCodePaymentDataModelStruct fromMap(Map<String, dynamic> data) =>
      SLSQrCodePaymentDataModelStruct(
        companyCode: data['companyCode'] as String?,
        contractNo: data['contractNo'] as String?,
        qrPipe: data['qrPipe'] as String?,
        qrTaxId: data['qrTaxId'] as String?,
        qrContractNo: data['qrContractNo'] as String?,
        qrPaymentType: data['qrPaymentType'] as String?,
        qrDefaultAmt: data['qrDefaultAmt'] as String?,
      );

  static SLSQrCodePaymentDataModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? SLSQrCodePaymentDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'companyCode': _companyCode,
        'contractNo': _contractNo,
        'qrPipe': _qrPipe,
        'qrTaxId': _qrTaxId,
        'qrContractNo': _qrContractNo,
        'qrPaymentType': _qrPaymentType,
        'qrDefaultAmt': _qrDefaultAmt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'companyCode': serializeParam(
          _companyCode,
          ParamType.String,
        ),
        'contractNo': serializeParam(
          _contractNo,
          ParamType.String,
        ),
        'qrPipe': serializeParam(
          _qrPipe,
          ParamType.String,
        ),
        'qrTaxId': serializeParam(
          _qrTaxId,
          ParamType.String,
        ),
        'qrContractNo': serializeParam(
          _qrContractNo,
          ParamType.String,
        ),
        'qrPaymentType': serializeParam(
          _qrPaymentType,
          ParamType.String,
        ),
        'qrDefaultAmt': serializeParam(
          _qrDefaultAmt,
          ParamType.String,
        ),
      }.withoutNulls;

  static SLSQrCodePaymentDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SLSQrCodePaymentDataModelStruct(
        companyCode: deserializeParam(
          data['companyCode'],
          ParamType.String,
          false,
        ),
        contractNo: deserializeParam(
          data['contractNo'],
          ParamType.String,
          false,
        ),
        qrPipe: deserializeParam(
          data['qrPipe'],
          ParamType.String,
          false,
        ),
        qrTaxId: deserializeParam(
          data['qrTaxId'],
          ParamType.String,
          false,
        ),
        qrContractNo: deserializeParam(
          data['qrContractNo'],
          ParamType.String,
          false,
        ),
        qrPaymentType: deserializeParam(
          data['qrPaymentType'],
          ParamType.String,
          false,
        ),
        qrDefaultAmt: deserializeParam(
          data['qrDefaultAmt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SLSQrCodePaymentDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SLSQrCodePaymentDataModelStruct &&
        companyCode == other.companyCode &&
        contractNo == other.contractNo &&
        qrPipe == other.qrPipe &&
        qrTaxId == other.qrTaxId &&
        qrContractNo == other.qrContractNo &&
        qrPaymentType == other.qrPaymentType &&
        qrDefaultAmt == other.qrDefaultAmt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        companyCode,
        contractNo,
        qrPipe,
        qrTaxId,
        qrContractNo,
        qrPaymentType,
        qrDefaultAmt
      ]);
}

SLSQrCodePaymentDataModelStruct createSLSQrCodePaymentDataModelStruct({
  String? companyCode,
  String? contractNo,
  String? qrPipe,
  String? qrTaxId,
  String? qrContractNo,
  String? qrPaymentType,
  String? qrDefaultAmt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SLSQrCodePaymentDataModelStruct(
      companyCode: companyCode,
      contractNo: contractNo,
      qrPipe: qrPipe,
      qrTaxId: qrTaxId,
      qrContractNo: qrContractNo,
      qrPaymentType: qrPaymentType,
      qrDefaultAmt: qrDefaultAmt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SLSQrCodePaymentDataModelStruct? updateSLSQrCodePaymentDataModelStruct(
  SLSQrCodePaymentDataModelStruct? sLSQrCodePaymentDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sLSQrCodePaymentDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSLSQrCodePaymentDataModelStructData(
  Map<String, dynamic> firestoreData,
  SLSQrCodePaymentDataModelStruct? sLSQrCodePaymentDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sLSQrCodePaymentDataModel == null) {
    return;
  }
  if (sLSQrCodePaymentDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      sLSQrCodePaymentDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sLSQrCodePaymentDataModelData =
      getSLSQrCodePaymentDataModelFirestoreData(
          sLSQrCodePaymentDataModel, forFieldValue);
  final nestedData =
      sLSQrCodePaymentDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      sLSQrCodePaymentDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSLSQrCodePaymentDataModelFirestoreData(
  SLSQrCodePaymentDataModelStruct? sLSQrCodePaymentDataModel, [
  bool forFieldValue = false,
]) {
  if (sLSQrCodePaymentDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sLSQrCodePaymentDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(sLSQrCodePaymentDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSLSQrCodePaymentDataModelListFirestoreData(
  List<SLSQrCodePaymentDataModelStruct>? sLSQrCodePaymentDataModels,
) =>
    sLSQrCodePaymentDataModels
        ?.map((e) => getSLSQrCodePaymentDataModelFirestoreData(e, true))
        .toList() ??
    [];
