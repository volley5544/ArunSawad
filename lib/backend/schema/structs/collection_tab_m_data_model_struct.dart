// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionTabMDataModelStruct extends FFFirebaseStruct {
  CollectionTabMDataModelStruct({
    String? branchName,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _branchName = branchName,
        _count = count,
        super(firestoreUtilData);

  // "branchName" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "Count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static CollectionTabMDataModelStruct fromMap(Map<String, dynamic> data) =>
      CollectionTabMDataModelStruct(
        branchName: data['branchName'] as String?,
        count: castToType<int>(data['Count']),
      );

  static CollectionTabMDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? CollectionTabMDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'branchName': _branchName,
        'Count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'branchName': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'Count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static CollectionTabMDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CollectionTabMDataModelStruct(
        branchName: deserializeParam(
          data['branchName'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['Count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CollectionTabMDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CollectionTabMDataModelStruct &&
        branchName == other.branchName &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([branchName, count]);
}

CollectionTabMDataModelStruct createCollectionTabMDataModelStruct({
  String? branchName,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CollectionTabMDataModelStruct(
      branchName: branchName,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CollectionTabMDataModelStruct? updateCollectionTabMDataModelStruct(
  CollectionTabMDataModelStruct? collectionTabMDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    collectionTabMDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCollectionTabMDataModelStructData(
  Map<String, dynamic> firestoreData,
  CollectionTabMDataModelStruct? collectionTabMDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (collectionTabMDataModel == null) {
    return;
  }
  if (collectionTabMDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      collectionTabMDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final collectionTabMDataModelData = getCollectionTabMDataModelFirestoreData(
      collectionTabMDataModel, forFieldValue);
  final nestedData =
      collectionTabMDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      collectionTabMDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCollectionTabMDataModelFirestoreData(
  CollectionTabMDataModelStruct? collectionTabMDataModel, [
  bool forFieldValue = false,
]) {
  if (collectionTabMDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(collectionTabMDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(collectionTabMDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCollectionTabMDataModelListFirestoreData(
  List<CollectionTabMDataModelStruct>? collectionTabMDataModels,
) =>
    collectionTabMDataModels
        ?.map((e) => getCollectionTabMDataModelFirestoreData(e, true))
        .toList() ??
    [];
