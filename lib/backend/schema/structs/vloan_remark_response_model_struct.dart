// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VloanRemarkResponseModelStruct extends FFFirebaseStruct {
  VloanRemarkResponseModelStruct({
    String? httpStatus,
    String? responseBody,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _httpStatus = httpStatus,
        _responseBody = responseBody,
        super(firestoreUtilData);

  // "http_status" field.
  String? _httpStatus;
  String get httpStatus => _httpStatus ?? '';
  set httpStatus(String? val) => _httpStatus = val;

  bool hasHttpStatus() => _httpStatus != null;

  // "response_body" field.
  String? _responseBody;
  String get responseBody => _responseBody ?? '';
  set responseBody(String? val) => _responseBody = val;

  bool hasResponseBody() => _responseBody != null;

  static VloanRemarkResponseModelStruct fromMap(Map<String, dynamic> data) =>
      VloanRemarkResponseModelStruct(
        httpStatus: data['http_status'] as String?,
        responseBody: data['response_body'] as String?,
      );

  static VloanRemarkResponseModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? VloanRemarkResponseModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'http_status': _httpStatus,
        'response_body': _responseBody,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'http_status': serializeParam(
          _httpStatus,
          ParamType.String,
        ),
        'response_body': serializeParam(
          _responseBody,
          ParamType.String,
        ),
      }.withoutNulls;

  static VloanRemarkResponseModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VloanRemarkResponseModelStruct(
        httpStatus: deserializeParam(
          data['http_status'],
          ParamType.String,
          false,
        ),
        responseBody: deserializeParam(
          data['response_body'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VloanRemarkResponseModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VloanRemarkResponseModelStruct &&
        httpStatus == other.httpStatus &&
        responseBody == other.responseBody;
  }

  @override
  int get hashCode => const ListEquality().hash([httpStatus, responseBody]);
}

VloanRemarkResponseModelStruct createVloanRemarkResponseModelStruct({
  String? httpStatus,
  String? responseBody,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VloanRemarkResponseModelStruct(
      httpStatus: httpStatus,
      responseBody: responseBody,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VloanRemarkResponseModelStruct? updateVloanRemarkResponseModelStruct(
  VloanRemarkResponseModelStruct? vloanRemarkResponseModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vloanRemarkResponseModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVloanRemarkResponseModelStructData(
  Map<String, dynamic> firestoreData,
  VloanRemarkResponseModelStruct? vloanRemarkResponseModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vloanRemarkResponseModel == null) {
    return;
  }
  if (vloanRemarkResponseModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      vloanRemarkResponseModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vloanRemarkResponseModelData = getVloanRemarkResponseModelFirestoreData(
      vloanRemarkResponseModel, forFieldValue);
  final nestedData =
      vloanRemarkResponseModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      vloanRemarkResponseModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVloanRemarkResponseModelFirestoreData(
  VloanRemarkResponseModelStruct? vloanRemarkResponseModel, [
  bool forFieldValue = false,
]) {
  if (vloanRemarkResponseModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vloanRemarkResponseModel.toMap());

  // Add any Firestore field values
  mapToFirestore(vloanRemarkResponseModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVloanRemarkResponseModelListFirestoreData(
  List<VloanRemarkResponseModelStruct>? vloanRemarkResponseModels,
) =>
    vloanRemarkResponseModels
        ?.map((e) => getVloanRemarkResponseModelFirestoreData(e, true))
        .toList() ??
    [];
