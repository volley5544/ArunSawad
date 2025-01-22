// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrackingEmployeeDateModelStruct extends FFFirebaseStruct {
  TrackingEmployeeDateModelStruct({
    String? date,
    int? totals,
    List<TrackingEmployeeLocationModelStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _totals = totals,
        _data = data,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "totals" field.
  int? _totals;
  int get totals => _totals ?? 0;
  set totals(int? val) => _totals = val;

  void incrementTotals(int amount) => totals = totals + amount;

  bool hasTotals() => _totals != null;

  // "data" field.
  List<TrackingEmployeeLocationModelStruct>? _data;
  List<TrackingEmployeeLocationModelStruct> get data => _data ?? const [];
  set data(List<TrackingEmployeeLocationModelStruct>? val) => _data = val;

  void updateData(
      Function(List<TrackingEmployeeLocationModelStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static TrackingEmployeeDateModelStruct fromMap(Map<String, dynamic> data) =>
      TrackingEmployeeDateModelStruct(
        date: data['date'] as String?,
        totals: castToType<int>(data['totals']),
        data: getStructList(
          data['data'],
          TrackingEmployeeLocationModelStruct.fromMap,
        ),
      );

  static TrackingEmployeeDateModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? TrackingEmployeeDateModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'totals': _totals,
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'totals': serializeParam(
          _totals,
          ParamType.int,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TrackingEmployeeDateModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TrackingEmployeeDateModelStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        totals: deserializeParam(
          data['totals'],
          ParamType.int,
          false,
        ),
        data: deserializeStructParam<TrackingEmployeeLocationModelStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder:
              TrackingEmployeeLocationModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TrackingEmployeeDateModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TrackingEmployeeDateModelStruct &&
        date == other.date &&
        totals == other.totals &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([date, totals, data]);
}

TrackingEmployeeDateModelStruct createTrackingEmployeeDateModelStruct({
  String? date,
  int? totals,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TrackingEmployeeDateModelStruct(
      date: date,
      totals: totals,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TrackingEmployeeDateModelStruct? updateTrackingEmployeeDateModelStruct(
  TrackingEmployeeDateModelStruct? trackingEmployeeDateModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    trackingEmployeeDateModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTrackingEmployeeDateModelStructData(
  Map<String, dynamic> firestoreData,
  TrackingEmployeeDateModelStruct? trackingEmployeeDateModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (trackingEmployeeDateModel == null) {
    return;
  }
  if (trackingEmployeeDateModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      trackingEmployeeDateModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final trackingEmployeeDateModelData =
      getTrackingEmployeeDateModelFirestoreData(
          trackingEmployeeDateModel, forFieldValue);
  final nestedData =
      trackingEmployeeDateModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      trackingEmployeeDateModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTrackingEmployeeDateModelFirestoreData(
  TrackingEmployeeDateModelStruct? trackingEmployeeDateModel, [
  bool forFieldValue = false,
]) {
  if (trackingEmployeeDateModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(trackingEmployeeDateModel.toMap());

  // Add any Firestore field values
  trackingEmployeeDateModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTrackingEmployeeDateModelListFirestoreData(
  List<TrackingEmployeeDateModelStruct>? trackingEmployeeDateModels,
) =>
    trackingEmployeeDateModels
        ?.map((e) => getTrackingEmployeeDateModelFirestoreData(e, true))
        .toList() ??
    [];
