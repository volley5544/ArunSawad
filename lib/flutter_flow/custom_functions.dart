import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String getUserLocation(LatLng? userLocation) {
  String userLatLng = '${userLocation!.latitude},${userLocation.longitude}';
  return userLatLng;
}

String imgNameShow(String? imgPath) {
  // get upload file name
  if (imgPath == null || imgPath.isEmpty) return '';
  return imgPath.split('/').last.split('.').first;
}

bool checkGPSDeviceIsOn(LatLng? currentDeviceLocation) {
  // Add your function code here!
  bool deviceLocationIsOn = false;
  if (currentDeviceLocation!.latitude != 0.0 &&
      currentDeviceLocation!.longitude != 0.0) {
    deviceLocationIsOn = true;
  }
  return deviceLocationIsOn;
}

bool returnTrueFunction() {
  // Add your function code here!
  return true;
}

String returnLatLng() {
  // Add your function code here!
  return '0.0,0.0';
}

String? toUpperCase(String? value) {
  // Add your function code here!

  return value!.toUpperCase();
}

String? getCarPlatePlaceholder(String? dropdownValue) {
  // Add your function code here!
  String placeHolder = 'เลขทะเบียนรถ เช่น กก-1234';
  if (dropdownValue == 'รถการเกษตร') {
    placeHolder = 'เลขตัวรถ';
  }
  return placeHolder;
}

String? materialListToString(List<String>? materialRecordID) {
  // Add your function code here!
  String materialRecord = '';
  for (var i = 0; i < materialRecordID!.length; i++) {
    if (i == 0) {
      materialRecord = materialRecord + materialRecordID[i];
    } else {
      materialRecord = materialRecord + ',' + materialRecordID[i];
    }
  }
  return materialRecord;
}

String? materialImgListToString(List<String>? materialImgList) {
  // Add your function code here!
  String materialRecord = '';
  for (var i = 0; i < materialImgList!.length; i++) {
    if (i == 0) {
      materialRecord = materialRecord + materialImgList[i];
    } else {
      materialRecord = materialRecord + ',' + materialImgList[i];
    }
  }
  return materialRecord;
}

String? materialAmountListToString(List<int>? matAmountList) {
  // Add your function code here!
  String materialAmount = '';
  for (var i = 0; i < matAmountList!.length; i++) {
    if (i == 0) {
      materialAmount = materialAmount + '${matAmountList[i]}';
    } else {
      materialAmount = materialAmount + ',' + '${matAmountList[i]}';
    }
  }
  return materialAmount;
}

List<int>? createMatAmountList(int? index) {
  // Add your function code here!
  List<int>? materialAmount = [];
  for (var i = 0; i < index!; i++) {
    materialAmount.insert(i, 0);
  }
  return materialAmount;
}

List<int>? updateMatAmountList(
  List<int>? materialAmountList,
  int? index,
  int? amount,
) {
  // Add your function code here!
  List<int> materialAmountListUpdate = materialAmountList!;
  materialAmountListUpdate[index!] = amount!;
  return materialAmountListUpdate;
}

List<int>? matAmountListCounterValue(
  List<int>? materialAmountList,
  int? index,
  bool isIncreased,
) {
  // Add your function code here!
  List<int> materialAmountListUpdate = materialAmountList!;
  if (isIncreased) {
    if (index! == 0) {
      if (materialAmountListUpdate[index!] < 1) {
        materialAmountListUpdate[index!]++;
      }
    } else {
      if (materialAmountListUpdate[index!] < 99999) {
        materialAmountListUpdate[index!]++;
      }
    }
  } else {
    if (index! == 0) {
      if (materialAmountListUpdate[index!] > 0) {
        materialAmountListUpdate[index!]--;
      }
    } else {
      if (materialAmountListUpdate[index!] > 0) {
        materialAmountListUpdate[index!]--;
      }
    }
  }

  return materialAmountListUpdate;
}

int? showMatAmountInList(
  List<int>? materialAmountList,
  int? index,
) {
  // Add your function code here!
  return materialAmountList![index!];
}

String? showMatImgInList(
  List<String>? materialImgList,
  int? index,
) {
  // Add your function code here!
  return materialImgList![index!];
}

String? showMatNameInList(
  List<String>? materialNameList,
  int? index,
) {
  // Add your function code here!
  return materialNameList![index!];
}

bool visibleUploadedImg(
  bool? isFromTimesheet,
  int? numberInImgList,
) {
  // Add your function code here!
  bool isVisible = false;
  if (isFromTimesheet == false && numberInImgList! > 0) {
    isVisible = true;
  }
  return isVisible;
}

