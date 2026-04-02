// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpoundCarAccessRoleStruct extends FFFirebaseStruct {
  ImpoundCarAccessRoleStruct({
    ImpoundCarAdminRoleStruct? step1,
    ImpoundCarAdminRoleStruct? step2,
    ImpoundCarAdminRoleStruct? step3,
    ImpoundCarAdminRoleStruct? step4,
    List<String>? role,
    List<String>? profileLevel,
    List<String>? crd,
    List<String>? auction,
    List<String>? admin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _step1 = step1,
        _step2 = step2,
        _step3 = step3,
        _step4 = step4,
        _role = role,
        _profileLevel = profileLevel,
        _crd = crd,
        _auction = auction,
        _admin = admin,
        super(firestoreUtilData);

  // "step1" field.
  ImpoundCarAdminRoleStruct? _step1;
  ImpoundCarAdminRoleStruct get step1 => _step1 ?? ImpoundCarAdminRoleStruct();
  set step1(ImpoundCarAdminRoleStruct? val) => _step1 = val;

  void updateStep1(Function(ImpoundCarAdminRoleStruct) updateFn) {
    updateFn(_step1 ??= ImpoundCarAdminRoleStruct());
  }

  bool hasStep1() => _step1 != null;

  // "step2" field.
  ImpoundCarAdminRoleStruct? _step2;
  ImpoundCarAdminRoleStruct get step2 => _step2 ?? ImpoundCarAdminRoleStruct();
  set step2(ImpoundCarAdminRoleStruct? val) => _step2 = val;

  void updateStep2(Function(ImpoundCarAdminRoleStruct) updateFn) {
    updateFn(_step2 ??= ImpoundCarAdminRoleStruct());
  }

  bool hasStep2() => _step2 != null;

  // "step3" field.
  ImpoundCarAdminRoleStruct? _step3;
  ImpoundCarAdminRoleStruct get step3 => _step3 ?? ImpoundCarAdminRoleStruct();
  set step3(ImpoundCarAdminRoleStruct? val) => _step3 = val;

  void updateStep3(Function(ImpoundCarAdminRoleStruct) updateFn) {
    updateFn(_step3 ??= ImpoundCarAdminRoleStruct());
  }

  bool hasStep3() => _step3 != null;

  // "step4" field.
  ImpoundCarAdminRoleStruct? _step4;
  ImpoundCarAdminRoleStruct get step4 => _step4 ?? ImpoundCarAdminRoleStruct();
  set step4(ImpoundCarAdminRoleStruct? val) => _step4 = val;

  void updateStep4(Function(ImpoundCarAdminRoleStruct) updateFn) {
    updateFn(_step4 ??= ImpoundCarAdminRoleStruct());
  }

  bool hasStep4() => _step4 != null;

  // "role" field.
  List<String>? _role;
  List<String> get role => _role ?? const [];
  set role(List<String>? val) => _role = val;

  void updateRole(Function(List<String>) updateFn) {
    updateFn(_role ??= []);
  }

  bool hasRole() => _role != null;

  // "profile_level" field.
  List<String>? _profileLevel;
  List<String> get profileLevel => _profileLevel ?? const [];
  set profileLevel(List<String>? val) => _profileLevel = val;

  void updateProfileLevel(Function(List<String>) updateFn) {
    updateFn(_profileLevel ??= []);
  }

  bool hasProfileLevel() => _profileLevel != null;

  // "CRD" field.
  List<String>? _crd;
  List<String> get crd => _crd ?? const [];
  set crd(List<String>? val) => _crd = val;

  void updateCrd(Function(List<String>) updateFn) {
    updateFn(_crd ??= []);
  }

  bool hasCrd() => _crd != null;

  // "Auction" field.
  List<String>? _auction;
  List<String> get auction => _auction ?? const [];
  set auction(List<String>? val) => _auction = val;

  void updateAuction(Function(List<String>) updateFn) {
    updateFn(_auction ??= []);
  }

  bool hasAuction() => _auction != null;

  // "Admin" field.
  List<String>? _admin;
  List<String> get admin => _admin ?? const [];
  set admin(List<String>? val) => _admin = val;

  void updateAdmin(Function(List<String>) updateFn) {
    updateFn(_admin ??= []);
  }

  bool hasAdmin() => _admin != null;

  static ImpoundCarAccessRoleStruct fromMap(Map<String, dynamic> data) =>
      ImpoundCarAccessRoleStruct(
        step1: data['step1'] is ImpoundCarAdminRoleStruct
            ? data['step1']
            : ImpoundCarAdminRoleStruct.maybeFromMap(data['step1']),
        step2: data['step2'] is ImpoundCarAdminRoleStruct
            ? data['step2']
            : ImpoundCarAdminRoleStruct.maybeFromMap(data['step2']),
        step3: data['step3'] is ImpoundCarAdminRoleStruct
            ? data['step3']
            : ImpoundCarAdminRoleStruct.maybeFromMap(data['step3']),
        step4: data['step4'] is ImpoundCarAdminRoleStruct
            ? data['step4']
            : ImpoundCarAdminRoleStruct.maybeFromMap(data['step4']),
        role: getDataList(data['role']),
        profileLevel: getDataList(data['profile_level']),
        crd: getDataList(data['CRD']),
        auction: getDataList(data['Auction']),
        admin: getDataList(data['Admin']),
      );

  static ImpoundCarAccessRoleStruct? maybeFromMap(dynamic data) => data is Map
      ? ImpoundCarAccessRoleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'step1': _step1?.toMap(),
        'step2': _step2?.toMap(),
        'step3': _step3?.toMap(),
        'step4': _step4?.toMap(),
        'role': _role,
        'profile_level': _profileLevel,
        'CRD': _crd,
        'Auction': _auction,
        'Admin': _admin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'step1': serializeParam(
          _step1,
          ParamType.DataStruct,
        ),
        'step2': serializeParam(
          _step2,
          ParamType.DataStruct,
        ),
        'step3': serializeParam(
          _step3,
          ParamType.DataStruct,
        ),
        'step4': serializeParam(
          _step4,
          ParamType.DataStruct,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
          isList: true,
        ),
        'profile_level': serializeParam(
          _profileLevel,
          ParamType.String,
          isList: true,
        ),
        'CRD': serializeParam(
          _crd,
          ParamType.String,
          isList: true,
        ),
        'Auction': serializeParam(
          _auction,
          ParamType.String,
          isList: true,
        ),
        'Admin': serializeParam(
          _admin,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ImpoundCarAccessRoleStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ImpoundCarAccessRoleStruct(
        step1: deserializeStructParam(
          data['step1'],
          ParamType.DataStruct,
          false,
          structBuilder: ImpoundCarAdminRoleStruct.fromSerializableMap,
        ),
        step2: deserializeStructParam(
          data['step2'],
          ParamType.DataStruct,
          false,
          structBuilder: ImpoundCarAdminRoleStruct.fromSerializableMap,
        ),
        step3: deserializeStructParam(
          data['step3'],
          ParamType.DataStruct,
          false,
          structBuilder: ImpoundCarAdminRoleStruct.fromSerializableMap,
        ),
        step4: deserializeStructParam(
          data['step4'],
          ParamType.DataStruct,
          false,
          structBuilder: ImpoundCarAdminRoleStruct.fromSerializableMap,
        ),
        role: deserializeParam<String>(
          data['role'],
          ParamType.String,
          true,
        ),
        profileLevel: deserializeParam<String>(
          data['profile_level'],
          ParamType.String,
          true,
        ),
        crd: deserializeParam<String>(
          data['CRD'],
          ParamType.String,
          true,
        ),
        auction: deserializeParam<String>(
          data['Auction'],
          ParamType.String,
          true,
        ),
        admin: deserializeParam<String>(
          data['Admin'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ImpoundCarAccessRoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImpoundCarAccessRoleStruct &&
        step1 == other.step1 &&
        step2 == other.step2 &&
        step3 == other.step3 &&
        step4 == other.step4 &&
        listEquality.equals(role, other.role) &&
        listEquality.equals(profileLevel, other.profileLevel) &&
        listEquality.equals(crd, other.crd) &&
        listEquality.equals(auction, other.auction) &&
        listEquality.equals(admin, other.admin);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [step1, step2, step3, step4, role, profileLevel, crd, auction, admin]);
}

ImpoundCarAccessRoleStruct createImpoundCarAccessRoleStruct({
  ImpoundCarAdminRoleStruct? step1,
  ImpoundCarAdminRoleStruct? step2,
  ImpoundCarAdminRoleStruct? step3,
  ImpoundCarAdminRoleStruct? step4,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImpoundCarAccessRoleStruct(
      step1: step1 ?? (clearUnsetFields ? ImpoundCarAdminRoleStruct() : null),
      step2: step2 ?? (clearUnsetFields ? ImpoundCarAdminRoleStruct() : null),
      step3: step3 ?? (clearUnsetFields ? ImpoundCarAdminRoleStruct() : null),
      step4: step4 ?? (clearUnsetFields ? ImpoundCarAdminRoleStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImpoundCarAccessRoleStruct? updateImpoundCarAccessRoleStruct(
  ImpoundCarAccessRoleStruct? impoundCarAccessRole, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    impoundCarAccessRole
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImpoundCarAccessRoleStructData(
  Map<String, dynamic> firestoreData,
  ImpoundCarAccessRoleStruct? impoundCarAccessRole,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (impoundCarAccessRole == null) {
    return;
  }
  if (impoundCarAccessRole.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && impoundCarAccessRole.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final impoundCarAccessRoleData =
      getImpoundCarAccessRoleFirestoreData(impoundCarAccessRole, forFieldValue);
  final nestedData =
      impoundCarAccessRoleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      impoundCarAccessRole.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImpoundCarAccessRoleFirestoreData(
  ImpoundCarAccessRoleStruct? impoundCarAccessRole, [
  bool forFieldValue = false,
]) {
  if (impoundCarAccessRole == null) {
    return {};
  }
  final firestoreData = mapToFirestore(impoundCarAccessRole.toMap());

  // Handle nested data for "step1" field.
  addImpoundCarAdminRoleStructData(
    firestoreData,
    impoundCarAccessRole.hasStep1() ? impoundCarAccessRole.step1 : null,
    'step1',
    forFieldValue,
  );

  // Handle nested data for "step2" field.
  addImpoundCarAdminRoleStructData(
    firestoreData,
    impoundCarAccessRole.hasStep2() ? impoundCarAccessRole.step2 : null,
    'step2',
    forFieldValue,
  );

  // Handle nested data for "step3" field.
  addImpoundCarAdminRoleStructData(
    firestoreData,
    impoundCarAccessRole.hasStep3() ? impoundCarAccessRole.step3 : null,
    'step3',
    forFieldValue,
  );

  // Handle nested data for "step4" field.
  addImpoundCarAdminRoleStructData(
    firestoreData,
    impoundCarAccessRole.hasStep4() ? impoundCarAccessRole.step4 : null,
    'step4',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(impoundCarAccessRole.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImpoundCarAccessRoleListFirestoreData(
  List<ImpoundCarAccessRoleStruct>? impoundCarAccessRoles,
) =>
    impoundCarAccessRoles
        ?.map((e) => getImpoundCarAccessRoleFirestoreData(e, true))
        .toList() ??
    [];
