// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpoundCarLocateParamSetStruct extends FFFirebaseStruct {
  ImpoundCarLocateParamSetStruct({
    String? improundcarLocatId,
    String? locatName,
    String? improundcarSubLocatId,
    String? branchNameLocat,
    String? address,
    String? subDistrict,
    String? district,
    String? province,
    String? postcode,
    String? phoneNumber,
    String? latitude,
    String? longitude,
    String? branchCodeLocat,
    String? areaCode,
    String? areaName,
    String? regionCode,
    String? regionName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _improundcarLocatId = improundcarLocatId,
        _locatName = locatName,
        _improundcarSubLocatId = improundcarSubLocatId,
        _branchNameLocat = branchNameLocat,
        _address = address,
        _subDistrict = subDistrict,
        _district = district,
        _province = province,
        _postcode = postcode,
        _phoneNumber = phoneNumber,
        _latitude = latitude,
        _longitude = longitude,
        _branchCodeLocat = branchCodeLocat,
        _areaCode = areaCode,
        _areaName = areaName,
        _regionCode = regionCode,
        _regionName = regionName,
        super(firestoreUtilData);

  // "improundcar_locat_id" field.
  String? _improundcarLocatId;
  String get improundcarLocatId => _improundcarLocatId ?? '';
  set improundcarLocatId(String? val) => _improundcarLocatId = val;

  bool hasImproundcarLocatId() => _improundcarLocatId != null;

  // "locat_name" field.
  String? _locatName;
  String get locatName => _locatName ?? '';
  set locatName(String? val) => _locatName = val;

  bool hasLocatName() => _locatName != null;

  // "improundcar_sub_locat_id" field.
  String? _improundcarSubLocatId;
  String get improundcarSubLocatId => _improundcarSubLocatId ?? '';
  set improundcarSubLocatId(String? val) => _improundcarSubLocatId = val;

  bool hasImproundcarSubLocatId() => _improundcarSubLocatId != null;

  // "branch_name_locat" field.
  String? _branchNameLocat;
  String get branchNameLocat => _branchNameLocat ?? '';
  set branchNameLocat(String? val) => _branchNameLocat = val;

  bool hasBranchNameLocat() => _branchNameLocat != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "sub_district" field.
  String? _subDistrict;
  String get subDistrict => _subDistrict ?? '';
  set subDistrict(String? val) => _subDistrict = val;

  bool hasSubDistrict() => _subDistrict != null;

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  set district(String? val) => _district = val;

  bool hasDistrict() => _district != null;

  // "province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  set postcode(String? val) => _postcode = val;

  bool hasPostcode() => _postcode != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "latitude" field.
  String? _latitude;
  String get latitude => _latitude ?? '';
  set latitude(String? val) => _latitude = val;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  String? _longitude;
  String get longitude => _longitude ?? '';
  set longitude(String? val) => _longitude = val;

  bool hasLongitude() => _longitude != null;

  // "branch_code_locat" field.
  String? _branchCodeLocat;
  String get branchCodeLocat => _branchCodeLocat ?? '';
  set branchCodeLocat(String? val) => _branchCodeLocat = val;

  bool hasBranchCodeLocat() => _branchCodeLocat != null;

  // "area_code" field.
  String? _areaCode;
  String get areaCode => _areaCode ?? '';
  set areaCode(String? val) => _areaCode = val;

  bool hasAreaCode() => _areaCode != null;

  // "area_name" field.
  String? _areaName;
  String get areaName => _areaName ?? '';
  set areaName(String? val) => _areaName = val;

  bool hasAreaName() => _areaName != null;

  // "region_code" field.
  String? _regionCode;
  String get regionCode => _regionCode ?? '';
  set regionCode(String? val) => _regionCode = val;

  bool hasRegionCode() => _regionCode != null;

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  set regionName(String? val) => _regionName = val;

  bool hasRegionName() => _regionName != null;

  static ImpoundCarLocateParamSetStruct fromMap(Map<String, dynamic> data) =>
      ImpoundCarLocateParamSetStruct(
        improundcarLocatId: data['improundcar_locat_id'] as String?,
        locatName: data['locat_name'] as String?,
        improundcarSubLocatId: data['improundcar_sub_locat_id'] as String?,
        branchNameLocat: data['branch_name_locat'] as String?,
        address: data['address'] as String?,
        subDistrict: data['sub_district'] as String?,
        district: data['district'] as String?,
        province: data['province'] as String?,
        postcode: data['postcode'] as String?,
        phoneNumber: data['phone_number'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        branchCodeLocat: data['branch_code_locat'] as String?,
        areaCode: data['area_code'] as String?,
        areaName: data['area_name'] as String?,
        regionCode: data['region_code'] as String?,
        regionName: data['region_name'] as String?,
      );

  static ImpoundCarLocateParamSetStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ImpoundCarLocateParamSetStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'improundcar_locat_id': _improundcarLocatId,
        'locat_name': _locatName,
        'improundcar_sub_locat_id': _improundcarSubLocatId,
        'branch_name_locat': _branchNameLocat,
        'address': _address,
        'sub_district': _subDistrict,
        'district': _district,
        'province': _province,
        'postcode': _postcode,
        'phone_number': _phoneNumber,
        'latitude': _latitude,
        'longitude': _longitude,
        'branch_code_locat': _branchCodeLocat,
        'area_code': _areaCode,
        'area_name': _areaName,
        'region_code': _regionCode,
        'region_name': _regionName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'improundcar_locat_id': serializeParam(
          _improundcarLocatId,
          ParamType.String,
        ),
        'locat_name': serializeParam(
          _locatName,
          ParamType.String,
        ),
        'improundcar_sub_locat_id': serializeParam(
          _improundcarSubLocatId,
          ParamType.String,
        ),
        'branch_name_locat': serializeParam(
          _branchNameLocat,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'sub_district': serializeParam(
          _subDistrict,
          ParamType.String,
        ),
        'district': serializeParam(
          _district,
          ParamType.String,
        ),
        'province': serializeParam(
          _province,
          ParamType.String,
        ),
        'postcode': serializeParam(
          _postcode,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.String,
        ),
        'branch_code_locat': serializeParam(
          _branchCodeLocat,
          ParamType.String,
        ),
        'area_code': serializeParam(
          _areaCode,
          ParamType.String,
        ),
        'area_name': serializeParam(
          _areaName,
          ParamType.String,
        ),
        'region_code': serializeParam(
          _regionCode,
          ParamType.String,
        ),
        'region_name': serializeParam(
          _regionName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImpoundCarLocateParamSetStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ImpoundCarLocateParamSetStruct(
        improundcarLocatId: deserializeParam(
          data['improundcar_locat_id'],
          ParamType.String,
          false,
        ),
        locatName: deserializeParam(
          data['locat_name'],
          ParamType.String,
          false,
        ),
        improundcarSubLocatId: deserializeParam(
          data['improundcar_sub_locat_id'],
          ParamType.String,
          false,
        ),
        branchNameLocat: deserializeParam(
          data['branch_name_locat'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        subDistrict: deserializeParam(
          data['sub_district'],
          ParamType.String,
          false,
        ),
        district: deserializeParam(
          data['district'],
          ParamType.String,
          false,
        ),
        province: deserializeParam(
          data['province'],
          ParamType.String,
          false,
        ),
        postcode: deserializeParam(
          data['postcode'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.String,
          false,
        ),
        branchCodeLocat: deserializeParam(
          data['branch_code_locat'],
          ParamType.String,
          false,
        ),
        areaCode: deserializeParam(
          data['area_code'],
          ParamType.String,
          false,
        ),
        areaName: deserializeParam(
          data['area_name'],
          ParamType.String,
          false,
        ),
        regionCode: deserializeParam(
          data['region_code'],
          ParamType.String,
          false,
        ),
        regionName: deserializeParam(
          data['region_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImpoundCarLocateParamSetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImpoundCarLocateParamSetStruct &&
        improundcarLocatId == other.improundcarLocatId &&
        locatName == other.locatName &&
        improundcarSubLocatId == other.improundcarSubLocatId &&
        branchNameLocat == other.branchNameLocat &&
        address == other.address &&
        subDistrict == other.subDistrict &&
        district == other.district &&
        province == other.province &&
        postcode == other.postcode &&
        phoneNumber == other.phoneNumber &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        branchCodeLocat == other.branchCodeLocat &&
        areaCode == other.areaCode &&
        areaName == other.areaName &&
        regionCode == other.regionCode &&
        regionName == other.regionName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        improundcarLocatId,
        locatName,
        improundcarSubLocatId,
        branchNameLocat,
        address,
        subDistrict,
        district,
        province,
        postcode,
        phoneNumber,
        latitude,
        longitude,
        branchCodeLocat,
        areaCode,
        areaName,
        regionCode,
        regionName
      ]);
}

ImpoundCarLocateParamSetStruct createImpoundCarLocateParamSetStruct({
  String? improundcarLocatId,
  String? locatName,
  String? improundcarSubLocatId,
  String? branchNameLocat,
  String? address,
  String? subDistrict,
  String? district,
  String? province,
  String? postcode,
  String? phoneNumber,
  String? latitude,
  String? longitude,
  String? branchCodeLocat,
  String? areaCode,
  String? areaName,
  String? regionCode,
  String? regionName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImpoundCarLocateParamSetStruct(
      improundcarLocatId: improundcarLocatId,
      locatName: locatName,
      improundcarSubLocatId: improundcarSubLocatId,
      branchNameLocat: branchNameLocat,
      address: address,
      subDistrict: subDistrict,
      district: district,
      province: province,
      postcode: postcode,
      phoneNumber: phoneNumber,
      latitude: latitude,
      longitude: longitude,
      branchCodeLocat: branchCodeLocat,
      areaCode: areaCode,
      areaName: areaName,
      regionCode: regionCode,
      regionName: regionName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImpoundCarLocateParamSetStruct? updateImpoundCarLocateParamSetStruct(
  ImpoundCarLocateParamSetStruct? impoundCarLocateParamSet, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    impoundCarLocateParamSet
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImpoundCarLocateParamSetStructData(
  Map<String, dynamic> firestoreData,
  ImpoundCarLocateParamSetStruct? impoundCarLocateParamSet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (impoundCarLocateParamSet == null) {
    return;
  }
  if (impoundCarLocateParamSet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      impoundCarLocateParamSet.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final impoundCarLocateParamSetData = getImpoundCarLocateParamSetFirestoreData(
      impoundCarLocateParamSet, forFieldValue);
  final nestedData =
      impoundCarLocateParamSetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      impoundCarLocateParamSet.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImpoundCarLocateParamSetFirestoreData(
  ImpoundCarLocateParamSetStruct? impoundCarLocateParamSet, [
  bool forFieldValue = false,
]) {
  if (impoundCarLocateParamSet == null) {
    return {};
  }
  final firestoreData = mapToFirestore(impoundCarLocateParamSet.toMap());

  // Add any Firestore field values
  impoundCarLocateParamSet.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImpoundCarLocateParamSetListFirestoreData(
  List<ImpoundCarLocateParamSetStruct>? impoundCarLocateParamSets,
) =>
    impoundCarLocateParamSets
        ?.map((e) => getImpoundCarLocateParamSetFirestoreData(e, true))
        .toList() ??
    [];
