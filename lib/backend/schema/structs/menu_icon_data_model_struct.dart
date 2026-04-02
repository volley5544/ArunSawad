// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuIconDataModelStruct extends FFFirebaseStruct {
  MenuIconDataModelStruct({
    String? name,
    String? icon,
    String? linkUrl,
    String? paramType,
    int? order,
    String? openType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _icon = icon,
        _linkUrl = linkUrl,
        _paramType = paramType,
        _order = order,
        _openType = openType,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "link_url" field.
  String? _linkUrl;
  String get linkUrl => _linkUrl ?? '';
  set linkUrl(String? val) => _linkUrl = val;

  bool hasLinkUrl() => _linkUrl != null;

  // "param_type" field.
  String? _paramType;
  String get paramType => _paramType ?? '';
  set paramType(String? val) => _paramType = val;

  bool hasParamType() => _paramType != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "open_type" field.
  String? _openType;
  String get openType => _openType ?? '';
  set openType(String? val) => _openType = val;

  bool hasOpenType() => _openType != null;

  static MenuIconDataModelStruct fromMap(Map<String, dynamic> data) =>
      MenuIconDataModelStruct(
        name: data['name'] as String?,
        icon: data['icon'] as String?,
        linkUrl: data['link_url'] as String?,
        paramType: data['param_type'] as String?,
        order: castToType<int>(data['order']),
        openType: data['open_type'] as String?,
      );

  static MenuIconDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MenuIconDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'icon': _icon,
        'link_url': _linkUrl,
        'param_type': _paramType,
        'order': _order,
        'open_type': _openType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'link_url': serializeParam(
          _linkUrl,
          ParamType.String,
        ),
        'param_type': serializeParam(
          _paramType,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'open_type': serializeParam(
          _openType,
          ParamType.String,
        ),
      }.withoutNulls;

  static MenuIconDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MenuIconDataModelStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        linkUrl: deserializeParam(
          data['link_url'],
          ParamType.String,
          false,
        ),
        paramType: deserializeParam(
          data['param_type'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        openType: deserializeParam(
          data['open_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MenuIconDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MenuIconDataModelStruct &&
        name == other.name &&
        icon == other.icon &&
        linkUrl == other.linkUrl &&
        paramType == other.paramType &&
        order == other.order &&
        openType == other.openType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, icon, linkUrl, paramType, order, openType]);
}

MenuIconDataModelStruct createMenuIconDataModelStruct({
  String? name,
  String? icon,
  String? linkUrl,
  String? paramType,
  int? order,
  String? openType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MenuIconDataModelStruct(
      name: name,
      icon: icon,
      linkUrl: linkUrl,
      paramType: paramType,
      order: order,
      openType: openType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MenuIconDataModelStruct? updateMenuIconDataModelStruct(
  MenuIconDataModelStruct? menuIconDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    menuIconDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMenuIconDataModelStructData(
  Map<String, dynamic> firestoreData,
  MenuIconDataModelStruct? menuIconDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (menuIconDataModel == null) {
    return;
  }
  if (menuIconDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && menuIconDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final menuIconDataModelData =
      getMenuIconDataModelFirestoreData(menuIconDataModel, forFieldValue);
  final nestedData =
      menuIconDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = menuIconDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMenuIconDataModelFirestoreData(
  MenuIconDataModelStruct? menuIconDataModel, [
  bool forFieldValue = false,
]) {
  if (menuIconDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(menuIconDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(menuIconDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMenuIconDataModelListFirestoreData(
  List<MenuIconDataModelStruct>? menuIconDataModels,
) =>
    menuIconDataModels
        ?.map((e) => getMenuIconDataModelFirestoreData(e, true))
        .toList() ??
    [];
