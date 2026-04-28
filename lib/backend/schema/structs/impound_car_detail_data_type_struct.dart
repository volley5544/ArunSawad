// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpoundCarDetailDataTypeStruct extends FFFirebaseStruct {
  ImpoundCarDetailDataTypeStruct({
    String? improundcarHistoryId,
    String? improundcarId,
    String? contNo,
    String? improundcarLocatId,
    String? locatCode,
    String? locatName,
    String? improundcarSubLocatId,
    String? branchName,
    String? branchCodeEmp,
    String? branchNameEmp,
    String? nameTh,
    String? improundcarStatusId,
    String? statusCode,
    String? statusName,
    String? createdUserid,
    String? createdAt,
    String? updatedUserid,
    String? updatedAt,
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
    String? regionName,
    String? price,
    String? stage,
    String? remarkPrice,
    String? remarkCode,
    String? remarkDesc,
    String? titleCust,
    String? firstnameCust,
    String? lastnameCust,
    String? typeContract,
    String? productCode,
    String? productName,
    String? numBody,
    String? registrationCar,
    String? registrationProve,
    String? contnoTypeName,
    String? locat,
    String? cuscod,
    String? originYear,
    String? convertYear,
    String? arnow,
    String? constat,
    String? typecod,
    String? modelcod,
    String? colorcod,
    String? keyincshprc,
    String? engno,
    String? impoundEmp,
    String? impoundNameth,
    String? impoundDate,
    String? returnToBranch,
    String? sentToConstat,
    String? remark,
    String? ownerId,
    String? impoundPrice,
    String? setpricePrice,
    String? auctionPrice,
    String? impoundRemarkPrice,
    String? setpriceRemarkPrice,
    String? auctionRemarkPrice,
    String? impoundOrdinalNo,
    String? setpriceOrdinalNo,
    String? auctionOrdinalNo,
    String? dbCode,
    String? db,
    String? delivercarRemarkPrice,
    String? locatDelivercar,
    String? locatNameDelivercar,
    String? logisticsComany,
    String? receiver,
    String? stepPrice,
    List<String>? images,
    String? regionCode,
    String? ldate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _improundcarHistoryId = improundcarHistoryId,
        _improundcarId = improundcarId,
        _contNo = contNo,
        _improundcarLocatId = improundcarLocatId,
        _locatCode = locatCode,
        _locatName = locatName,
        _improundcarSubLocatId = improundcarSubLocatId,
        _branchName = branchName,
        _branchCodeEmp = branchCodeEmp,
        _branchNameEmp = branchNameEmp,
        _nameTh = nameTh,
        _improundcarStatusId = improundcarStatusId,
        _statusCode = statusCode,
        _statusName = statusName,
        _createdUserid = createdUserid,
        _createdAt = createdAt,
        _updatedUserid = updatedUserid,
        _updatedAt = updatedAt,
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
        _regionName = regionName,
        _price = price,
        _stage = stage,
        _remarkPrice = remarkPrice,
        _remarkCode = remarkCode,
        _remarkDesc = remarkDesc,
        _titleCust = titleCust,
        _firstnameCust = firstnameCust,
        _lastnameCust = lastnameCust,
        _typeContract = typeContract,
        _productCode = productCode,
        _productName = productName,
        _numBody = numBody,
        _registrationCar = registrationCar,
        _registrationProve = registrationProve,
        _contnoTypeName = contnoTypeName,
        _locat = locat,
        _cuscod = cuscod,
        _originYear = originYear,
        _convertYear = convertYear,
        _arnow = arnow,
        _constat = constat,
        _typecod = typecod,
        _modelcod = modelcod,
        _colorcod = colorcod,
        _keyincshprc = keyincshprc,
        _engno = engno,
        _impoundEmp = impoundEmp,
        _impoundNameth = impoundNameth,
        _impoundDate = impoundDate,
        _returnToBranch = returnToBranch,
        _sentToConstat = sentToConstat,
        _remark = remark,
        _ownerId = ownerId,
        _impoundPrice = impoundPrice,
        _setpricePrice = setpricePrice,
        _auctionPrice = auctionPrice,
        _impoundRemarkPrice = impoundRemarkPrice,
        _setpriceRemarkPrice = setpriceRemarkPrice,
        _auctionRemarkPrice = auctionRemarkPrice,
        _impoundOrdinalNo = impoundOrdinalNo,
        _setpriceOrdinalNo = setpriceOrdinalNo,
        _auctionOrdinalNo = auctionOrdinalNo,
        _dbCode = dbCode,
        _db = db,
        _delivercarRemarkPrice = delivercarRemarkPrice,
        _locatDelivercar = locatDelivercar,
        _locatNameDelivercar = locatNameDelivercar,
        _logisticsComany = logisticsComany,
        _receiver = receiver,
        _stepPrice = stepPrice,
        _images = images,
        _regionCode = regionCode,
        _ldate = ldate,
        super(firestoreUtilData);

  // "improundcar_history_id" field.
  String? _improundcarHistoryId;
  String get improundcarHistoryId => _improundcarHistoryId ?? '';
  set improundcarHistoryId(String? val) => _improundcarHistoryId = val;

  bool hasImproundcarHistoryId() => _improundcarHistoryId != null;

  // "improundcar_id" field.
  String? _improundcarId;
  String get improundcarId => _improundcarId ?? '';
  set improundcarId(String? val) => _improundcarId = val;

  bool hasImproundcarId() => _improundcarId != null;

  // "cont_no" field.
  String? _contNo;
  String get contNo => _contNo ?? '';
  set contNo(String? val) => _contNo = val;

  bool hasContNo() => _contNo != null;

  // "improundcar_locat_id" field.
  String? _improundcarLocatId;
  String get improundcarLocatId => _improundcarLocatId ?? '';
  set improundcarLocatId(String? val) => _improundcarLocatId = val;

  bool hasImproundcarLocatId() => _improundcarLocatId != null;

  // "locat_code" field.
  String? _locatCode;
  String get locatCode => _locatCode ?? '';
  set locatCode(String? val) => _locatCode = val;

  bool hasLocatCode() => _locatCode != null;

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

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "branch_code_emp" field.
  String? _branchCodeEmp;
  String get branchCodeEmp => _branchCodeEmp ?? '';
  set branchCodeEmp(String? val) => _branchCodeEmp = val;

  bool hasBranchCodeEmp() => _branchCodeEmp != null;

  // "branch_name_emp" field.
  String? _branchNameEmp;
  String get branchNameEmp => _branchNameEmp ?? '';
  set branchNameEmp(String? val) => _branchNameEmp = val;

  bool hasBranchNameEmp() => _branchNameEmp != null;

  // "name_th" field.
  String? _nameTh;
  String get nameTh => _nameTh ?? '';
  set nameTh(String? val) => _nameTh = val;

  bool hasNameTh() => _nameTh != null;

  // "improundcar_status_id" field.
  String? _improundcarStatusId;
  String get improundcarStatusId => _improundcarStatusId ?? '';
  set improundcarStatusId(String? val) => _improundcarStatusId = val;

  bool hasImproundcarStatusId() => _improundcarStatusId != null;

  // "status_code" field.
  String? _statusCode;
  String get statusCode => _statusCode ?? '';
  set statusCode(String? val) => _statusCode = val;

  bool hasStatusCode() => _statusCode != null;

  // "status_name" field.
  String? _statusName;
  String get statusName => _statusName ?? '';
  set statusName(String? val) => _statusName = val;

  bool hasStatusName() => _statusName != null;

  // "created_userid" field.
  String? _createdUserid;
  String get createdUserid => _createdUserid ?? '';
  set createdUserid(String? val) => _createdUserid = val;

  bool hasCreatedUserid() => _createdUserid != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_userid" field.
  String? _updatedUserid;
  String get updatedUserid => _updatedUserid ?? '';
  set updatedUserid(String? val) => _updatedUserid = val;

  bool hasUpdatedUserid() => _updatedUserid != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

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

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  set regionName(String? val) => _regionName = val;

  bool hasRegionName() => _regionName != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  set stage(String? val) => _stage = val;

  bool hasStage() => _stage != null;

  // "remark_price" field.
  String? _remarkPrice;
  String get remarkPrice => _remarkPrice ?? '';
  set remarkPrice(String? val) => _remarkPrice = val;

  bool hasRemarkPrice() => _remarkPrice != null;

  // "remark_code" field.
  String? _remarkCode;
  String get remarkCode => _remarkCode ?? '';
  set remarkCode(String? val) => _remarkCode = val;

  bool hasRemarkCode() => _remarkCode != null;

  // "remark_desc" field.
  String? _remarkDesc;
  String get remarkDesc => _remarkDesc ?? '';
  set remarkDesc(String? val) => _remarkDesc = val;

  bool hasRemarkDesc() => _remarkDesc != null;

  // "title_cust" field.
  String? _titleCust;
  String get titleCust => _titleCust ?? '';
  set titleCust(String? val) => _titleCust = val;

  bool hasTitleCust() => _titleCust != null;

  // "firstname_cust" field.
  String? _firstnameCust;
  String get firstnameCust => _firstnameCust ?? '';
  set firstnameCust(String? val) => _firstnameCust = val;

  bool hasFirstnameCust() => _firstnameCust != null;

  // "lastname_cust" field.
  String? _lastnameCust;
  String get lastnameCust => _lastnameCust ?? '';
  set lastnameCust(String? val) => _lastnameCust = val;

  bool hasLastnameCust() => _lastnameCust != null;

  // "type_contract" field.
  String? _typeContract;
  String get typeContract => _typeContract ?? '';
  set typeContract(String? val) => _typeContract = val;

  bool hasTypeContract() => _typeContract != null;

  // "product_code" field.
  String? _productCode;
  String get productCode => _productCode ?? '';
  set productCode(String? val) => _productCode = val;

  bool hasProductCode() => _productCode != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "num_body" field.
  String? _numBody;
  String get numBody => _numBody ?? '';
  set numBody(String? val) => _numBody = val;

  bool hasNumBody() => _numBody != null;

  // "registration_car" field.
  String? _registrationCar;
  String get registrationCar => _registrationCar ?? '';
  set registrationCar(String? val) => _registrationCar = val;

  bool hasRegistrationCar() => _registrationCar != null;

  // "registration_prove" field.
  String? _registrationProve;
  String get registrationProve => _registrationProve ?? '';
  set registrationProve(String? val) => _registrationProve = val;

  bool hasRegistrationProve() => _registrationProve != null;

  // "contno_type_name" field.
  String? _contnoTypeName;
  String get contnoTypeName => _contnoTypeName ?? '';
  set contnoTypeName(String? val) => _contnoTypeName = val;

  bool hasContnoTypeName() => _contnoTypeName != null;

  // "locat" field.
  String? _locat;
  String get locat => _locat ?? '';
  set locat(String? val) => _locat = val;

  bool hasLocat() => _locat != null;

  // "cuscod" field.
  String? _cuscod;
  String get cuscod => _cuscod ?? '';
  set cuscod(String? val) => _cuscod = val;

  bool hasCuscod() => _cuscod != null;

  // "origin_year" field.
  String? _originYear;
  String get originYear => _originYear ?? '';
  set originYear(String? val) => _originYear = val;

  bool hasOriginYear() => _originYear != null;

  // "convert_year" field.
  String? _convertYear;
  String get convertYear => _convertYear ?? '';
  set convertYear(String? val) => _convertYear = val;

  bool hasConvertYear() => _convertYear != null;

  // "arnow" field.
  String? _arnow;
  String get arnow => _arnow ?? '';
  set arnow(String? val) => _arnow = val;

  bool hasArnow() => _arnow != null;

  // "constat" field.
  String? _constat;
  String get constat => _constat ?? '';
  set constat(String? val) => _constat = val;

  bool hasConstat() => _constat != null;

  // "typecod" field.
  String? _typecod;
  String get typecod => _typecod ?? '';
  set typecod(String? val) => _typecod = val;

  bool hasTypecod() => _typecod != null;

  // "modelcod" field.
  String? _modelcod;
  String get modelcod => _modelcod ?? '';
  set modelcod(String? val) => _modelcod = val;

  bool hasModelcod() => _modelcod != null;

  // "colorcod" field.
  String? _colorcod;
  String get colorcod => _colorcod ?? '';
  set colorcod(String? val) => _colorcod = val;

  bool hasColorcod() => _colorcod != null;

  // "keyincshprc" field.
  String? _keyincshprc;
  String get keyincshprc => _keyincshprc ?? '';
  set keyincshprc(String? val) => _keyincshprc = val;

  bool hasKeyincshprc() => _keyincshprc != null;

  // "engno" field.
  String? _engno;
  String get engno => _engno ?? '';
  set engno(String? val) => _engno = val;

  bool hasEngno() => _engno != null;

  // "impound_emp" field.
  String? _impoundEmp;
  String get impoundEmp => _impoundEmp ?? '';
  set impoundEmp(String? val) => _impoundEmp = val;

  bool hasImpoundEmp() => _impoundEmp != null;

  // "impound_nameth" field.
  String? _impoundNameth;
  String get impoundNameth => _impoundNameth ?? '';
  set impoundNameth(String? val) => _impoundNameth = val;

  bool hasImpoundNameth() => _impoundNameth != null;

  // "impound_date" field.
  String? _impoundDate;
  String get impoundDate => _impoundDate ?? '';
  set impoundDate(String? val) => _impoundDate = val;

  bool hasImpoundDate() => _impoundDate != null;

  // "return_to_branch" field.
  String? _returnToBranch;
  String get returnToBranch => _returnToBranch ?? '';
  set returnToBranch(String? val) => _returnToBranch = val;

  bool hasReturnToBranch() => _returnToBranch != null;

  // "sent_to_constat" field.
  String? _sentToConstat;
  String get sentToConstat => _sentToConstat ?? '';
  set sentToConstat(String? val) => _sentToConstat = val;

  bool hasSentToConstat() => _sentToConstat != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "owner_id" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "impound_price" field.
  String? _impoundPrice;
  String get impoundPrice => _impoundPrice ?? '';
  set impoundPrice(String? val) => _impoundPrice = val;

  bool hasImpoundPrice() => _impoundPrice != null;

  // "setprice_price" field.
  String? _setpricePrice;
  String get setpricePrice => _setpricePrice ?? '';
  set setpricePrice(String? val) => _setpricePrice = val;

  bool hasSetpricePrice() => _setpricePrice != null;

  // "auction_price" field.
  String? _auctionPrice;
  String get auctionPrice => _auctionPrice ?? '';
  set auctionPrice(String? val) => _auctionPrice = val;

  bool hasAuctionPrice() => _auctionPrice != null;

  // "impound_remark_price" field.
  String? _impoundRemarkPrice;
  String get impoundRemarkPrice => _impoundRemarkPrice ?? '';
  set impoundRemarkPrice(String? val) => _impoundRemarkPrice = val;

  bool hasImpoundRemarkPrice() => _impoundRemarkPrice != null;

  // "setprice_remark_price" field.
  String? _setpriceRemarkPrice;
  String get setpriceRemarkPrice => _setpriceRemarkPrice ?? '';
  set setpriceRemarkPrice(String? val) => _setpriceRemarkPrice = val;

  bool hasSetpriceRemarkPrice() => _setpriceRemarkPrice != null;

  // "auction_remark_price" field.
  String? _auctionRemarkPrice;
  String get auctionRemarkPrice => _auctionRemarkPrice ?? '';
  set auctionRemarkPrice(String? val) => _auctionRemarkPrice = val;

  bool hasAuctionRemarkPrice() => _auctionRemarkPrice != null;

  // "impound_ordinal_no" field.
  String? _impoundOrdinalNo;
  String get impoundOrdinalNo => _impoundOrdinalNo ?? '';
  set impoundOrdinalNo(String? val) => _impoundOrdinalNo = val;

  bool hasImpoundOrdinalNo() => _impoundOrdinalNo != null;

  // "setprice_ordinal_no" field.
  String? _setpriceOrdinalNo;
  String get setpriceOrdinalNo => _setpriceOrdinalNo ?? '';
  set setpriceOrdinalNo(String? val) => _setpriceOrdinalNo = val;

  bool hasSetpriceOrdinalNo() => _setpriceOrdinalNo != null;

  // "auction_ordinal_no" field.
  String? _auctionOrdinalNo;
  String get auctionOrdinalNo => _auctionOrdinalNo ?? '';
  set auctionOrdinalNo(String? val) => _auctionOrdinalNo = val;

  bool hasAuctionOrdinalNo() => _auctionOrdinalNo != null;

  // "db_code" field.
  String? _dbCode;
  String get dbCode => _dbCode ?? '';
  set dbCode(String? val) => _dbCode = val;

  bool hasDbCode() => _dbCode != null;

  // "db" field.
  String? _db;
  String get db => _db ?? '';
  set db(String? val) => _db = val;

  bool hasDb() => _db != null;

  // "delivercar_remark_price" field.
  String? _delivercarRemarkPrice;
  String get delivercarRemarkPrice => _delivercarRemarkPrice ?? '';
  set delivercarRemarkPrice(String? val) => _delivercarRemarkPrice = val;

  bool hasDelivercarRemarkPrice() => _delivercarRemarkPrice != null;

  // "locat_delivercar" field.
  String? _locatDelivercar;
  String get locatDelivercar => _locatDelivercar ?? '';
  set locatDelivercar(String? val) => _locatDelivercar = val;

  bool hasLocatDelivercar() => _locatDelivercar != null;

  // "locat_name_delivercar" field.
  String? _locatNameDelivercar;
  String get locatNameDelivercar => _locatNameDelivercar ?? '';
  set locatNameDelivercar(String? val) => _locatNameDelivercar = val;

  bool hasLocatNameDelivercar() => _locatNameDelivercar != null;

  // "logistics_comany" field.
  String? _logisticsComany;
  String get logisticsComany => _logisticsComany ?? '';
  set logisticsComany(String? val) => _logisticsComany = val;

  bool hasLogisticsComany() => _logisticsComany != null;

  // "receiver" field.
  String? _receiver;
  String get receiver => _receiver ?? '';
  set receiver(String? val) => _receiver = val;

  bool hasReceiver() => _receiver != null;

  // "step_price" field.
  String? _stepPrice;
  String get stepPrice => _stepPrice ?? '';
  set stepPrice(String? val) => _stepPrice = val;

  bool hasStepPrice() => _stepPrice != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "region_code" field.
  String? _regionCode;
  String get regionCode => _regionCode ?? '';
  set regionCode(String? val) => _regionCode = val;

  bool hasRegionCode() => _regionCode != null;

  // "ldate" field.
  String? _ldate;
  String get ldate => _ldate ?? '';
  set ldate(String? val) => _ldate = val;

  bool hasLdate() => _ldate != null;

  static ImpoundCarDetailDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ImpoundCarDetailDataTypeStruct(
        improundcarHistoryId: data['improundcar_history_id'] as String?,
        improundcarId: data['improundcar_id'] as String?,
        contNo: data['cont_no'] as String?,
        improundcarLocatId: data['improundcar_locat_id'] as String?,
        locatCode: data['locat_code'] as String?,
        locatName: data['locat_name'] as String?,
        improundcarSubLocatId: data['improundcar_sub_locat_id'] as String?,
        branchName: data['branch_name'] as String?,
        branchCodeEmp: data['branch_code_emp'] as String?,
        branchNameEmp: data['branch_name_emp'] as String?,
        nameTh: data['name_th'] as String?,
        improundcarStatusId: data['improundcar_status_id'] as String?,
        statusCode: data['status_code'] as String?,
        statusName: data['status_name'] as String?,
        createdUserid: data['created_userid'] as String?,
        createdAt: data['created_at'] as String?,
        updatedUserid: data['updated_userid'] as String?,
        updatedAt: data['updated_at'] as String?,
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
        regionName: data['region_name'] as String?,
        price: data['price'] as String?,
        stage: data['stage'] as String?,
        remarkPrice: data['remark_price'] as String?,
        remarkCode: data['remark_code'] as String?,
        remarkDesc: data['remark_desc'] as String?,
        titleCust: data['title_cust'] as String?,
        firstnameCust: data['firstname_cust'] as String?,
        lastnameCust: data['lastname_cust'] as String?,
        typeContract: data['type_contract'] as String?,
        productCode: data['product_code'] as String?,
        productName: data['product_name'] as String?,
        numBody: data['num_body'] as String?,
        registrationCar: data['registration_car'] as String?,
        registrationProve: data['registration_prove'] as String?,
        contnoTypeName: data['contno_type_name'] as String?,
        locat: data['locat'] as String?,
        cuscod: data['cuscod'] as String?,
        originYear: data['origin_year'] as String?,
        convertYear: data['convert_year'] as String?,
        arnow: data['arnow'] as String?,
        constat: data['constat'] as String?,
        typecod: data['typecod'] as String?,
        modelcod: data['modelcod'] as String?,
        colorcod: data['colorcod'] as String?,
        keyincshprc: data['keyincshprc'] as String?,
        engno: data['engno'] as String?,
        impoundEmp: data['impound_emp'] as String?,
        impoundNameth: data['impound_nameth'] as String?,
        impoundDate: data['impound_date'] as String?,
        returnToBranch: data['return_to_branch'] as String?,
        sentToConstat: data['sent_to_constat'] as String?,
        remark: data['remark'] as String?,
        ownerId: data['owner_id'] as String?,
        impoundPrice: data['impound_price'] as String?,
        setpricePrice: data['setprice_price'] as String?,
        auctionPrice: data['auction_price'] as String?,
        impoundRemarkPrice: data['impound_remark_price'] as String?,
        setpriceRemarkPrice: data['setprice_remark_price'] as String?,
        auctionRemarkPrice: data['auction_remark_price'] as String?,
        impoundOrdinalNo: data['impound_ordinal_no'] as String?,
        setpriceOrdinalNo: data['setprice_ordinal_no'] as String?,
        auctionOrdinalNo: data['auction_ordinal_no'] as String?,
        dbCode: data['db_code'] as String?,
        db: data['db'] as String?,
        delivercarRemarkPrice: data['delivercar_remark_price'] as String?,
        locatDelivercar: data['locat_delivercar'] as String?,
        locatNameDelivercar: data['locat_name_delivercar'] as String?,
        logisticsComany: data['logistics_comany'] as String?,
        receiver: data['receiver'] as String?,
        stepPrice: data['step_price'] as String?,
        images: getDataList(data['images']),
        regionCode: data['region_code'] as String?,
        ldate: data['ldate'] as String?,
      );

  static ImpoundCarDetailDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ImpoundCarDetailDataTypeStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'improundcar_history_id': _improundcarHistoryId,
        'improundcar_id': _improundcarId,
        'cont_no': _contNo,
        'improundcar_locat_id': _improundcarLocatId,
        'locat_code': _locatCode,
        'locat_name': _locatName,
        'improundcar_sub_locat_id': _improundcarSubLocatId,
        'branch_name': _branchName,
        'branch_code_emp': _branchCodeEmp,
        'branch_name_emp': _branchNameEmp,
        'name_th': _nameTh,
        'improundcar_status_id': _improundcarStatusId,
        'status_code': _statusCode,
        'status_name': _statusName,
        'created_userid': _createdUserid,
        'created_at': _createdAt,
        'updated_userid': _updatedUserid,
        'updated_at': _updatedAt,
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
        'region_name': _regionName,
        'price': _price,
        'stage': _stage,
        'remark_price': _remarkPrice,
        'remark_code': _remarkCode,
        'remark_desc': _remarkDesc,
        'title_cust': _titleCust,
        'firstname_cust': _firstnameCust,
        'lastname_cust': _lastnameCust,
        'type_contract': _typeContract,
        'product_code': _productCode,
        'product_name': _productName,
        'num_body': _numBody,
        'registration_car': _registrationCar,
        'registration_prove': _registrationProve,
        'contno_type_name': _contnoTypeName,
        'locat': _locat,
        'cuscod': _cuscod,
        'origin_year': _originYear,
        'convert_year': _convertYear,
        'arnow': _arnow,
        'constat': _constat,
        'typecod': _typecod,
        'modelcod': _modelcod,
        'colorcod': _colorcod,
        'keyincshprc': _keyincshprc,
        'engno': _engno,
        'impound_emp': _impoundEmp,
        'impound_nameth': _impoundNameth,
        'impound_date': _impoundDate,
        'return_to_branch': _returnToBranch,
        'sent_to_constat': _sentToConstat,
        'remark': _remark,
        'owner_id': _ownerId,
        'impound_price': _impoundPrice,
        'setprice_price': _setpricePrice,
        'auction_price': _auctionPrice,
        'impound_remark_price': _impoundRemarkPrice,
        'setprice_remark_price': _setpriceRemarkPrice,
        'auction_remark_price': _auctionRemarkPrice,
        'impound_ordinal_no': _impoundOrdinalNo,
        'setprice_ordinal_no': _setpriceOrdinalNo,
        'auction_ordinal_no': _auctionOrdinalNo,
        'db_code': _dbCode,
        'db': _db,
        'delivercar_remark_price': _delivercarRemarkPrice,
        'locat_delivercar': _locatDelivercar,
        'locat_name_delivercar': _locatNameDelivercar,
        'logistics_comany': _logisticsComany,
        'receiver': _receiver,
        'step_price': _stepPrice,
        'images': _images,
        'region_code': _regionCode,
        'ldate': _ldate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'improundcar_history_id': serializeParam(
          _improundcarHistoryId,
          ParamType.String,
        ),
        'improundcar_id': serializeParam(
          _improundcarId,
          ParamType.String,
        ),
        'cont_no': serializeParam(
          _contNo,
          ParamType.String,
        ),
        'improundcar_locat_id': serializeParam(
          _improundcarLocatId,
          ParamType.String,
        ),
        'locat_code': serializeParam(
          _locatCode,
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
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'branch_code_emp': serializeParam(
          _branchCodeEmp,
          ParamType.String,
        ),
        'branch_name_emp': serializeParam(
          _branchNameEmp,
          ParamType.String,
        ),
        'name_th': serializeParam(
          _nameTh,
          ParamType.String,
        ),
        'improundcar_status_id': serializeParam(
          _improundcarStatusId,
          ParamType.String,
        ),
        'status_code': serializeParam(
          _statusCode,
          ParamType.String,
        ),
        'status_name': serializeParam(
          _statusName,
          ParamType.String,
        ),
        'created_userid': serializeParam(
          _createdUserid,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_userid': serializeParam(
          _updatedUserid,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
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
        'region_name': serializeParam(
          _regionName,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'stage': serializeParam(
          _stage,
          ParamType.String,
        ),
        'remark_price': serializeParam(
          _remarkPrice,
          ParamType.String,
        ),
        'remark_code': serializeParam(
          _remarkCode,
          ParamType.String,
        ),
        'remark_desc': serializeParam(
          _remarkDesc,
          ParamType.String,
        ),
        'title_cust': serializeParam(
          _titleCust,
          ParamType.String,
        ),
        'firstname_cust': serializeParam(
          _firstnameCust,
          ParamType.String,
        ),
        'lastname_cust': serializeParam(
          _lastnameCust,
          ParamType.String,
        ),
        'type_contract': serializeParam(
          _typeContract,
          ParamType.String,
        ),
        'product_code': serializeParam(
          _productCode,
          ParamType.String,
        ),
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'num_body': serializeParam(
          _numBody,
          ParamType.String,
        ),
        'registration_car': serializeParam(
          _registrationCar,
          ParamType.String,
        ),
        'registration_prove': serializeParam(
          _registrationProve,
          ParamType.String,
        ),
        'contno_type_name': serializeParam(
          _contnoTypeName,
          ParamType.String,
        ),
        'locat': serializeParam(
          _locat,
          ParamType.String,
        ),
        'cuscod': serializeParam(
          _cuscod,
          ParamType.String,
        ),
        'origin_year': serializeParam(
          _originYear,
          ParamType.String,
        ),
        'convert_year': serializeParam(
          _convertYear,
          ParamType.String,
        ),
        'arnow': serializeParam(
          _arnow,
          ParamType.String,
        ),
        'constat': serializeParam(
          _constat,
          ParamType.String,
        ),
        'typecod': serializeParam(
          _typecod,
          ParamType.String,
        ),
        'modelcod': serializeParam(
          _modelcod,
          ParamType.String,
        ),
        'colorcod': serializeParam(
          _colorcod,
          ParamType.String,
        ),
        'keyincshprc': serializeParam(
          _keyincshprc,
          ParamType.String,
        ),
        'engno': serializeParam(
          _engno,
          ParamType.String,
        ),
        'impound_emp': serializeParam(
          _impoundEmp,
          ParamType.String,
        ),
        'impound_nameth': serializeParam(
          _impoundNameth,
          ParamType.String,
        ),
        'impound_date': serializeParam(
          _impoundDate,
          ParamType.String,
        ),
        'return_to_branch': serializeParam(
          _returnToBranch,
          ParamType.String,
        ),
        'sent_to_constat': serializeParam(
          _sentToConstat,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'owner_id': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'impound_price': serializeParam(
          _impoundPrice,
          ParamType.String,
        ),
        'setprice_price': serializeParam(
          _setpricePrice,
          ParamType.String,
        ),
        'auction_price': serializeParam(
          _auctionPrice,
          ParamType.String,
        ),
        'impound_remark_price': serializeParam(
          _impoundRemarkPrice,
          ParamType.String,
        ),
        'setprice_remark_price': serializeParam(
          _setpriceRemarkPrice,
          ParamType.String,
        ),
        'auction_remark_price': serializeParam(
          _auctionRemarkPrice,
          ParamType.String,
        ),
        'impound_ordinal_no': serializeParam(
          _impoundOrdinalNo,
          ParamType.String,
        ),
        'setprice_ordinal_no': serializeParam(
          _setpriceOrdinalNo,
          ParamType.String,
        ),
        'auction_ordinal_no': serializeParam(
          _auctionOrdinalNo,
          ParamType.String,
        ),
        'db_code': serializeParam(
          _dbCode,
          ParamType.String,
        ),
        'db': serializeParam(
          _db,
          ParamType.String,
        ),
        'delivercar_remark_price': serializeParam(
          _delivercarRemarkPrice,
          ParamType.String,
        ),
        'locat_delivercar': serializeParam(
          _locatDelivercar,
          ParamType.String,
        ),
        'locat_name_delivercar': serializeParam(
          _locatNameDelivercar,
          ParamType.String,
        ),
        'logistics_comany': serializeParam(
          _logisticsComany,
          ParamType.String,
        ),
        'receiver': serializeParam(
          _receiver,
          ParamType.String,
        ),
        'step_price': serializeParam(
          _stepPrice,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'region_code': serializeParam(
          _regionCode,
          ParamType.String,
        ),
        'ldate': serializeParam(
          _ldate,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImpoundCarDetailDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ImpoundCarDetailDataTypeStruct(
        improundcarHistoryId: deserializeParam(
          data['improundcar_history_id'],
          ParamType.String,
          false,
        ),
        improundcarId: deserializeParam(
          data['improundcar_id'],
          ParamType.String,
          false,
        ),
        contNo: deserializeParam(
          data['cont_no'],
          ParamType.String,
          false,
        ),
        improundcarLocatId: deserializeParam(
          data['improundcar_locat_id'],
          ParamType.String,
          false,
        ),
        locatCode: deserializeParam(
          data['locat_code'],
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
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        branchCodeEmp: deserializeParam(
          data['branch_code_emp'],
          ParamType.String,
          false,
        ),
        branchNameEmp: deserializeParam(
          data['branch_name_emp'],
          ParamType.String,
          false,
        ),
        nameTh: deserializeParam(
          data['name_th'],
          ParamType.String,
          false,
        ),
        improundcarStatusId: deserializeParam(
          data['improundcar_status_id'],
          ParamType.String,
          false,
        ),
        statusCode: deserializeParam(
          data['status_code'],
          ParamType.String,
          false,
        ),
        statusName: deserializeParam(
          data['status_name'],
          ParamType.String,
          false,
        ),
        createdUserid: deserializeParam(
          data['created_userid'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedUserid: deserializeParam(
          data['updated_userid'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
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
        regionName: deserializeParam(
          data['region_name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        stage: deserializeParam(
          data['stage'],
          ParamType.String,
          false,
        ),
        remarkPrice: deserializeParam(
          data['remark_price'],
          ParamType.String,
          false,
        ),
        remarkCode: deserializeParam(
          data['remark_code'],
          ParamType.String,
          false,
        ),
        remarkDesc: deserializeParam(
          data['remark_desc'],
          ParamType.String,
          false,
        ),
        titleCust: deserializeParam(
          data['title_cust'],
          ParamType.String,
          false,
        ),
        firstnameCust: deserializeParam(
          data['firstname_cust'],
          ParamType.String,
          false,
        ),
        lastnameCust: deserializeParam(
          data['lastname_cust'],
          ParamType.String,
          false,
        ),
        typeContract: deserializeParam(
          data['type_contract'],
          ParamType.String,
          false,
        ),
        productCode: deserializeParam(
          data['product_code'],
          ParamType.String,
          false,
        ),
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        numBody: deserializeParam(
          data['num_body'],
          ParamType.String,
          false,
        ),
        registrationCar: deserializeParam(
          data['registration_car'],
          ParamType.String,
          false,
        ),
        registrationProve: deserializeParam(
          data['registration_prove'],
          ParamType.String,
          false,
        ),
        contnoTypeName: deserializeParam(
          data['contno_type_name'],
          ParamType.String,
          false,
        ),
        locat: deserializeParam(
          data['locat'],
          ParamType.String,
          false,
        ),
        cuscod: deserializeParam(
          data['cuscod'],
          ParamType.String,
          false,
        ),
        originYear: deserializeParam(
          data['origin_year'],
          ParamType.String,
          false,
        ),
        convertYear: deserializeParam(
          data['convert_year'],
          ParamType.String,
          false,
        ),
        arnow: deserializeParam(
          data['arnow'],
          ParamType.String,
          false,
        ),
        constat: deserializeParam(
          data['constat'],
          ParamType.String,
          false,
        ),
        typecod: deserializeParam(
          data['typecod'],
          ParamType.String,
          false,
        ),
        modelcod: deserializeParam(
          data['modelcod'],
          ParamType.String,
          false,
        ),
        colorcod: deserializeParam(
          data['colorcod'],
          ParamType.String,
          false,
        ),
        keyincshprc: deserializeParam(
          data['keyincshprc'],
          ParamType.String,
          false,
        ),
        engno: deserializeParam(
          data['engno'],
          ParamType.String,
          false,
        ),
        impoundEmp: deserializeParam(
          data['impound_emp'],
          ParamType.String,
          false,
        ),
        impoundNameth: deserializeParam(
          data['impound_nameth'],
          ParamType.String,
          false,
        ),
        impoundDate: deserializeParam(
          data['impound_date'],
          ParamType.String,
          false,
        ),
        returnToBranch: deserializeParam(
          data['return_to_branch'],
          ParamType.String,
          false,
        ),
        sentToConstat: deserializeParam(
          data['sent_to_constat'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['owner_id'],
          ParamType.String,
          false,
        ),
        impoundPrice: deserializeParam(
          data['impound_price'],
          ParamType.String,
          false,
        ),
        setpricePrice: deserializeParam(
          data['setprice_price'],
          ParamType.String,
          false,
        ),
        auctionPrice: deserializeParam(
          data['auction_price'],
          ParamType.String,
          false,
        ),
        impoundRemarkPrice: deserializeParam(
          data['impound_remark_price'],
          ParamType.String,
          false,
        ),
        setpriceRemarkPrice: deserializeParam(
          data['setprice_remark_price'],
          ParamType.String,
          false,
        ),
        auctionRemarkPrice: deserializeParam(
          data['auction_remark_price'],
          ParamType.String,
          false,
        ),
        impoundOrdinalNo: deserializeParam(
          data['impound_ordinal_no'],
          ParamType.String,
          false,
        ),
        setpriceOrdinalNo: deserializeParam(
          data['setprice_ordinal_no'],
          ParamType.String,
          false,
        ),
        auctionOrdinalNo: deserializeParam(
          data['auction_ordinal_no'],
          ParamType.String,
          false,
        ),
        dbCode: deserializeParam(
          data['db_code'],
          ParamType.String,
          false,
        ),
        db: deserializeParam(
          data['db'],
          ParamType.String,
          false,
        ),
        delivercarRemarkPrice: deserializeParam(
          data['delivercar_remark_price'],
          ParamType.String,
          false,
        ),
        locatDelivercar: deserializeParam(
          data['locat_delivercar'],
          ParamType.String,
          false,
        ),
        locatNameDelivercar: deserializeParam(
          data['locat_name_delivercar'],
          ParamType.String,
          false,
        ),
        logisticsComany: deserializeParam(
          data['logistics_comany'],
          ParamType.String,
          false,
        ),
        receiver: deserializeParam(
          data['receiver'],
          ParamType.String,
          false,
        ),
        stepPrice: deserializeParam(
          data['step_price'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        regionCode: deserializeParam(
          data['region_code'],
          ParamType.String,
          false,
        ),
        ldate: deserializeParam(
          data['ldate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImpoundCarDetailDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImpoundCarDetailDataTypeStruct &&
        improundcarHistoryId == other.improundcarHistoryId &&
        improundcarId == other.improundcarId &&
        contNo == other.contNo &&
        improundcarLocatId == other.improundcarLocatId &&
        locatCode == other.locatCode &&
        locatName == other.locatName &&
        improundcarSubLocatId == other.improundcarSubLocatId &&
        branchName == other.branchName &&
        branchCodeEmp == other.branchCodeEmp &&
        branchNameEmp == other.branchNameEmp &&
        nameTh == other.nameTh &&
        improundcarStatusId == other.improundcarStatusId &&
        statusCode == other.statusCode &&
        statusName == other.statusName &&
        createdUserid == other.createdUserid &&
        createdAt == other.createdAt &&
        updatedUserid == other.updatedUserid &&
        updatedAt == other.updatedAt &&
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
        regionName == other.regionName &&
        price == other.price &&
        stage == other.stage &&
        remarkPrice == other.remarkPrice &&
        remarkCode == other.remarkCode &&
        remarkDesc == other.remarkDesc &&
        titleCust == other.titleCust &&
        firstnameCust == other.firstnameCust &&
        lastnameCust == other.lastnameCust &&
        typeContract == other.typeContract &&
        productCode == other.productCode &&
        productName == other.productName &&
        numBody == other.numBody &&
        registrationCar == other.registrationCar &&
        registrationProve == other.registrationProve &&
        contnoTypeName == other.contnoTypeName &&
        locat == other.locat &&
        cuscod == other.cuscod &&
        originYear == other.originYear &&
        convertYear == other.convertYear &&
        arnow == other.arnow &&
        constat == other.constat &&
        typecod == other.typecod &&
        modelcod == other.modelcod &&
        colorcod == other.colorcod &&
        keyincshprc == other.keyincshprc &&
        engno == other.engno &&
        impoundEmp == other.impoundEmp &&
        impoundNameth == other.impoundNameth &&
        impoundDate == other.impoundDate &&
        returnToBranch == other.returnToBranch &&
        sentToConstat == other.sentToConstat &&
        remark == other.remark &&
        ownerId == other.ownerId &&
        impoundPrice == other.impoundPrice &&
        setpricePrice == other.setpricePrice &&
        auctionPrice == other.auctionPrice &&
        impoundRemarkPrice == other.impoundRemarkPrice &&
        setpriceRemarkPrice == other.setpriceRemarkPrice &&
        auctionRemarkPrice == other.auctionRemarkPrice &&
        impoundOrdinalNo == other.impoundOrdinalNo &&
        setpriceOrdinalNo == other.setpriceOrdinalNo &&
        auctionOrdinalNo == other.auctionOrdinalNo &&
        dbCode == other.dbCode &&
        db == other.db &&
        delivercarRemarkPrice == other.delivercarRemarkPrice &&
        locatDelivercar == other.locatDelivercar &&
        locatNameDelivercar == other.locatNameDelivercar &&
        logisticsComany == other.logisticsComany &&
        receiver == other.receiver &&
        stepPrice == other.stepPrice &&
        listEquality.equals(images, other.images) &&
        regionCode == other.regionCode &&
        ldate == other.ldate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        improundcarHistoryId,
        improundcarId,
        contNo,
        improundcarLocatId,
        locatCode,
        locatName,
        improundcarSubLocatId,
        branchName,
        branchCodeEmp,
        branchNameEmp,
        nameTh,
        improundcarStatusId,
        statusCode,
        statusName,
        createdUserid,
        createdAt,
        updatedUserid,
        updatedAt,
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
        regionName,
        price,
        stage,
        remarkPrice,
        remarkCode,
        remarkDesc,
        titleCust,
        firstnameCust,
        lastnameCust,
        typeContract,
        productCode,
        productName,
        numBody,
        registrationCar,
        registrationProve,
        contnoTypeName,
        locat,
        cuscod,
        originYear,
        convertYear,
        arnow,
        constat,
        typecod,
        modelcod,
        colorcod,
        keyincshprc,
        engno,
        impoundEmp,
        impoundNameth,
        impoundDate,
        returnToBranch,
        sentToConstat,
        remark,
        ownerId,
        impoundPrice,
        setpricePrice,
        auctionPrice,
        impoundRemarkPrice,
        setpriceRemarkPrice,
        auctionRemarkPrice,
        impoundOrdinalNo,
        setpriceOrdinalNo,
        auctionOrdinalNo,
        dbCode,
        db,
        delivercarRemarkPrice,
        locatDelivercar,
        locatNameDelivercar,
        logisticsComany,
        receiver,
        stepPrice,
        images,
        regionCode,
        ldate
      ]);
}

ImpoundCarDetailDataTypeStruct createImpoundCarDetailDataTypeStruct({
  String? improundcarHistoryId,
  String? improundcarId,
  String? contNo,
  String? improundcarLocatId,
  String? locatCode,
  String? locatName,
  String? improundcarSubLocatId,
  String? branchName,
  String? branchCodeEmp,
  String? branchNameEmp,
  String? nameTh,
  String? improundcarStatusId,
  String? statusCode,
  String? statusName,
  String? createdUserid,
  String? createdAt,
  String? updatedUserid,
  String? updatedAt,
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
  String? regionName,
  String? price,
  String? stage,
  String? remarkPrice,
  String? remarkCode,
  String? remarkDesc,
  String? titleCust,
  String? firstnameCust,
  String? lastnameCust,
  String? typeContract,
  String? productCode,
  String? productName,
  String? numBody,
  String? registrationCar,
  String? registrationProve,
  String? contnoTypeName,
  String? locat,
  String? cuscod,
  String? originYear,
  String? convertYear,
  String? arnow,
  String? constat,
  String? typecod,
  String? modelcod,
  String? colorcod,
  String? keyincshprc,
  String? engno,
  String? impoundEmp,
  String? impoundNameth,
  String? impoundDate,
  String? returnToBranch,
  String? sentToConstat,
  String? remark,
  String? ownerId,
  String? impoundPrice,
  String? setpricePrice,
  String? auctionPrice,
  String? impoundRemarkPrice,
  String? setpriceRemarkPrice,
  String? auctionRemarkPrice,
  String? impoundOrdinalNo,
  String? setpriceOrdinalNo,
  String? auctionOrdinalNo,
  String? dbCode,
  String? db,
  String? delivercarRemarkPrice,
  String? locatDelivercar,
  String? locatNameDelivercar,
  String? logisticsComany,
  String? receiver,
  String? stepPrice,
  String? regionCode,
  String? ldate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImpoundCarDetailDataTypeStruct(
      improundcarHistoryId: improundcarHistoryId,
      improundcarId: improundcarId,
      contNo: contNo,
      improundcarLocatId: improundcarLocatId,
      locatCode: locatCode,
      locatName: locatName,
      improundcarSubLocatId: improundcarSubLocatId,
      branchName: branchName,
      branchCodeEmp: branchCodeEmp,
      branchNameEmp: branchNameEmp,
      nameTh: nameTh,
      improundcarStatusId: improundcarStatusId,
      statusCode: statusCode,
      statusName: statusName,
      createdUserid: createdUserid,
      createdAt: createdAt,
      updatedUserid: updatedUserid,
      updatedAt: updatedAt,
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
      regionName: regionName,
      price: price,
      stage: stage,
      remarkPrice: remarkPrice,
      remarkCode: remarkCode,
      remarkDesc: remarkDesc,
      titleCust: titleCust,
      firstnameCust: firstnameCust,
      lastnameCust: lastnameCust,
      typeContract: typeContract,
      productCode: productCode,
      productName: productName,
      numBody: numBody,
      registrationCar: registrationCar,
      registrationProve: registrationProve,
      contnoTypeName: contnoTypeName,
      locat: locat,
      cuscod: cuscod,
      originYear: originYear,
      convertYear: convertYear,
      arnow: arnow,
      constat: constat,
      typecod: typecod,
      modelcod: modelcod,
      colorcod: colorcod,
      keyincshprc: keyincshprc,
      engno: engno,
      impoundEmp: impoundEmp,
      impoundNameth: impoundNameth,
      impoundDate: impoundDate,
      returnToBranch: returnToBranch,
      sentToConstat: sentToConstat,
      remark: remark,
      ownerId: ownerId,
      impoundPrice: impoundPrice,
      setpricePrice: setpricePrice,
      auctionPrice: auctionPrice,
      impoundRemarkPrice: impoundRemarkPrice,
      setpriceRemarkPrice: setpriceRemarkPrice,
      auctionRemarkPrice: auctionRemarkPrice,
      impoundOrdinalNo: impoundOrdinalNo,
      setpriceOrdinalNo: setpriceOrdinalNo,
      auctionOrdinalNo: auctionOrdinalNo,
      dbCode: dbCode,
      db: db,
      delivercarRemarkPrice: delivercarRemarkPrice,
      locatDelivercar: locatDelivercar,
      locatNameDelivercar: locatNameDelivercar,
      logisticsComany: logisticsComany,
      receiver: receiver,
      stepPrice: stepPrice,
      regionCode: regionCode,
      ldate: ldate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImpoundCarDetailDataTypeStruct? updateImpoundCarDetailDataTypeStruct(
  ImpoundCarDetailDataTypeStruct? impoundCarDetailDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    impoundCarDetailDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImpoundCarDetailDataTypeStructData(
  Map<String, dynamic> firestoreData,
  ImpoundCarDetailDataTypeStruct? impoundCarDetailDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (impoundCarDetailDataType == null) {
    return;
  }
  if (impoundCarDetailDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      impoundCarDetailDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final impoundCarDetailDataTypeData = getImpoundCarDetailDataTypeFirestoreData(
      impoundCarDetailDataType, forFieldValue);
  final nestedData =
      impoundCarDetailDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      impoundCarDetailDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImpoundCarDetailDataTypeFirestoreData(
  ImpoundCarDetailDataTypeStruct? impoundCarDetailDataType, [
  bool forFieldValue = false,
]) {
  if (impoundCarDetailDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(impoundCarDetailDataType.toMap());

  // Add any Firestore field values
  mapToFirestore(impoundCarDetailDataType.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImpoundCarDetailDataTypeListFirestoreData(
  List<ImpoundCarDetailDataTypeStruct>? impoundCarDetailDataTypes,
) =>
    impoundCarDetailDataTypes
        ?.map((e) => getImpoundCarDetailDataTypeFirestoreData(e, true))
        .toList() ??
    [];
