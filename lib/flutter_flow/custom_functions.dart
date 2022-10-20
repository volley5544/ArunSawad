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

bool checkPinCodeInput(String? pinCodeInput) {
  // Add your function code here!
  if (pinCodeInput!.length != 6) {
    return false;
  } else {
    if (int.tryParse(pinCodeInput!) != null) {
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

int leadTimeRemain(
  List<String>? leadCreatedTimeTextList,
  DateTime? currentTime,
  int? index,
) {
  // Add your function code here!
  //leadCreatedTime = DateTime.parse("2022-09-20 10:00:00");
  DateTime leadCreatedTime = DateTime.parse(leadCreatedTimeTextList![index!]);

  DateTime leadFinalTime = leadCreatedTime.add(const Duration(days: 15));
  int leadTimeLeft = leadFinalTime.difference(currentTime!).inDays;

  return leadTimeLeft;
}

String showLeadTimeRemain(int? leadTimeRemain) {
  // Add your function code here!
  String text = '${leadTimeRemain!} วัน';
  if (leadTimeRemain == 0) {
    text = 'วันสุดท้าย';
  }

  return text;
}

DateTime showLeadCreatedTime(
  List<String>? leadCreatedTimeTextList,
  int? index,
) {
  // Add your function code here!
  //DateTime time = DateTime.parse('$clockIn');
  String timeText = leadCreatedTimeTextList![index!];
  return DateTime.parse(timeText);
  //leadCreatedTimeList![index!];
}

String showLeadIdInList(
  List<String>? leadID,
  int? index,
  List<String>? branchCode,
) {
  // Add your function code here!
  return 'Lead ID: ${leadID![index!]} (${branchCode![index!]})';
}

String showLeadEmployeeIdInList(
  List<String>? employeeIdList,
  int? index,
) {
  // Add your function code here!
  return 'รหัสพนักงาน: ${employeeIdList![index!]}';
}

String generateStuffFirebaseEmail(String? employeeID) {
  // Add your function code here!
  return '${employeeID}@srisawadstaff.com';
}

bool checkDoNotShowAgain(
  DateTime? dateDoNotShowAgain,
  DateTime? currentDate,
) {
  // Add your function code here!
  bool doNotShowAgain = true;

  if (dateDoNotShowAgain != null) {
    //doNotShowDate!.difference(currentDate!).inDays;
    if (dateDoNotShowAgain.difference(currentDate!).inDays == 0) {
      doNotShowAgain = false;
    }
  } else if (dateDoNotShowAgain == null) {
    doNotShowAgain = false;
  }
  //DateTime leadFinalTime = leadCreatedTime![index!].add(Duration(days: 15));
  //int leadTimeLeft = leadFinalTime.difference(currentTime!).inDays;

  return doNotShowAgain;
}

bool checkDoNotShowAgainDateIsEmpty(DateTime? dateDoNotShowAgain) {
  // Add your function code here!
  bool isEmpty = false;
  if (dateDoNotShowAgain == null) {
    isEmpty = true;
  }
  return isEmpty;
}

DateTime addDoNotShowAgainDate(DateTime? currentDate) {
  // Add your function code here!

  return currentDate!.add(const Duration(days: 1));
}

int checkDiffDate(
  DateTime? doNotShowDate,
  DateTime? currentDate,
) {
  // Add your function code here!
  //final now = DateTime.now();
  //final today = DateTime(now.year, now.month, now.day);
  //final yesterday = DateTime(now.year, now.month, now.day - 1);
  //final tomorrow = DateTime(now.year, now.month, now.day + 1);

  return DateTime(doNotShowDate!.year, doNotShowDate!.month, doNotShowDate!.day)
      .difference(
          DateTime(currentDate!.year, currentDate!.month, currentDate!.day))
      .inDays;
}

String showUserRef(DocumentReference? userRef) {
  // Add your function code here!

  return 'userRef is ${userRef}';
}

String checkDateWeekDay(DateTime? date) {
  // Add your function code here!
  return DateFormat('EEEE').format(date!);

  /// e.g Thursday
}

Color leadTimeRemainTextColor(
  int? timeRemain,
  Color? normalColor,
  Color? lastDayColor,
) {
  // Add your function code here!
  Color textColor = normalColor!;

  if (timeRemain == 0) {
    textColor = lastDayColor!;
  }

  return textColor;
}

List<String> checkLeadChannel(List<String>? leadChannelList) {
  // Add your function code here!
  List<String> leadChannelListFinal = [];
  for (var i = 0; i < leadChannelList!.length; i++) {
    if (i == 0) {
      leadChannelListFinal.add(leadChannelList[i]);
    } else {
      if (leadChannelListFinal.contains(leadChannelList[i]) == false) {
        leadChannelListFinal.add(leadChannelList[i]);
      }
    }
  }
  return leadChannelListFinal;
}

Color leadChannelLabelColor(
  List<String>? leadChannelList,
  List<Color>? labelColorFirebase,
  int? index,
) {
  // Add your function code here!
  Color labelColor;

  if (leadChannelList![index!] == 'Lead Survey') {
    labelColor = labelColorFirebase![0];
  } else if (leadChannelList![index!] == 'Lead Telesale') {
    labelColor = labelColorFirebase![1];
  } else if (leadChannelList![index!] == 'Lead Agent') {
    labelColor = labelColorFirebase![2];
  } else if (leadChannelList![index!] == 'Lead GSB') {
    labelColor = labelColorFirebase![3];
  } else if (leadChannelList![index!] == 'Lead Vloan') {
    labelColor = labelColorFirebase![4];
  } else {
    labelColor = labelColorFirebase![5];
  }

  return labelColor;
}

String greetingTextSuperApp(String? nickname) {
  // Add your function code here!
  return 'สวัสดี คุณ${nickname}';
}

List<String> reverseList(List<String>? somethingList) {
  // Add your function code here!
  //List<String> reverseList = somethingList!.reversed;
  return somethingList!.reversed.toList();
}

Color leadDetailCardColor(
  List<String>? callStatus,
  int? index,
  Color? notCallColor,
  Color? callColor,
  Color? inAppCallColor,
  List<String>? leadIDInAppCallStatus,
  String? leadID,
) {
  // Add your function code here!
  Color cardColor = notCallColor!; //white

  if (callStatus![index!] != 'NEW') {
    cardColor = callColor!; //light orange
  } else if (leadIDInAppCallStatus!.contains(leadID) == true) {
    cardColor = inAppCallColor!; //light yellow
  }

  return cardColor;
}

String leadDetailCardColorForStatus(
  List<String>? callStatus,
  int? index,
  List<String>? leadIDInAppCallStatus,
  String? leadID,
) {
  // Add your function code here!
  String status = 'WHITE'; //white

  if (callStatus![index!] != 'NEW') {
    status = 'ORANGE'; //light orange
  } else if (leadIDInAppCallStatus!.contains(leadID) == true) {
    status = 'YELLOW'; //light yellow
  }

  return status;
}

List<String> setCallingStatus(
  List<String>? callStatusList,
  int? index,
) {
  // Add your function code here!
  callStatusList![index!] = 'Called';

  return callStatusList;
}

bool checkLeadIdCalledInApp(
  List<String>? leadIdCalledStatusList,
  String? leadId,
) {
  // Add your function code here!

  return leadIdCalledStatusList!.contains(leadId!);
}

String profileServiceDuration(
  String? year,
  String? month,
  String? day,
) {
  // Add your function code here!

  return '$year $month $day';
}

String profileShowNickName(String? nickname) {
  // Add your function code here!

  return '($nickname)';
}

List<String> checkLeadIDInAppAndLeadID(
  List<String>? leadIDInAppCalled,
  List<String>? leadIDList,
  List<String>? callStatusList,
) {
  // Add your function code here!
  for (var i = 0; i < callStatusList!.length; i++) {
    if (callStatusList[i] != 'NEW') {
      if (leadIDInAppCalled!.contains(leadIDList![i])) {
        leadIDInAppCalled.removeWhere((item) => item == leadIDList[i]);
      }
    }
  }

  return leadIDInAppCalled!;
}

String leadCalledStatusText(String? leadCardColorForStatus) {
  // Add your function code here!
  String statusText = 'งง';
  if (leadCardColorForStatus! == 'WHITE') {
    statusText = 'ยังไม่ได้โทร';
  } else if (leadCardColorForStatus! == 'ORANGE') {
    statusText = 'โทรและมีการบันทึกแล้ว';
  } else if (leadCardColorForStatus! == 'YELLOW') {
    statusText = 'โทรแต่ยังไม่บันทึกระบบลีด';
  }

  return statusText;
}

String dailySplashPageText(
  List<String>? splashPageTextList,
  String? day,
) {
  // Add your function code here!
  int dayNumber = 0;

  if (day! == 'Tuesday') {
    dayNumber = 1;
  } else if (day! == 'Wednesday') {
    dayNumber = 2;
  } else if (day! == 'Thursday') {
    dayNumber = 3;
  } else if (day! == 'Friday') {
    dayNumber = 4;
  } else if (day! == 'Saturday') {
    dayNumber = 5;
  } else if (day! == 'Sunday') {
    dayNumber = 6;
  }

  return splashPageTextList![dayNumber];
}

Color leadChannelAmountCardColor(
  String? leadChannelName,
  List<Color>? firebaseColor,
) {
  // Add your function code here!
  Color cardChannelColor;

  if (leadChannelName == 'Lead Survey') {
    cardChannelColor = firebaseColor![0];
  } else if (leadChannelName == 'Lead Telesale') {
    cardChannelColor = firebaseColor![1];
  } else if (leadChannelName == 'Lead Agent') {
    cardChannelColor = firebaseColor![2];
  } else if (leadChannelName == 'Lead GSB') {
    cardChannelColor = firebaseColor![3];
  } else {
    cardChannelColor = firebaseColor![4];
  }

  return cardChannelColor;
}

List<int> setLeadChannelAmount(List<String>? leadChannelList) {
  // Add your function code here!
  List<int> leadChannelAmountList = [0, 0, 0, 0]; //Survey,Telesale,Agent,GSB
  for (var i = 0; i < leadChannelList!.length; i++) {
    if (leadChannelList[i] == 'Lead Survey') {
      leadChannelAmountList[0]++;
    } else if (leadChannelList[i] == 'Lead Telesale') {
      leadChannelAmountList[1]++;
    } else if (leadChannelList[i] == 'Lead Agent') {
      leadChannelAmountList[2]++;
    } else if (leadChannelList[i] == 'Lead GSB') {
      leadChannelAmountList[3]++;
    }
  }

  return leadChannelAmountList;
}

List<int> resetLeadChannelAmount() {
  // Add your function code here!
  List<int> resetList = [0, 0, 0, 0];

  return resetList;
}

String helloDailyRandomText(List<String>? dailyTextFirebase) {
  // Add your function code here!

  return dailyTextFirebase![math.Random().nextInt(dailyTextFirebase.length)];
}

String introPageTextButton(int? introPageIndex) {
  // Add your function code here!
  String text = 'ต่อไป';
  if (introPageIndex == 3) {
    text = 'เริ่มใช้งาน';
  }

  return text;
}

bool checkFormServiceUrl(String? formServiceUrl) {
  // Add your function code here!
  return formServiceUrl!.contains('spreadsheets');
}