CityRecord markerLocation(LatLng? currentLocation) {
  // Add your function code here!
  final marker = CityRecord();

  //marker.name = 'My Location';
  //marker.location = currentLocation;

  // CityRecord location1 =CityRecord((p0) => {
  //   p0.name = 'My Location',
  //   p0.location = currentLocation
  // });

  return marker;
}

bool checkmatAmountIsEmpty(List<int>? matAmountList) {
  // Add your function code here!
  bool isEmpty = true;
  for (var i = 0; i < matAmountList!.length; i++) {
    if (matAmountList[i] > 0) {
      isEmpty = false;
    }
  }
  return isEmpty;
}

String cancelButtonText(bool? isFromTimesheet) {
  // Add your function code here!
  String text = 'ยกเลิก';
  if (isFromTimesheet!) {
    text = 'ย้อนกลับ';
  }

  return text;
}

String buttonTextVloanGetContract(bool? isGetVloanContract) {
  // Add your function code here!
  String text = 'ค้นหาข้อมูลสัญญา';
  if (isGetVloanContract!) {
    text = 'รีเซ็ต';
  }

  return text;
}

String showJobType(String? jobType) {
  // Add your function code here!
  String text = '';
  if (jobType == 'Check In') {
    text = 'เช็คอิน';
  } else if (jobType == 'Checker') {
    text = 'ฝ่ายตรวจสอบ';
  } else if (jobType == 'Survey') {
    text = 'สำรวจลูกค้า';
  } else if (jobType == 'Collection') {
    text = 'ติดตามหนี้';
  } else if (jobType == 'Marketing') {
    text = 'ทำการตลาด';
  } else if (jobType == 'Survey NPA') {
    text = 'สำรวจ NPA';
  } else if (jobType == 'OPS') {
    text = 'ทรัพย์สิน OPS';
  }

  return text;
}

String showLocationTimesheet(
  double? latitude,
  double? longitude,
  bool? isInDetail,
) {
  // Add your function code here!
  String location = '';
  if (isInDetail!) {
    location = '${latitude},${longitude}';
  } else {
    location = 'พิกัด ${latitude},${longitude}';
  }

  return location;
}

DateTime showClockIn(String? clockIn) {
  // Add your function code here!
  DateTime time = DateTime.parse('$clockIn');

  return time;
}

String showDateTimesheetDetail(DateTime? date) {
  // Add your function code here!
  return DateFormat('EEEE, dd MMMM y', 'th').format(date!);
}

String showClockTimesheetDetail(DateTime? time) {
  // Add your function code here!
  return DateFormat.Hms().format(time!);
}

int matAmountDoubleToInt(double? amount) {
  // Add your function code here!

  return amount!.toInt();
}

bool isCounterIncreasedButtonVisible(
  List<int>? matAmountList,
  int? index,
) {
  // Add your function code here!
  bool visible = false;
  if (index == 0 && matAmountList![index!] < 1) {
    visible = true;
  } else {
    if (index != 0 && matAmountList![index!] < 99999) {
      visible = true;
    }
  }
  return visible;
}

bool isCounterIncreasedButtonInvisible(
  List<int>? matAmountList,
  int? index,
) {
  // Add your function code here!
  bool visible = false;
  if (index == 0 && matAmountList![index!] >= 1) {
    visible = true;
  } else if (matAmountList![index!] >= 99999) {
    visible = true;
  }
  return visible;
}

bool checkIdCardInput(String? idCardInput) {
  // Add your function code here!
  if (idCardInput!.length != 13) {
    return false;
  } else {
    if (int.tryParse(idCardInput!) != null) {
      return true;
    } else {
      return false;
    }
  }
}

String showVloanCustomerName(List<String>? vloanCustomerNameList) {
  // Add your function code here!
  if (vloanCustomerNameList!.isEmpty) {
    return 'ชื่อ-สกุลลูกค้า';
  }
  return vloanCustomerNameList![0];
}

String showVloanContNoInitialOption(List<String>? vloanContNoList) {
  // Add your function code here!
  if (vloanContNoList!.isEmpty) {
    return 'เลขสัญญา';
  }
  return vloanContNoList![0];
}

int findContNoIndex(
  String? contNoDropDown,
  List<String>? contNoList,
) {
  // Add your function code here!
  var index;

  for (var i = 0; i < contNoList!.length; i++) {
    if (contNoDropDown == contNoList[i]) {
      index = i;
      break;
    }
  }
  return index;
}
