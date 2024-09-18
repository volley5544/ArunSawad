// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchDataTypeStruct extends FFFirebaseStruct {
  BranchDataTypeStruct({
    String? improundcarSubLocatId,
    String? improundcarLocatId,
    String? branchName,
    String? deleted,
    String? address,
    String? subDistrict,
    String? district,
    String? province,
    String? postcode,
    String? phoneNumber,
    String? latitude,
    String? longitude,
    String? branchCode,
    String? areaCode,
    String? areaName,
    String? regionCode,
    String? regionName,
    String? locatCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _improundcarSubLocatId = improundcarSubLocatId,
        _improundcarLocatId = improundcarLocatId,
        _branchName = branchName,
        _deleted = deleted,
        _address = address,
        _subDistrict = subDistrict,
        _district = district,
        _province = province,
        _postcode = postcode,
        _phoneNumber = phoneNumber,
        _latitude = latitude,
        _longitude = longitude,
        _branchCode = branchCode,
        _areaCode = areaCode,
        _areaName = areaName,
        _regionCode = regionCode,
        _regionName = regionName,
        _locatCode = locatCode,
        super(firestoreUtilData);

  // "improundcar_sub_locat_id" field.
  String? _improundcarSubLocatId;
  String get improundcarSubLocatId => _improundcarSubLocatId ?? '';
  set improundcarSubLocatId(String? val) => _improundcarSubLocatId = val;

  bool hasImproundcarSubLocatId() => _improundcarSubLocatId != null;

  // "improundcar_locat_id" field.
  String? _improundcarLocatId;
  String get improundcarLocatId => _improundcarLocatId ?? '';
  set improundcarLocatId(String? val) => _improundcarLocatId = val;

  bool hasImproundcarLocatId() => _improundcarLocatId != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "deleted" field.
  String? _deleted;
  String get deleted => _deleted ?? '';
  set deleted(String? val) => _deleted = val;

  bool hasDeleted() => _deleted != null;

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

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

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

  // "locat_code" field.
  String? _locatCode;
  String get locatCode => _locatCode ?? '';
  set locatCode(String? val) => _locatCode = val;

  bool hasLocatCode() => _locatCode != null;

  static BranchDataTypeStruct fromMap(Map<String, dynamic> data) =>
      BranchDataTypeStruct(
        improundcarSubLocatId: data['improundcar_sub_locat_id'] as String?,
        improundcarLocatId: data['improundcar_locat_id'] as String?,
        branchName: data['branch_name'] as String?,
        deleted: data['deleted'] as String?,
        address: data['address'] as String?,
        subDistrict: data['sub_district'] as String?,
        district: data['district'] as String?,
        province: data['province'] as String?,
        postcode: data['postcode'] as String?,
        phoneNumber: data['phone_number'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
        branchCode: data['branch_code'] as String?,
        areaCode: data['area_code'] as String?,
        areaName: data['area_name'] as String?,
        regionCode: data['region_code'] as String?,
        regionName: data['region_name'] as String?,
        locatCode: data['locat_code'] as String?,
      );

  static BranchDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? BranchDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'improundcar_sub_locat_id': _improundcarSubLocatId,
        'improundcar_locat_id': _improundcarLocatId,
        'branch_name': _branchName,
        'deleted': _deleted,
        'address': _address,
        'sub_district': _subDistrict,
        'district': _district,
        'province': _province,
        'postcode': _postcode,
        'phone_number': _phoneNumber,
        'latitude': _latitude,
        'longitude': _longitude,
        'branch_code': _branchCode,
        'area_code': _areaCode,
        'area_name': _areaName,
        'region_code': _regionCode,
        'region_name': _regionName,
        'locat_code': _locatCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'improundcar_sub_locat_id': serializeParam(
          _improundcarSubLocatId,
          ParamType.String,
        ),
        'improundcar_locat_id': serializeParam(
          _improundcarLocatId,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'deleted': serializeParam(
          _deleted,
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
        'branch_code': serializeParam(
          _branchCode,
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
        'locat_code': serializeParam(
          _locatCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static BranchDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BranchDataTypeStruct(
        improundcarSubLocatId: deserializeParam(
          data['improundcar_sub_locat_id'],
          ParamType.String,
          false,
        ),
        improundcarLocatId: deserializeParam(
          data['improundcar_locat_id'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        deleted: deserializeParam(
          data['deleted'],
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
        branchCode: deserializeParam(
          data['branch_code'],
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
        locatCode: deserializeParam(
          data['locat_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BranchDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BranchDataTypeStruct &&
        improundcarSubLocatId == other.improundcarSubLocatId &&
        improundcarLocatId == other.improundcarLocatId &&
        branchName == other.branchName &&
        deleted == other.deleted &&
        address == other.address &&
        subDistrict == other.subDistrict &&
        district == other.district &&
        province == other.province &&
        postcode == other.postcode &&
        phoneNumber == other.phoneNumber &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        branchCode == other.branchCode &&
        areaCode == other.areaCode &&
        areaName == other.areaName &&
        regionCode == other.regionCode &&
        regionName == other.regionName &&
        locatCode == other.locatCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        improundcarSubLocatId,
        improundcarLocatId,
        branchName,
        deleted,
        address,
        subDistrict,
        district,
        province,
        postcode,
        phoneNumber,
        latitude,
        longitude,
        branchCode,
        areaCode,
        areaName,
        regionCode,
        regionName,
        locatCode
      ]);
}

BranchDataTypeStruct createBranchDataTypeStruct({
  String? improundcarSubLocatId,
  String? improundcarLocatId,
  String? branchName,
  String? deleted,
  String? address,
  String? subDistrict,
  String? district,
  String? province,
  String? postcode,
  String? phoneNumber,
  String? latitude,
  String? longitude,
  String? branchCode,
  String? areaCode,
  String? areaName,
  String? regionCode,
  String? regionName,
  String? locatCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BranchDataTypeStruct(
      improundcarSubLocatId: improundcarSubLocatId,
      improundcarLocatId: improundcarLocatId,
      branchName: branchName,
      deleted: deleted,
      address: address,
      subDistrict: subDistrict,
      district: district,
      province: province,
      postcode: postcode,
      phoneNumber: phoneNumber,
      latitude: latitude,
      longitude: longitude,
      branchCode: branchCode,
      areaCode: areaCode,
      areaName: areaName,
      regionCode: regionCode,
      regionName: regionName,
      locatCode: locatCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BranchDataTypeStruct? updateBranchDataTypeStruct(
  BranchDataTypeStruct? branchDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    branchDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBranchDataTypeStructData(
  Map<String, dynamic> firestoreData,
  BranchDataTypeStruct? branchDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (branchDataType == null) {
    return;
  }
  if (branchDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && branchDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final branchDataTypeData =
      getBranchDataTypeFirestoreData(branchDataType, forFieldValue);
  final nestedData =
      branchDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = branchDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBranchDataTypeFirestoreData(
  BranchDataTypeStruct? branchDataType, [
  bool forFieldValue = false,
]) {
  if (branchDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(branchDataType.toMap());

  // Add any Firestore field values
  branchDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBranchDataTypeListFirestoreData(
  List<BranchDataTypeStruct>? branchDataTypes,
) =>
    branchDataTypes
        ?.map((e) => getBranchDataTypeFirestoreData(e, true))
        .toList() ??
    [];
