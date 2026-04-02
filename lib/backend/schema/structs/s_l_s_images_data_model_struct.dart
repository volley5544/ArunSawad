// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SLSImagesDataModelStruct extends FFFirebaseStruct {
  SLSImagesDataModelStruct({
    String? contractNo,
    String? imgTypeName,
    String? imgPath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _contractNo = contractNo,
        _imgTypeName = imgTypeName,
        _imgPath = imgPath,
        super(firestoreUtilData);

  // "contract_no" field.
  String? _contractNo;
  String get contractNo => _contractNo ?? '';
  set contractNo(String? val) => _contractNo = val;

  bool hasContractNo() => _contractNo != null;

  // "img_type_name" field.
  String? _imgTypeName;
  String get imgTypeName => _imgTypeName ?? '';
  set imgTypeName(String? val) => _imgTypeName = val;

  bool hasImgTypeName() => _imgTypeName != null;

  // "img_path" field.
  String? _imgPath;
  String get imgPath => _imgPath ?? '';
  set imgPath(String? val) => _imgPath = val;

  bool hasImgPath() => _imgPath != null;

  static SLSImagesDataModelStruct fromMap(Map<String, dynamic> data) =>
      SLSImagesDataModelStruct(
        contractNo: data['contract_no'] as String?,
        imgTypeName: data['img_type_name'] as String?,
        imgPath: data['img_path'] as String?,
      );

  static SLSImagesDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SLSImagesDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'contract_no': _contractNo,
        'img_type_name': _imgTypeName,
        'img_path': _imgPath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contract_no': serializeParam(
          _contractNo,
          ParamType.String,
        ),
        'img_type_name': serializeParam(
          _imgTypeName,
          ParamType.String,
        ),
        'img_path': serializeParam(
          _imgPath,
          ParamType.String,
        ),
      }.withoutNulls;

  static SLSImagesDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SLSImagesDataModelStruct(
        contractNo: deserializeParam(
          data['contract_no'],
          ParamType.String,
          false,
        ),
        imgTypeName: deserializeParam(
          data['img_type_name'],
          ParamType.String,
          false,
        ),
        imgPath: deserializeParam(
          data['img_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SLSImagesDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SLSImagesDataModelStruct &&
        contractNo == other.contractNo &&
        imgTypeName == other.imgTypeName &&
        imgPath == other.imgPath;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([contractNo, imgTypeName, imgPath]);
}

SLSImagesDataModelStruct createSLSImagesDataModelStruct({
  String? contractNo,
  String? imgTypeName,
  String? imgPath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SLSImagesDataModelStruct(
      contractNo: contractNo,
      imgTypeName: imgTypeName,
      imgPath: imgPath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SLSImagesDataModelStruct? updateSLSImagesDataModelStruct(
  SLSImagesDataModelStruct? sLSImagesDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sLSImagesDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSLSImagesDataModelStructData(
  Map<String, dynamic> firestoreData,
  SLSImagesDataModelStruct? sLSImagesDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sLSImagesDataModel == null) {
    return;
  }
  if (sLSImagesDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sLSImagesDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sLSImagesDataModelData =
      getSLSImagesDataModelFirestoreData(sLSImagesDataModel, forFieldValue);
  final nestedData =
      sLSImagesDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      sLSImagesDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSLSImagesDataModelFirestoreData(
  SLSImagesDataModelStruct? sLSImagesDataModel, [
  bool forFieldValue = false,
]) {
  if (sLSImagesDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sLSImagesDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(sLSImagesDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSLSImagesDataModelListFirestoreData(
  List<SLSImagesDataModelStruct>? sLSImagesDataModels,
) =>
    sLSImagesDataModels
        ?.map((e) => getSLSImagesDataModelFirestoreData(e, true))
        .toList() ??
    [];
