import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileRecord extends FirestoreRecord {
  UserProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  bool hasFullname() => _fullname != null;

  // "birth_date" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  bool hasBirthDate() => _birthDate != null;

  // "unit_code_name" field.
  String? _unitCodeName;
  String get unitCodeName => _unitCodeName ?? '';
  bool hasUnitCodeName() => _unitCodeName != null;

  // "parent_unit" field.
  String? _parentUnit;
  String get parentUnit => _parentUnit ?? '';
  bool hasParentUnit() => _parentUnit != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "hired_date" field.
  String? _hiredDate;
  String get hiredDate => _hiredDate ?? '';
  bool hasHiredDate() => _hiredDate != null;

  // "service_duration_day" field.
  String? _serviceDurationDay;
  String get serviceDurationDay => _serviceDurationDay ?? '';
  bool hasServiceDurationDay() => _serviceDurationDay != null;

  // "service_duration_month" field.
  String? _serviceDurationMonth;
  String get serviceDurationMonth => _serviceDurationMonth ?? '';
  bool hasServiceDurationMonth() => _serviceDurationMonth != null;

  // "service_duration_year" field.
  String? _serviceDurationYear;
  String get serviceDurationYear => _serviceDurationYear ?? '';
  bool hasServiceDurationYear() => _serviceDurationYear != null;

  // "position_age_day" field.
  String? _positionAgeDay;
  String get positionAgeDay => _positionAgeDay ?? '';
  bool hasPositionAgeDay() => _positionAgeDay != null;

  // "position_age_month" field.
  String? _positionAgeMonth;
  String get positionAgeMonth => _positionAgeMonth ?? '';
  bool hasPositionAgeMonth() => _positionAgeMonth != null;

  // "position_age_year" field.
  String? _positionAgeYear;
  String get positionAgeYear => _positionAgeYear ?? '';
  bool hasPositionAgeYear() => _positionAgeYear != null;

  // "position_age_check" field.
  String? _positionAgeCheck;
  String get positionAgeCheck => _positionAgeCheck ?? '';
  bool hasPositionAgeCheck() => _positionAgeCheck != null;

  // "position_name" field.
  String? _positionName;
  String get positionName => _positionName ?? '';
  bool hasPositionName() => _positionName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "first_boss_emp_id" field.
  String? _firstBossEmpId;
  String get firstBossEmpId => _firstBossEmpId ?? '';
  bool hasFirstBossEmpId() => _firstBossEmpId != null;

  // "second_boss_emp_id" field.
  String? _secondBossEmpId;
  String get secondBossEmpId => _secondBossEmpId ?? '';
  bool hasSecondBossEmpId() => _secondBossEmpId != null;

  // "insurance_plan_number" field.
  String? _insurancePlanNumber;
  String get insurancePlanNumber => _insurancePlanNumber ?? '';
  bool hasInsurancePlanNumber() => _insurancePlanNumber != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  bool hasBranchName() => _branchName != null;

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  bool hasBranchCode() => _branchCode != null;

  // "employee_id" field.
  String? _employeeId;
  String get employeeId => _employeeId ?? '';
  bool hasEmployeeId() => _employeeId != null;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  bool hasAccessToken() => _accessToken != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  bool hasNickname() => _nickname != null;

  // "insurance_license_status_code" field.
  List<int>? _insuranceLicenseStatusCode;
  List<int> get insuranceLicenseStatusCode =>
      _insuranceLicenseStatusCode ?? const [];
  bool hasInsuranceLicenseStatusCode() => _insuranceLicenseStatusCode != null;

  // "insurance_license_id_card" field.
  List<String>? _insuranceLicenseIdCard;
  List<String> get insuranceLicenseIdCard =>
      _insuranceLicenseIdCard ?? const [];
  bool hasInsuranceLicenseIdCard() => _insuranceLicenseIdCard != null;

  // "insurance_license_license_number" field.
  List<String>? _insuranceLicenseLicenseNumber;
  List<String> get insuranceLicenseLicenseNumber =>
      _insuranceLicenseLicenseNumber ?? const [];
  bool hasInsuranceLicenseLicenseNumber() =>
      _insuranceLicenseLicenseNumber != null;

  // "insurance_license_start_date" field.
  List<String>? _insuranceLicenseStartDate;
  List<String> get insuranceLicenseStartDate =>
      _insuranceLicenseStartDate ?? const [];
  bool hasInsuranceLicenseStartDate() => _insuranceLicenseStartDate != null;

  // "insurance_license_expire_date" field.
  List<String>? _insuranceLicenseExpireDate;
  List<String> get insuranceLicenseExpireDate =>
      _insuranceLicenseExpireDate ?? const [];
  bool hasInsuranceLicenseExpireDate() => _insuranceLicenseExpireDate != null;

  // "insurance_license_fullname" field.
  List<String>? _insuranceLicenseFullname;
  List<String> get insuranceLicenseFullname =>
      _insuranceLicenseFullname ?? const [];
  bool hasInsuranceLicenseFullname() => _insuranceLicenseFullname != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fullname = snapshotData['fullname'] as String?;
    _birthDate = snapshotData['birth_date'] as String?;
    _unitCodeName = snapshotData['unit_code_name'] as String?;
    _parentUnit = snapshotData['parent_unit'] as String?;
    _region = snapshotData['region'] as String?;
    _hiredDate = snapshotData['hired_date'] as String?;
    _serviceDurationDay = snapshotData['service_duration_day'] as String?;
    _serviceDurationMonth = snapshotData['service_duration_month'] as String?;
    _serviceDurationYear = snapshotData['service_duration_year'] as String?;
    _positionAgeDay = snapshotData['position_age_day'] as String?;
    _positionAgeMonth = snapshotData['position_age_month'] as String?;
    _positionAgeYear = snapshotData['position_age_year'] as String?;
    _positionAgeCheck = snapshotData['position_age_check'] as String?;
    _positionName = snapshotData['position_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstBossEmpId = snapshotData['first_boss_emp_id'] as String?;
    _secondBossEmpId = snapshotData['second_boss_emp_id'] as String?;
    _insurancePlanNumber = snapshotData['insurance_plan_number'] as String?;
    _level = snapshotData['level'] as String?;
    _branchName = snapshotData['branch_name'] as String?;
    _branchCode = snapshotData['branch_code'] as String?;
    _employeeId = snapshotData['employee_id'] as String?;
    _accessToken = snapshotData['access_token'] as String?;
    _nickname = snapshotData['nickname'] as String?;
    _insuranceLicenseStatusCode =
        getDataList(snapshotData['insurance_license_status_code']);
    _insuranceLicenseIdCard =
        getDataList(snapshotData['insurance_license_id_card']);
    _insuranceLicenseLicenseNumber =
        getDataList(snapshotData['insurance_license_license_number']);
    _insuranceLicenseStartDate =
        getDataList(snapshotData['insurance_license_start_date']);
    _insuranceLicenseExpireDate =
        getDataList(snapshotData['insurance_license_expire_date']);
    _insuranceLicenseFullname =
        getDataList(snapshotData['insurance_license_fullname']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_profile')
          : FirebaseFirestore.instance.collectionGroup('user_profile');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_profile').doc(id);

  static Stream<UserProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProfileRecord.fromSnapshot(s));

  static Future<UserProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProfileRecord.fromSnapshot(s));

  static UserProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProfileRecordData({
  String? fullname,
  String? birthDate,
  String? unitCodeName,
  String? parentUnit,
  String? region,
  String? hiredDate,
  String? serviceDurationDay,
  String? serviceDurationMonth,
  String? serviceDurationYear,
  String? positionAgeDay,
  String? positionAgeMonth,
  String? positionAgeYear,
  String? positionAgeCheck,
  String? positionName,
  String? phoneNumber,
  String? firstBossEmpId,
  String? secondBossEmpId,
  String? insurancePlanNumber,
  String? level,
  String? branchName,
  String? branchCode,
  String? employeeId,
  String? accessToken,
  String? nickname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fullname': fullname,
      'birth_date': birthDate,
      'unit_code_name': unitCodeName,
      'parent_unit': parentUnit,
      'region': region,
      'hired_date': hiredDate,
      'service_duration_day': serviceDurationDay,
      'service_duration_month': serviceDurationMonth,
      'service_duration_year': serviceDurationYear,
      'position_age_day': positionAgeDay,
      'position_age_month': positionAgeMonth,
      'position_age_year': positionAgeYear,
      'position_age_check': positionAgeCheck,
      'position_name': positionName,
      'phone_number': phoneNumber,
      'first_boss_emp_id': firstBossEmpId,
      'second_boss_emp_id': secondBossEmpId,
      'insurance_plan_number': insurancePlanNumber,
      'level': level,
      'branch_name': branchName,
      'branch_code': branchCode,
      'employee_id': employeeId,
      'access_token': accessToken,
      'nickname': nickname,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserProfileRecordDocumentEquality implements Equality<UserProfileRecord> {
  const UserProfileRecordDocumentEquality();

  @override
  bool equals(UserProfileRecord? e1, UserProfileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fullname == e2?.fullname &&
        e1?.birthDate == e2?.birthDate &&
        e1?.unitCodeName == e2?.unitCodeName &&
        e1?.parentUnit == e2?.parentUnit &&
        e1?.region == e2?.region &&
        e1?.hiredDate == e2?.hiredDate &&
        e1?.serviceDurationDay == e2?.serviceDurationDay &&
        e1?.serviceDurationMonth == e2?.serviceDurationMonth &&
        e1?.serviceDurationYear == e2?.serviceDurationYear &&
        e1?.positionAgeDay == e2?.positionAgeDay &&
        e1?.positionAgeMonth == e2?.positionAgeMonth &&
        e1?.positionAgeYear == e2?.positionAgeYear &&
        e1?.positionAgeCheck == e2?.positionAgeCheck &&
        e1?.positionName == e2?.positionName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstBossEmpId == e2?.firstBossEmpId &&
        e1?.secondBossEmpId == e2?.secondBossEmpId &&
        e1?.insurancePlanNumber == e2?.insurancePlanNumber &&
        e1?.level == e2?.level &&
        e1?.branchName == e2?.branchName &&
        e1?.branchCode == e2?.branchCode &&
        e1?.employeeId == e2?.employeeId &&
        e1?.accessToken == e2?.accessToken &&
        e1?.nickname == e2?.nickname &&
        listEquality.equals(
            e1?.insuranceLicenseStatusCode, e2?.insuranceLicenseStatusCode) &&
        listEquality.equals(
            e1?.insuranceLicenseIdCard, e2?.insuranceLicenseIdCard) &&
        listEquality.equals(e1?.insuranceLicenseLicenseNumber,
            e2?.insuranceLicenseLicenseNumber) &&
        listEquality.equals(
            e1?.insuranceLicenseStartDate, e2?.insuranceLicenseStartDate) &&
        listEquality.equals(
            e1?.insuranceLicenseExpireDate, e2?.insuranceLicenseExpireDate) &&
        listEquality.equals(
            e1?.insuranceLicenseFullname, e2?.insuranceLicenseFullname);
  }

  @override
  int hash(UserProfileRecord? e) => const ListEquality().hash([
        e?.fullname,
        e?.birthDate,
        e?.unitCodeName,
        e?.parentUnit,
        e?.region,
        e?.hiredDate,
        e?.serviceDurationDay,
        e?.serviceDurationMonth,
        e?.serviceDurationYear,
        e?.positionAgeDay,
        e?.positionAgeMonth,
        e?.positionAgeYear,
        e?.positionAgeCheck,
        e?.positionName,
        e?.phoneNumber,
        e?.firstBossEmpId,
        e?.secondBossEmpId,
        e?.insurancePlanNumber,
        e?.level,
        e?.branchName,
        e?.branchCode,
        e?.employeeId,
        e?.accessToken,
        e?.nickname,
        e?.insuranceLicenseStatusCode,
        e?.insuranceLicenseIdCard,
        e?.insuranceLicenseLicenseNumber,
        e?.insuranceLicenseStartDate,
        e?.insuranceLicenseExpireDate,
        e?.insuranceLicenseFullname
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProfileRecord;
}
