// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageMDataModelStruct extends FFFirebaseStruct {
  ImageMDataModelStruct({
    String? applicationNo,
    String? contractNo,
    String? imgTypeName,
    String? imgPath,
    String? eTLCreateDate,
    String? fileName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _applicationNo = applicationNo,
        _contractNo = contractNo,
        _imgTypeName = imgTypeName,
        _imgPath = imgPath,
        _eTLCreateDate = eTLCreateDate,
        _fileName = fileName,
        super(firestoreUtilData);

  // "application_no" field.
  String? _applicationNo;
  String get applicationNo => _applicationNo ?? '';
  set applicationNo(String? val) => _applicationNo = val;

  bool hasApplicationNo() => _applicationNo != null;

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

  // "ETLCreateDate" field.
  String? _eTLCreateDate;
  String get eTLCreateDate => _eTLCreateDate ?? '';
  set eTLCreateDate(String? val) => _eTLCreateDate = val;

  bool hasETLCreateDate() => _eTLCreateDate != null;

  // "FileName" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  set fileName(String? val) => _fileName = val;

  bool hasFileName() => _fileName != null;

  static ImageMDataModelStruct fromMap(Map<String, dynamic> data) =>
      ImageMDataModelStruct(
        applicationNo: data['application_no'] as String?,
        contractNo: data['contract_no'] as String?,
        imgTypeName: data['img_type_name'] as String?,
        imgPath: data['img_path'] as String?,
        eTLCreateDate: data['ETLCreateDate'] as String?,
        fileName: data['FileName'] as String?,
      );

  static ImageMDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageMDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'application_no': _applicationNo,
        'contract_no': _contractNo,
        'img_type_name': _imgTypeName,
        'img_path': _imgPath,
        'ETLCreateDate': _eTLCreateDate,
        'FileName': _fileName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'application_no': serializeParam(
          _applicationNo,
          ParamType.String,
        ),
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
        'ETLCreateDate': serializeParam(
          _eTLCreateDate,
          ParamType.String,
        ),
        'FileName': serializeParam(
          _fileName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageMDataModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageMDataModelStruct(
        applicationNo: deserializeParam(
          data['application_no'],
          ParamType.String,
          false,
        ),
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
        eTLCreateDate: deserializeParam(
          data['ETLCreateDate'],
          ParamType.String,
          false,
        ),
        fileName: deserializeParam(
          data['FileName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageMDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageMDataModelStruct &&
        applicationNo == other.applicationNo &&
        contractNo == other.contractNo &&
        imgTypeName == other.imgTypeName &&
        imgPath == other.imgPath &&
        eTLCreateDate == other.eTLCreateDate &&
        fileName == other.fileName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        applicationNo,
        contractNo,
        imgTypeName,
        imgPath,
        eTLCreateDate,
        fileName
      ]);
}

ImageMDataModelStruct createImageMDataModelStruct({
  String? applicationNo,
  String? contractNo,
  String? imgTypeName,
  String? imgPath,
  String? eTLCreateDate,
  String? fileName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageMDataModelStruct(
      applicationNo: applicationNo,
      contractNo: contractNo,
      imgTypeName: imgTypeName,
      imgPath: imgPath,
      eTLCreateDate: eTLCreateDate,
      fileName: fileName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageMDataModelStruct? updateImageMDataModelStruct(
  ImageMDataModelStruct? imageMDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageMDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageMDataModelStructData(
  Map<String, dynamic> firestoreData,
  ImageMDataModelStruct? imageMDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageMDataModel == null) {
    return;
  }
  if (imageMDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageMDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageMDataModelData =
      getImageMDataModelFirestoreData(imageMDataModel, forFieldValue);
  final nestedData =
      imageMDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageMDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageMDataModelFirestoreData(
  ImageMDataModelStruct? imageMDataModel, [
  bool forFieldValue = false,
]) {
  if (imageMDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageMDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(imageMDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageMDataModelListFirestoreData(
  List<ImageMDataModelStruct>? imageMDataModels,
) =>
    imageMDataModels
        ?.map((e) => getImageMDataModelFirestoreData(e, true))
        .toList() ??
    [];
