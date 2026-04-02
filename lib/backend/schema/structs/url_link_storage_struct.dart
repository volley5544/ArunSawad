// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrlLinkStorageStruct extends FFFirebaseStruct {
  UrlLinkStorageStruct({
    String? urlLink,
    String? urlName,
    String? urlToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _urlLink = urlLink,
        _urlName = urlName,
        _urlToken = urlToken,
        super(firestoreUtilData);

  // "url_link" field.
  String? _urlLink;
  String get urlLink => _urlLink ?? '';
  set urlLink(String? val) => _urlLink = val;

  bool hasUrlLink() => _urlLink != null;

  // "url_name" field.
  String? _urlName;
  String get urlName => _urlName ?? '';
  set urlName(String? val) => _urlName = val;

  bool hasUrlName() => _urlName != null;

  // "url_token" field.
  String? _urlToken;
  String get urlToken => _urlToken ?? '';
  set urlToken(String? val) => _urlToken = val;

  bool hasUrlToken() => _urlToken != null;

  static UrlLinkStorageStruct fromMap(Map<String, dynamic> data) =>
      UrlLinkStorageStruct(
        urlLink: data['url_link'] as String?,
        urlName: data['url_name'] as String?,
        urlToken: data['url_token'] as String?,
      );

  static UrlLinkStorageStruct? maybeFromMap(dynamic data) => data is Map
      ? UrlLinkStorageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url_link': _urlLink,
        'url_name': _urlName,
        'url_token': _urlToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url_link': serializeParam(
          _urlLink,
          ParamType.String,
        ),
        'url_name': serializeParam(
          _urlName,
          ParamType.String,
        ),
        'url_token': serializeParam(
          _urlToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static UrlLinkStorageStruct fromSerializableMap(Map<String, dynamic> data) =>
      UrlLinkStorageStruct(
        urlLink: deserializeParam(
          data['url_link'],
          ParamType.String,
          false,
        ),
        urlName: deserializeParam(
          data['url_name'],
          ParamType.String,
          false,
        ),
        urlToken: deserializeParam(
          data['url_token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UrlLinkStorageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UrlLinkStorageStruct &&
        urlLink == other.urlLink &&
        urlName == other.urlName &&
        urlToken == other.urlToken;
  }

  @override
  int get hashCode => const ListEquality().hash([urlLink, urlName, urlToken]);
}

UrlLinkStorageStruct createUrlLinkStorageStruct({
  String? urlLink,
  String? urlName,
  String? urlToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UrlLinkStorageStruct(
      urlLink: urlLink,
      urlName: urlName,
      urlToken: urlToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UrlLinkStorageStruct? updateUrlLinkStorageStruct(
  UrlLinkStorageStruct? urlLinkStorage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    urlLinkStorage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUrlLinkStorageStructData(
  Map<String, dynamic> firestoreData,
  UrlLinkStorageStruct? urlLinkStorage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (urlLinkStorage == null) {
    return;
  }
  if (urlLinkStorage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && urlLinkStorage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final urlLinkStorageData =
      getUrlLinkStorageFirestoreData(urlLinkStorage, forFieldValue);
  final nestedData =
      urlLinkStorageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = urlLinkStorage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUrlLinkStorageFirestoreData(
  UrlLinkStorageStruct? urlLinkStorage, [
  bool forFieldValue = false,
]) {
  if (urlLinkStorage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(urlLinkStorage.toMap());

  // Add any Firestore field values
  mapToFirestore(urlLinkStorage.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUrlLinkStorageListFirestoreData(
  List<UrlLinkStorageStruct>? urlLinkStorages,
) =>
    urlLinkStorages
        ?.map((e) => getUrlLinkStorageFirestoreData(e, true))
        .toList() ??
    [];
