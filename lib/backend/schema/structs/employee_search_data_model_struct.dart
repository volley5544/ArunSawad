// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeSearchDataModelStruct extends FFFirebaseStruct {
  EmployeeSearchDataModelStruct({
    String? fullName,
    String? employeeCode,
    String? position,
    String? branchCode,
    DocumentReference? userDocRef,
    String? userDisplayImage,
    String? userDisplayImageBlurHash,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fullName = fullName,
        _employeeCode = employeeCode,
        _position = position,
        _branchCode = branchCode,
        _userDocRef = userDocRef,
        _userDisplayImage = userDisplayImage,
        _userDisplayImageBlurHash = userDisplayImageBlurHash,
        super(firestoreUtilData);

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "EmployeeCode" field.
  String? _employeeCode;
  String get employeeCode => _employeeCode ?? '';
  set employeeCode(String? val) => _employeeCode = val;

  bool hasEmployeeCode() => _employeeCode != null;

  // "Position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;

  bool hasPosition() => _position != null;

  // "BranchCode" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "user_doc_ref" field.
  DocumentReference? _userDocRef;
  DocumentReference? get userDocRef => _userDocRef;
  set userDocRef(DocumentReference? val) => _userDocRef = val;

  bool hasUserDocRef() => _userDocRef != null;

  // "user_display_image" field.
  String? _userDisplayImage;
  String get userDisplayImage => _userDisplayImage ?? '';
  set userDisplayImage(String? val) => _userDisplayImage = val;

  bool hasUserDisplayImage() => _userDisplayImage != null;

  // "user_display_image_blur_hash" field.
  String? _userDisplayImageBlurHash;
  String get userDisplayImageBlurHash => _userDisplayImageBlurHash ?? '';
  set userDisplayImageBlurHash(String? val) => _userDisplayImageBlurHash = val;

  bool hasUserDisplayImageBlurHash() => _userDisplayImageBlurHash != null;

  static EmployeeSearchDataModelStruct fromMap(Map<String, dynamic> data) =>
      EmployeeSearchDataModelStruct(
        fullName: data['FullName'] as String?,
        employeeCode: data['EmployeeCode'] as String?,
        position: data['Position'] as String?,
        branchCode: data['BranchCode'] as String?,
        userDocRef: data['user_doc_ref'] as DocumentReference?,
        userDisplayImage: data['user_display_image'] as String?,
        userDisplayImageBlurHash:
            data['user_display_image_blur_hash'] as String?,
      );

  static EmployeeSearchDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? EmployeeSearchDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'FullName': _fullName,
        'EmployeeCode': _employeeCode,
        'Position': _position,
        'BranchCode': _branchCode,
        'user_doc_ref': _userDocRef,
        'user_display_image': _userDisplayImage,
        'user_display_image_blur_hash': _userDisplayImageBlurHash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'FullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'EmployeeCode': serializeParam(
          _employeeCode,
          ParamType.String,
        ),
        'Position': serializeParam(
          _position,
          ParamType.String,
        ),
        'BranchCode': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'user_doc_ref': serializeParam(
          _userDocRef,
          ParamType.DocumentReference,
        ),
        'user_display_image': serializeParam(
          _userDisplayImage,
          ParamType.String,
        ),
        'user_display_image_blur_hash': serializeParam(
          _userDisplayImageBlurHash,
          ParamType.String,
        ),
      }.withoutNulls;

  static EmployeeSearchDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmployeeSearchDataModelStruct(
        fullName: deserializeParam(
          data['FullName'],
          ParamType.String,
          false,
        ),
        employeeCode: deserializeParam(
          data['EmployeeCode'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['Position'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['BranchCode'],
          ParamType.String,
          false,
        ),
        userDocRef: deserializeParam(
          data['user_doc_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user_custom'],
        ),
        userDisplayImage: deserializeParam(
          data['user_display_image'],
          ParamType.String,
          false,
        ),
        userDisplayImageBlurHash: deserializeParam(
          data['user_display_image_blur_hash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EmployeeSearchDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmployeeSearchDataModelStruct &&
        fullName == other.fullName &&
        employeeCode == other.employeeCode &&
        position == other.position &&
        branchCode == other.branchCode &&
        userDocRef == other.userDocRef &&
        userDisplayImage == other.userDisplayImage &&
        userDisplayImageBlurHash == other.userDisplayImageBlurHash;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fullName,
        employeeCode,
        position,
        branchCode,
        userDocRef,
        userDisplayImage,
        userDisplayImageBlurHash
      ]);
}

EmployeeSearchDataModelStruct createEmployeeSearchDataModelStruct({
  String? fullName,
  String? employeeCode,
  String? position,
  String? branchCode,
  DocumentReference? userDocRef,
  String? userDisplayImage,
  String? userDisplayImageBlurHash,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmployeeSearchDataModelStruct(
      fullName: fullName,
      employeeCode: employeeCode,
      position: position,
      branchCode: branchCode,
      userDocRef: userDocRef,
      userDisplayImage: userDisplayImage,
      userDisplayImageBlurHash: userDisplayImageBlurHash,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmployeeSearchDataModelStruct? updateEmployeeSearchDataModelStruct(
  EmployeeSearchDataModelStruct? employeeSearchDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    employeeSearchDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmployeeSearchDataModelStructData(
  Map<String, dynamic> firestoreData,
  EmployeeSearchDataModelStruct? employeeSearchDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (employeeSearchDataModel == null) {
    return;
  }
  if (employeeSearchDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      employeeSearchDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final employeeSearchDataModelData = getEmployeeSearchDataModelFirestoreData(
      employeeSearchDataModel, forFieldValue);
  final nestedData =
      employeeSearchDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      employeeSearchDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmployeeSearchDataModelFirestoreData(
  EmployeeSearchDataModelStruct? employeeSearchDataModel, [
  bool forFieldValue = false,
]) {
  if (employeeSearchDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(employeeSearchDataModel.toMap());

  // Add any Firestore field values
  employeeSearchDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmployeeSearchDataModelListFirestoreData(
  List<EmployeeSearchDataModelStruct>? employeeSearchDataModels,
) =>
    employeeSearchDataModels
        ?.map((e) => getEmployeeSearchDataModelFirestoreData(e, true))
        .toList() ??
    [];
