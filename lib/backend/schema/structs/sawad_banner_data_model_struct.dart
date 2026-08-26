// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SawadBannerDataModelStruct extends FFFirebaseStruct {
  SawadBannerDataModelStruct({
    String? blurHash,
    String? imgUrl,
    bool? includeSlash,
    int? index,
    bool? isHaveLink,
    String? linkUrl,
    String? openType,
    String? paramType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _blurHash = blurHash,
        _imgUrl = imgUrl,
        _includeSlash = includeSlash,
        _index = index,
        _isHaveLink = isHaveLink,
        _linkUrl = linkUrl,
        _openType = openType,
        _paramType = paramType,
        super(firestoreUtilData);

  // "blur_hash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;

  bool hasBlurHash() => _blurHash != null;

  // "img_url" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  set imgUrl(String? val) => _imgUrl = val;

  bool hasImgUrl() => _imgUrl != null;

  // "include_slash" field.
  bool? _includeSlash;
  bool get includeSlash => _includeSlash ?? false;
  set includeSlash(bool? val) => _includeSlash = val;

  bool hasIncludeSlash() => _includeSlash != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "isHaveLink" field.
  bool? _isHaveLink;
  bool get isHaveLink => _isHaveLink ?? false;
  set isHaveLink(bool? val) => _isHaveLink = val;

  bool hasIsHaveLink() => _isHaveLink != null;

  // "link_url" field.
  String? _linkUrl;
  String get linkUrl => _linkUrl ?? '';
  set linkUrl(String? val) => _linkUrl = val;

  bool hasLinkUrl() => _linkUrl != null;

  // "open_type" field.
  String? _openType;
  String get openType => _openType ?? '';
  set openType(String? val) => _openType = val;

  bool hasOpenType() => _openType != null;

  // "param_type" field.
  String? _paramType;
  String get paramType => _paramType ?? '';
  set paramType(String? val) => _paramType = val;

  bool hasParamType() => _paramType != null;

  static SawadBannerDataModelStruct fromMap(Map<String, dynamic> data) =>
      SawadBannerDataModelStruct(
        blurHash: data['blur_hash'] as String?,
        imgUrl: data['img_url'] as String?,
        includeSlash: data['include_slash'] as bool?,
        index: castToType<int>(data['index']),
        isHaveLink: data['isHaveLink'] as bool?,
        linkUrl: data['link_url'] as String?,
        openType: data['open_type'] as String?,
        paramType: data['param_type'] as String?,
      );

  static SawadBannerDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SawadBannerDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'blur_hash': _blurHash,
        'img_url': _imgUrl,
        'include_slash': _includeSlash,
        'index': _index,
        'isHaveLink': _isHaveLink,
        'link_url': _linkUrl,
        'open_type': _openType,
        'param_type': _paramType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'blur_hash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
        'img_url': serializeParam(
          _imgUrl,
          ParamType.String,
        ),
        'include_slash': serializeParam(
          _includeSlash,
          ParamType.bool,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'isHaveLink': serializeParam(
          _isHaveLink,
          ParamType.bool,
        ),
        'link_url': serializeParam(
          _linkUrl,
          ParamType.String,
        ),
        'open_type': serializeParam(
          _openType,
          ParamType.String,
        ),
        'param_type': serializeParam(
          _paramType,
          ParamType.String,
        ),
      }.withoutNulls;

  static SawadBannerDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SawadBannerDataModelStruct(
        blurHash: deserializeParam(
          data['blur_hash'],
          ParamType.String,
          false,
        ),
        imgUrl: deserializeParam(
          data['img_url'],
          ParamType.String,
          false,
        ),
        includeSlash: deserializeParam(
          data['include_slash'],
          ParamType.bool,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        isHaveLink: deserializeParam(
          data['isHaveLink'],
          ParamType.bool,
          false,
        ),
        linkUrl: deserializeParam(
          data['link_url'],
          ParamType.String,
          false,
        ),
        openType: deserializeParam(
          data['open_type'],
          ParamType.String,
          false,
        ),
        paramType: deserializeParam(
          data['param_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SawadBannerDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SawadBannerDataModelStruct &&
        blurHash == other.blurHash &&
        imgUrl == other.imgUrl &&
        includeSlash == other.includeSlash &&
        index == other.index &&
        isHaveLink == other.isHaveLink &&
        linkUrl == other.linkUrl &&
        openType == other.openType &&
        paramType == other.paramType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        blurHash,
        imgUrl,
        includeSlash,
        index,
        isHaveLink,
        linkUrl,
        openType,
        paramType
      ]);
}

SawadBannerDataModelStruct createSawadBannerDataModelStruct({
  String? blurHash,
  String? imgUrl,
  bool? includeSlash,
  int? index,
  bool? isHaveLink,
  String? linkUrl,
  String? openType,
  String? paramType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SawadBannerDataModelStruct(
      blurHash: blurHash,
      imgUrl: imgUrl,
      includeSlash: includeSlash,
      index: index,
      isHaveLink: isHaveLink,
      linkUrl: linkUrl,
      openType: openType,
      paramType: paramType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SawadBannerDataModelStruct? updateSawadBannerDataModelStruct(
  SawadBannerDataModelStruct? sawadBannerDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sawadBannerDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSawadBannerDataModelStructData(
  Map<String, dynamic> firestoreData,
  SawadBannerDataModelStruct? sawadBannerDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sawadBannerDataModel == null) {
    return;
  }
  if (sawadBannerDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sawadBannerDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sawadBannerDataModelData =
      getSawadBannerDataModelFirestoreData(sawadBannerDataModel, forFieldValue);
  final nestedData =
      sawadBannerDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      sawadBannerDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSawadBannerDataModelFirestoreData(
  SawadBannerDataModelStruct? sawadBannerDataModel, [
  bool forFieldValue = false,
]) {
  if (sawadBannerDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sawadBannerDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(sawadBannerDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSawadBannerDataModelListFirestoreData(
  List<SawadBannerDataModelStruct>? sawadBannerDataModels,
) =>
    sawadBannerDataModels
        ?.map((e) => getSawadBannerDataModelFirestoreData(e, true))
        .toList() ??
    [];
