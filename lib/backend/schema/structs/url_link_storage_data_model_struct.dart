// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrlLinkStorageDataModelStruct extends FFFirebaseStruct {
  UrlLinkStorageDataModelStruct({
    List<String>? urlLink,
    List<String>? urlName,
    List<String>? urlToken,
    List<String>? urlLinkUat,
    List<String>? urlTokenUat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _urlLink = urlLink,
        _urlName = urlName,
        _urlToken = urlToken,
        _urlLinkUat = urlLinkUat,
        _urlTokenUat = urlTokenUat,
        super(firestoreUtilData);

  // "url_link" field.
  List<String>? _urlLink;
  List<String> get urlLink => _urlLink ?? const [];
  set urlLink(List<String>? val) => _urlLink = val;

  void updateUrlLink(Function(List<String>) updateFn) {
    updateFn(_urlLink ??= []);
  }

  bool hasUrlLink() => _urlLink != null;

  // "url_name" field.
  List<String>? _urlName;
  List<String> get urlName => _urlName ?? const [];
  set urlName(List<String>? val) => _urlName = val;

  void updateUrlName(Function(List<String>) updateFn) {
    updateFn(_urlName ??= []);
  }

  bool hasUrlName() => _urlName != null;

  // "url_token" field.
  List<String>? _urlToken;
  List<String> get urlToken => _urlToken ?? const [];
  set urlToken(List<String>? val) => _urlToken = val;

  void updateUrlToken(Function(List<String>) updateFn) {
    updateFn(_urlToken ??= []);
  }

  bool hasUrlToken() => _urlToken != null;

  // "url_link_uat" field.
  List<String>? _urlLinkUat;
  List<String> get urlLinkUat => _urlLinkUat ?? const [];
  set urlLinkUat(List<String>? val) => _urlLinkUat = val;

  void updateUrlLinkUat(Function(List<String>) updateFn) {
    updateFn(_urlLinkUat ??= []);
  }

  bool hasUrlLinkUat() => _urlLinkUat != null;

  // "url_token_uat" field.
  List<String>? _urlTokenUat;
  List<String> get urlTokenUat => _urlTokenUat ?? const [];
  set urlTokenUat(List<String>? val) => _urlTokenUat = val;

  void updateUrlTokenUat(Function(List<String>) updateFn) {
    updateFn(_urlTokenUat ??= []);
  }

  bool hasUrlTokenUat() => _urlTokenUat != null;

  static UrlLinkStorageDataModelStruct fromMap(Map<String, dynamic> data) =>
      UrlLinkStorageDataModelStruct(
        urlLink: getDataList(data['url_link']),
        urlName: getDataList(data['url_name']),
        urlToken: getDataList(data['url_token']),
        urlLinkUat: getDataList(data['url_link_uat']),
        urlTokenUat: getDataList(data['url_token_uat']),
      );

  static UrlLinkStorageDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? UrlLinkStorageDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'url_link': _urlLink,
        'url_name': _urlName,
        'url_token': _urlToken,
        'url_link_uat': _urlLinkUat,
        'url_token_uat': _urlTokenUat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url_link': serializeParam(
          _urlLink,
          ParamType.String,
          isList: true,
        ),
        'url_name': serializeParam(
          _urlName,
          ParamType.String,
          isList: true,
        ),
        'url_token': serializeParam(
          _urlToken,
          ParamType.String,
          isList: true,
        ),
        'url_link_uat': serializeParam(
          _urlLinkUat,
          ParamType.String,
          isList: true,
        ),
        'url_token_uat': serializeParam(
          _urlTokenUat,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static UrlLinkStorageDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UrlLinkStorageDataModelStruct(
        urlLink: deserializeParam<String>(
          data['url_link'],
          ParamType.String,
          true,
        ),
        urlName: deserializeParam<String>(
          data['url_name'],
          ParamType.String,
          true,
        ),
        urlToken: deserializeParam<String>(
          data['url_token'],
          ParamType.String,
          true,
        ),
        urlLinkUat: deserializeParam<String>(
          data['url_link_uat'],
          ParamType.String,
          true,
        ),
        urlTokenUat: deserializeParam<String>(
          data['url_token_uat'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'UrlLinkStorageDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UrlLinkStorageDataModelStruct &&
        listEquality.equals(urlLink, other.urlLink) &&
        listEquality.equals(urlName, other.urlName) &&
        listEquality.equals(urlToken, other.urlToken) &&
        listEquality.equals(urlLinkUat, other.urlLinkUat) &&
        listEquality.equals(urlTokenUat, other.urlTokenUat);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([urlLink, urlName, urlToken, urlLinkUat, urlTokenUat]);
}

UrlLinkStorageDataModelStruct createUrlLinkStorageDataModelStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UrlLinkStorageDataModelStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UrlLinkStorageDataModelStruct? updateUrlLinkStorageDataModelStruct(
  UrlLinkStorageDataModelStruct? urlLinkStorageDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    urlLinkStorageDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUrlLinkStorageDataModelStructData(
  Map<String, dynamic> firestoreData,
  UrlLinkStorageDataModelStruct? urlLinkStorageDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (urlLinkStorageDataModel == null) {
    return;
  }
  if (urlLinkStorageDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      urlLinkStorageDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final urlLinkStorageDataModelData = getUrlLinkStorageDataModelFirestoreData(
      urlLinkStorageDataModel, forFieldValue);
  final nestedData =
      urlLinkStorageDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      urlLinkStorageDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUrlLinkStorageDataModelFirestoreData(
  UrlLinkStorageDataModelStruct? urlLinkStorageDataModel, [
  bool forFieldValue = false,
]) {
  if (urlLinkStorageDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(urlLinkStorageDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(urlLinkStorageDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUrlLinkStorageDataModelListFirestoreData(
  List<UrlLinkStorageDataModelStruct>? urlLinkStorageDataModels,
) =>
    urlLinkStorageDataModels
        ?.map((e) => getUrlLinkStorageDataModelFirestoreData(e, true))
        .toList() ??
    [];
