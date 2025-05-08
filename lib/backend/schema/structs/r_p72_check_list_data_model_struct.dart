// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RP72CheckListDataModelStruct extends FFFirebaseStruct {
  RP72CheckListDataModelStruct({
    String? checklistSort,
    String? checklistId,
    String? isProcess,
    String? remark,
    String? checklistName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _checklistSort = checklistSort,
        _checklistId = checklistId,
        _isProcess = isProcess,
        _remark = remark,
        _checklistName = checklistName,
        super(firestoreUtilData);

  // "checklist_sort" field.
  String? _checklistSort;
  String get checklistSort => _checklistSort ?? '';
  set checklistSort(String? val) => _checklistSort = val;

  bool hasChecklistSort() => _checklistSort != null;

  // "checklist_id" field.
  String? _checklistId;
  String get checklistId => _checklistId ?? '';
  set checklistId(String? val) => _checklistId = val;

  bool hasChecklistId() => _checklistId != null;

  // "is_process" field.
  String? _isProcess;
  String get isProcess => _isProcess ?? '';
  set isProcess(String? val) => _isProcess = val;

  bool hasIsProcess() => _isProcess != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "checklist_name" field.
  String? _checklistName;
  String get checklistName => _checklistName ?? '';
  set checklistName(String? val) => _checklistName = val;

  bool hasChecklistName() => _checklistName != null;

  static RP72CheckListDataModelStruct fromMap(Map<String, dynamic> data) =>
      RP72CheckListDataModelStruct(
        checklistSort: data['checklist_sort'] as String?,
        checklistId: data['checklist_id'] as String?,
        isProcess: data['is_process'] as String?,
        remark: data['remark'] as String?,
        checklistName: data['checklist_name'] as String?,
      );

  static RP72CheckListDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? RP72CheckListDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'checklist_sort': _checklistSort,
        'checklist_id': _checklistId,
        'is_process': _isProcess,
        'remark': _remark,
        'checklist_name': _checklistName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'checklist_sort': serializeParam(
          _checklistSort,
          ParamType.String,
        ),
        'checklist_id': serializeParam(
          _checklistId,
          ParamType.String,
        ),
        'is_process': serializeParam(
          _isProcess,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'checklist_name': serializeParam(
          _checklistName,
          ParamType.String,
        ),
      }.withoutNulls;

  static RP72CheckListDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RP72CheckListDataModelStruct(
        checklistSort: deserializeParam(
          data['checklist_sort'],
          ParamType.String,
          false,
        ),
        checklistId: deserializeParam(
          data['checklist_id'],
          ParamType.String,
          false,
        ),
        isProcess: deserializeParam(
          data['is_process'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        checklistName: deserializeParam(
          data['checklist_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RP72CheckListDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RP72CheckListDataModelStruct &&
        checklistSort == other.checklistSort &&
        checklistId == other.checklistId &&
        isProcess == other.isProcess &&
        remark == other.remark &&
        checklistName == other.checklistName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([checklistSort, checklistId, isProcess, remark, checklistName]);
}

RP72CheckListDataModelStruct createRP72CheckListDataModelStruct({
  String? checklistSort,
  String? checklistId,
  String? isProcess,
  String? remark,
  String? checklistName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RP72CheckListDataModelStruct(
      checklistSort: checklistSort,
      checklistId: checklistId,
      isProcess: isProcess,
      remark: remark,
      checklistName: checklistName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RP72CheckListDataModelStruct? updateRP72CheckListDataModelStruct(
  RP72CheckListDataModelStruct? rP72CheckListDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rP72CheckListDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRP72CheckListDataModelStructData(
  Map<String, dynamic> firestoreData,
  RP72CheckListDataModelStruct? rP72CheckListDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rP72CheckListDataModel == null) {
    return;
  }
  if (rP72CheckListDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      rP72CheckListDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rP72CheckListDataModelData = getRP72CheckListDataModelFirestoreData(
      rP72CheckListDataModel, forFieldValue);
  final nestedData =
      rP72CheckListDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      rP72CheckListDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRP72CheckListDataModelFirestoreData(
  RP72CheckListDataModelStruct? rP72CheckListDataModel, [
  bool forFieldValue = false,
]) {
  if (rP72CheckListDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rP72CheckListDataModel.toMap());

  // Add any Firestore field values
  rP72CheckListDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRP72CheckListDataModelListFirestoreData(
  List<RP72CheckListDataModelStruct>? rP72CheckListDataModels,
) =>
    rP72CheckListDataModels
        ?.map((e) => getRP72CheckListDataModelFirestoreData(e, true))
        .toList() ??
    [];
