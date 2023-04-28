import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

String getUserLocation(LatLng? userLocation) {
  String userLatLng = '${userLocation!.latitude},${userLocation.longitude}';
  return userLatLng;
}

double getLatLngBranchDouble(
  String? currentBranch,
  List<String>? latLngBranch,
  List<String>? allBranch,
) {
  int indexBranch = allBranch!.indexOf('$currentBranch');
  return double.parse(latLngBranch![indexBranch]);

  // Add your function code here!
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

String? imgPathListToStringCopy(List<String>? imgPathList) {
  if (imgPathList == null) {
    return "";
  }
  String namesString = '';

  for (String name in imgPathList!) {
    namesString += name + ',';
  }

// Remove the last comma
  namesString = namesString.substring(0, namesString.length - 1);

  return namesString;
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

bool checkRegionAreaNameCEOWelfare(
  List<String>? branchCodeList,
  List<String>? branchNameList,
  String? branchName,
) {
  return branchNameList!.contains(branchName!);
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

bool? checksaturdayDate(DateTime? startDate) {
  if (startDate!.weekday == 6) {
    return true;
  } else {
    return false;
  }
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

String checkindifTime(
  DateTime? checkinTime,
  DateTime? checkoutTime,
  int? difTime,
) {
  // Add your function code here!
  //leadCreatedTime = DateTime.parse("2022-09-20 10:00:00");
  int? h, m, s;
  int difTime = checkinTime!.difference(checkoutTime!).inSeconds;
  difTime = difTime - 3600;
  h = difTime ~/ 3600;

  m = ((difTime - h * 3600)) ~/ 60;

  s = difTime - (h * 3600) - (m * 60);
  String result = "$h:$m:$s";
  return result;
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
    if (dateDoNotShowAgain.difference(currentDate!).inDays <= 0) {
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

List<String> createLeadPhone2List(
  List<String>? leadChannelList,
  List<String>? leadTelePhone2List,
) {
  List<String> phone2List = [];
  int leadTeleListIndex = 0;

  for (int i = 0; i < leadChannelList!.length; i++) {
    if (leadChannelList![i] == 'Lead Telesale') {
      phone2List.add(leadTelePhone2List![leadTeleListIndex]);
      leadTeleListIndex++;
    } else {
      phone2List.add('-');
    }
  }

  return phone2List;
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
  String text = '';
  if (year! != '0 ปี') {
    text = '$text$year ';
  }
  if (month! != '0 เดือน') {
    text = '$text$month ';
  }
  if (day! != '0 วัน') {
    text = '$text$day';
  }

  return text;
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

String leadCalledStatusText(
  String? leadCardColorForStatus,
  String? leadCalledStatus,
  String? leadCalledStatusReason,
) {
  // Add your function code here!
  String statusText = 'งง';
  if (leadCardColorForStatus! == 'WHITE') {
    statusText = 'ยังไม่ได้โทร';
  } else if (leadCardColorForStatus! == 'ORANGE') {
    //statusText = 'โทรและมีการบันทึกแล้ว';
    statusText = '${leadCalledStatus!} ${leadCalledStatusReason!}';
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

Color? getKpiWelfareStatusTextColor(
  String? percentKpiWelfare,
  List<Color>? gaugeColorList,
  String? maxWelfareTarget,
) {
  Color statusColor = Colors.transparent;

  if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.67) {
    //statusText = 'ซุปเปอร์ไซย่า!';
    statusColor = gaugeColorList![4];
  } else if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.556) {
    //statusText = 'แข็งแกร่ง!';
    statusColor = gaugeColorList![3];
  } else if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.5) {
    //statusText = 'ผ่าน';
    statusColor = gaugeColorList![2];
  } else if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.45) {
    //statusText = 'เกือบผ่าน';
    statusColor = gaugeColorList![1];
  } else {
    //statusText = 'ไม่ผ่าน';
    statusColor = gaugeColorList![0];
  }

  return statusColor;
}

String userLatitude(LatLng? currentLocation) {
  // Add your function code here!
  return '${currentLocation!.latitude}';
}

String userLongitude(LatLng? currentLocation) {
  // Add your function code here!
  return '${currentLocation!.longitude}';
}

String positionAgeText(
  String? positionAgeYear,
  String? positionAgeMonth,
  String? positionAgeDay,
) {
  // Add your function code here!
  String text = '';
  if (positionAgeYear! != '0 ปี') {
    text = '$text$positionAgeYear ';
  }
  if (positionAgeMonth! != '0 เดือน') {
    text = '$text$positionAgeMonth ';
  }
  if (positionAgeDay! != '0 วัน') {
    text = '$text$positionAgeDay';
  }

  return text;
}

String checkInTextBtn(String? flag) {
  String i = "";
  if (flag == '0') {
    i = 'เข้างาน';
  } else if (flag == '1') {
    i = 'ออกงาน';
  }
  return i;
}

Color checkinColorBtn(
  String? flag,
  Color? checkinColor,
  Color? checkoutColor,
) {
  Color i = Colors.black;
  if (flag == '0') {
    i = checkinColor!;
  } else if (flag == '1') {
    i = checkoutColor!;
  }
  return i;
}

Color checkinColor(DateTime? checkinTime) {
  return Colors.green;
}

LatLng mergeBranchLatLong(
  String? branchLat,
  String? branchLong,
) {
  return LatLng(double.parse('$branchLat'), double.parse('$branchLong'));
  // Add your function code here!
}

LatLng getLatLngBranch(
  String? currentBranch,
  List<String>? latBranch,
  List<String>? lngBranch,
  List<String>? allBranch,
) {
  int indexBranch = allBranch!.indexOf('$currentBranch');
  return LatLng(double.parse(latBranch![indexBranch]),
      double.parse(lngBranch![indexBranch]));
  // Add your function code here!
}

double getCurrentRadius(
  String? currentBranch,
  List<String>? allBranch,
  List<String>? allRadius,
) {
  int indexBranch = allBranch!.indexOf('$currentBranch');
  return double.parse(allRadius![indexBranch]);

  // Add your function code here!
}

int? getWelfareLastMonthIndex(List<String>? monthList) {
  int index = 0;

  if (monthList![0] == 'lastmonth') {
    index = 0;
  } else {
    index = 1;
  }
  return index;
}

List<String> imgPathToString(List<String>? firebaseImgPathList) {
  // Add your function code here!

  return firebaseImgPathList!;
}

List<String> createCheckinStatusDateList(
  List<String>? actionList,
  List<String>? dateList,
) {
  // Add your function code here!
  List<String> newList = [];

  for (var i = 0; i < actionList!.length; i++) {
    if (actionList[i] == 'เข้างาน') {
      newList.add(dateList![i]);
    }
  }

  return newList;
}

List<String> createCheckinStatusTimeInList(
  List<String>? actionList,
  List<String>? timeList,
) {
  // Add your function code here!
  List<String> newList = [];

  for (var i = 0; i < actionList!.length; i++) {
    if (actionList[i] == 'เข้างาน') {
      newList.add(timeList![i]);
    }
  }

  return newList;
}

List<String> createCheckinStatusTimeOutList(
  List<String>? actionList,
  List<String>? timeList,
) {
  // Add your function code here!
  List<String> newList = [];

  for (var i = 0; i < actionList!.length; i++) {
    if (actionList[i] == 'ออกงาน') {
      newList.add(timeList![i]);
    }
  }

  return newList;
}

String getCheckinStatusText(
  String? checkinTime,
  String? checkoutTime,
  String? date,
  String? employeeLevel,
  List<String>? holidayList,
  int? index,
  bool? isThisMonth,
  List<String>? holidayNameList,
) {
  // Add your function code here!
  //DateFormat('EEEE').format(date!);
  //DateTime dt1 = DateTime.parse("2018-02-27 10:47:01");
  String statusText = 'Status';
  int holidayIndex = 0;

  DateTime formCheckinTime = DateTime.parse("$date 08:40");
  DateTime formCheckoutTime = DateTime.parse("$date 17:30");

  DateTime formCheckinTimeBranch = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranch = DateTime.parse("$date 16:30");

  DateTime formCheckinTimeBranchSat = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranchSat = DateTime.parse("$date 15:30");

  // for(int i = 0; i < holidayList!.length; i++){
  //       if(holidayList[i] == date){
  //         isHoliday = true;
  //         break;
  //       }
  //     }

  if (employeeLevel == 'HO') {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday' ||
        DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date)) {
      statusText = 'วันหยุด';
      if (holidayList!.contains(date)) {
        holidayIndex = holidayList.indexOf(date);
        statusText = holidayNameList![holidayIndex];
      }
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else if (index == 0 && isThisMonth!) {
        statusText = 'รอลงเวลา';
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusText = 'ขาดงาน';
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusText = 'ลงเวลาไม่ครบ';
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else {
        statusText = 'งง';
      }
    }
  } else {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date)) {
      statusText = 'วันหยุด';

      if (holidayList!.contains(date)) {
        holidayIndex = holidayList.indexOf(date);
        statusText = holidayNameList![holidayIndex];
      }
    } else if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday') {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else if (index == 0 && isThisMonth!) {
        statusText = 'รอลงเวลา';
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusText = 'ขาดงาน';
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusText = 'ลงเวลาไม่ครบ';
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else {
        statusText = 'งง';
      }
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else if (index == 0 && isThisMonth!) {
        statusText = 'รอลงเวลา';
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusText = 'ขาดงาน';
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusText = 'ลงเวลาไม่ครบ';
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else {
        statusText = 'งง';
      }
    }
  }

  return statusText;
}

String imgPathtoString(String? imgPath) {
  return "$imgPath";
}

Color getCheckinStatusColor(
  String? checkinTime,
  String? checkoutTime,
  String? date,
  String? employeeLevel,
  List<Color>? colorList,
  List<String>? holidayList,
  int? index,
  bool? isThisMonth,
) {
  // Add your function code here!
  //DateFormat('EEEE').format(date!);
  //DateTime dt1 = DateTime.parse("2018-02-27 10:47:01");
  Color statusColor = Colors.transparent;

  DateTime formCheckinTime = DateTime.parse("$date 08:40");
  DateTime formCheckoutTime = DateTime.parse("$date 17:30");

  DateTime formCheckinTimeBranch = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranch = DateTime.parse("$date 16:30");

  DateTime formCheckinTimeBranchSat = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranchSat = DateTime.parse("$date 15:30");

  if (employeeLevel == 'HO') {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday' ||
        DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date)) {
      statusColor = colorList![0];
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else if (index == 0 && isThisMonth!) {
        statusColor = Colors.transparent;
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusColor = colorList![1];
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusColor = colorList![2];
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else {
        statusColor = colorList![2];
      }
    }
  } else {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date)) {
      statusColor = colorList![0];
    } else if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday') {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else if (index == 0 && isThisMonth!) {
        statusColor = Colors.transparent;
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusColor = colorList![1];
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusColor = colorList![2];
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else {
        statusColor = colorList![2];
      }
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else if (index == 0 && isThisMonth!) {
        statusColor = Colors.transparent;
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusColor = colorList![1];
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusColor = colorList![2];
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else {
        statusColor = colorList![2];
      }
    }
  }

  return statusColor;
}

List<String> teleSearchCarModel(
  String? brandID,
  List<String>? brandIDList,
  List<String>? modelName,
) {
  // Add your function code here!
  List<String> modelNameOutput = [];
  for (var i = 0; i < modelName!.length; i++) {
    if (brandIDList![i] == brandID) {
      modelNameOutput.add(modelName[i]);
    }
  }
  return modelNameOutput;
}

String getTeleBrandID(
  String? brandNameTextField,
  List<String>? brandIDList,
  List<String>? brandNameList,
) {
  // Add your function code here!
  //brandNameList!.indexOf(brandNameTextField!)
  return brandIDList![brandNameList!.indexOf(brandNameTextField!)];
}

String garageTypeToEng(String? garageThai) {
  if (garageThai == 'ซ่อมอู่') {
    return 'COMPANY';
  } else {
    return 'DEALER';
  }
  // Add your function code here!
}

List<String> coverTypeToCode(List<String>? coverTypeChosen) {
  List<String> result = [];
  for (var i = 0; i < coverTypeChosen!.length; i++) {
    if (coverTypeChosen[i] == 'ชั้น 1') {
      result.add('VMI1');
    } else if (coverTypeChosen[i] == 'ชั้น 2') {
      result.add('VMI2');
    } else if (coverTypeChosen[i] == 'ชั้น 2+') {
      result.add('VMI2+');
    } else if (coverTypeChosen[i] == 'ชั้น 3') {
      result.add('VMI3');
    } else if (coverTypeChosen[i] == 'ชั้น 3+') {
      result.add('VMI3+');
    }
  }
  return result;
}

List<String> companyNameToID(
  List<String>? companyId,
  List<String>? companyName,
  List<String>? companyNameChosen,
) {
  List<String> result = [];
  int index;
  for (int i = 0; i < companyNameChosen!.length; i++) {
    index = companyName!.indexOf(companyNameChosen[i]);
    result.add(companyId![index]);
  }
  return result;
  // Add your function code here!
}

String getModelCode(
  String? brandID,
  List<String>? modelNameList,
  List<String>? modelBrandIDList,
  String? modelName,
  List<String>? modelCodeList,
) {
  // Add your function code here!

  for (var i = 0; i < modelNameList!.length; i++) {
    if (brandID == modelBrandIDList![i] && modelName == modelNameList![i]) {
      return modelCodeList![i];
    }
  }
  return 'not found model code';
}

String getVehicleUsage(String? useType) {
  // Add your function code here!
  String vehicleUsage = '';

  if (useType! == '110รถยนต์นั่ง') {
    vehicleUsage = '110';
  }
  if (useType == '210รถยนต์โดยสาร') {
    vehicleUsage = '210';
  }
  if (useType == '320รถยนต์บรรทุก') {
    vehicleUsage = '320';
  }

  return vehicleUsage;
}

String getGrossAct(
  String? grossTotal,
  String? actAmount,
) {
  // Add your function code here!
  double sumValue = double.parse(grossTotal!) + double.parse(actAmount!);
  print(sumValue);

  return '$sumValue';
}

List<String> filterInsurer(
  String? filterIn,
  List<String>? filterlist,
  List<String>? searchlist,
) {
  List<int> index = [];
  List<String> filterlast = [];

  for (int i = 0; i < filterlist!.length; i++) {
    if (filterIn == filterlist[i]) {
      index.add(i);
    }
  }
  for (int i = 0; i < index.length; i++) {
    filterlast.add(searchlist![index[i]]);
  }
  return filterlast;
  // Add your function code here!
}

List<String> filterSumInsured(
  double? sumInsured,
  List<String>? filterlist,
  List<String>? searchlist,
) {
  List<int> index = [];
  List<String> filterlast = [];

  for (int i = 0; i < filterlist!.length; i++) {
    if (sumInsured! >= double.parse(filterlist[i])) {
      index.add(i);
    }
  }
  for (int i = 0; i < index.length; i++) {
    filterlast.add(searchlist![index[i]]);
  }
  return filterlast;
  // Add your function code here!
}

String showGarageType(String? garageType) {
  // Add your function code here!
  String text = 'ประเภทซ่อม';

  if (garageType! == 'COMPANY') {
    text = 'ซ่อมอู่';
  } else {
    text = 'ซ่อมห้าง';
  }

  return text;
}

String showCoverTypeThai(String? coverTypeEng) {
  // Add your function code here!
  String result = "";

  if (coverTypeEng == 'VMI1') {
    result = 'ชั้น 1';
  } else if (coverTypeEng == 'VMI1') {
    result = 'ชั้น 2';
  } else if (coverTypeEng == 'VMI2+') {
    result = 'ชั้น 2+';
  } else if (coverTypeEng == 'VMI3') {
    result = 'ชั้น 3';
  } else if (coverTypeEng == 'VMI3+') {
    result = 'ชั้น 3+';
  }
  return result;
}

String showNumberWithComma(String? number) {
  // Add your function code here!
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  String result = '$number'.replaceAllMapped(reg, mathFunc);

  return result;
}

String checkNullVariable(List<String>? checkInStatusList) {
  // Add your function code here!
  String text = 'wow';
  String? text1 = null;

  if (checkInStatusList![0] == null) {
    text = 'this value is null!';
  }
  if (text1! == null) {
    text = 'text1 is null!';
  }

  return text;
}

String showCheckinDate(String? date) {
  // Add your function code here!
  //DateFormat('EEEE').format(date!)
  String weekday = 'week_day';
  String month = 'month';

  if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Monday') {
    weekday = 'จ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Tuesday') {
    weekday = 'อ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Wednesday') {
    weekday = 'พ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Thursday') {
    weekday = 'พฤ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Friday') {
    weekday = 'ศ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Saturday') {
    weekday = 'ส.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Sunday') {
    weekday = 'อา.';
  } else {
    weekday = 'week_day?';
  }

  if (DateFormat('MMMM').format(DateTime.parse(date)) == 'January') {
    month = 'ม.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'February') {
    month = 'ก.พ.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'March') {
    month = 'มี.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'April') {
    month = 'เม.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'May') {
    month = 'พ.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'June') {
    month = 'มิ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'July') {
    month = 'ก.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'August') {
    month = 'ส.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'September') {
    month = 'ก.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'October') {
    month = 'ต.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'November') {
    month = 'พ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'December') {
    month = 'ธ.ค.';
  }

  return DateFormat(
    '$weekday dd $month yy',
  ).format(DateTime.parse(date));
}

double getDoubleFromStringList(
  List<String>? somethingList,
  int? index,
) {
  // Add your function code here!
  return double.parse('${somethingList![index!]}');
}

double stringToDouble(String? stringNumber) {
  // Add your function code here!

  return double.parse('${stringNumber!}');
}

String checkMeanBudgetKPI(
  String? actualValue,
  String? targetBudget,
) {
  // Add your function code here!
  String text = 'ไม่ถึงเป้า';

  if (double.parse('${actualValue!}') >= double.parse('${targetBudget!}')) {
    text = 'ถึงเป้า';
  }

  return text;
}

String showMonthYearKPIPage(String? date) {
  // Add your function code here!
  String date1 = '${date!}-01';

  return DateFormat('MMMM yyyy', 'th').format(DateTime.parse(date1));
}

String stringDoubleToStringInt(String? doubleText) {
  // Add your function code here!
  double text = double.parse(doubleText!);

  return '${text.round()}';
}

String removeCommaFromNumText(String? numberText) {
  // Add your function code here!
  String result = numberText!.replaceAll(RegExp('[^A-Za-z0-9.]'), '');

  return result;
}

List<String> leaveWorkCheck(
  List<String>? leaveWorkIdList,
  List<String>? leaveWorkDayList,
) {
  /*  List<String>? lWL = [];
   List<String>? lWD = [];
  for(int i =0;i<leaveWorkIdList!.length;i++){
    if(leaveWorkIdList[i] == '1'){
      lWD.add(leaveWorkIdList[i]);
      lWL.add(leaveWorkDayList![i]);
    }
  }*/
  List<String> result = [];
  int n = 1;
  for (int i = 0; i < leaveWorkIdList!.length; i++) {
    if (int.parse(leaveWorkIdList[i]) == i + n) {
      result.add(leaveWorkDayList![i]);
    } else {
      result.add('0.0');
      i--;
      n++;
    }
  }
  return result;
  // Add your function code here!
}

String endLeaveDayCalString(
  DateTime? startLeaveDay,
  int? dayLeaveNumber,
  String? leaveTime,
) {
  String result = '';
  if (leaveTime == 'ลาเต็มวัน') {
    DateTime endLeaveDay =
        startLeaveDay!.add(Duration(days: dayLeaveNumber! - 1));
    // Add your function code here!
    result = DateFormat('yyyy-MM-dd').format(endLeaveDay);
  } else {
    // Add your function code here!
    result = DateFormat('yyyy-MM-dd').format(startLeaveDay!);
  }
  return result;
}

String startLeaveDayString(DateTime? startLeaveDayInput) {
  // Add your function code here!
  String result = DateFormat('yyyy-MM-dd').format(startLeaveDayInput!);
  return result;
}

int leaveTypeToCanLeaveSince(String? leaveTypeDropdown) {
  // Add your function code here!
  int result = 0;
  if (leaveTypeDropdown == 'ลาป่วย') {
    result = -7;
  }
  if (leaveTypeDropdown == 'ลากิจ') {
    result = 1;
  }
  if (leaveTypeDropdown == 'ลาพักร้อน') {
    result = 7;
  }
  if (leaveTypeDropdown == 'ลาคลอด') {
    result = 14;
  }
  if (leaveTypeDropdown == 'ลาอุปสมบท') {
    result = 14;
  }
  if (leaveTypeDropdown == 'ลาไม่โดยรับค่าตอบแทน') {
    result = 14;
  }
  if (leaveTypeDropdown == 'ลาทำหมัน') {
    result = 14;
  }
  if (leaveTypeDropdown == 'ลาเพื่อรับราชการทหาร') {
    result = 14;
  }

  return result;
}

DateTime startLeaveCalendar(
  DateTime? currentDay,
  int? canLeaveSince,
) {
  int n = 0;
  // Add your function code here!
  DateTime startCalendar = currentDay!.add(Duration(days: n + canLeaveSince!));
  return startCalendar;
}

DateTime endLeaveCalendarDate(
  DateTime? startDate,
  int? leaveCount,
) {
  // Add your function code here!
  if (leaveCount == 0) {
    DateTime endDateCalendar1 = startDate!;
    return endDateCalendar1;
  } else {
    DateTime endDateCalendar2 = startDate!.add(Duration(days: leaveCount! - 1));
    return endDateCalendar2;
  }
}

String leaveTypeToLeaveId(String? leaveType) {
  // Add your function code here!
  String result = '';
  if (leaveType == 'ลาป่วย') {
    result = '1';
  }
  if (leaveType == 'ลากิจ') {
    result = '2';
  }
  if (leaveType == 'ลาพักร้อน') {
    result = '3';
  }
  if (leaveType == 'ลาอุปสมบท') {
    result = '4';
  }
  if (leaveType == 'ลาเพื่อรับราชการทหาร') {
    result = '5';
  }
  if (leaveType == 'ลาคลอด') {
    result = '6';
  }
  if (leaveType == 'ลาทำหมัน') {
    result = '7';
  }
  if (leaveType == 'ลาโดยไม่รับค่าตอบแทน') {
    result = '8';
  }
  if (leaveType == 'ลาออก') {
    result = '9';
  }
  return result;
}

Color getLinearGaugeColor(
  List<Color>? colorList,
  int? index,
) {
  // Add your function code here!
  Color gaugeColor = colorList![0];

  if (index == 1) {
    gaugeColor = colorList[index!];
  } else if (index == 2) {
    gaugeColor = colorList[index!];
  }

  return gaugeColor;
}

List<String>? createDefaultActualValueKPIList() {
  List<String> actualValueList = ['0.0', '0.0', '0.0'];
  return actualValueList;
}

List<String>? createDefaultProductTypeKPIListCopy() {
  List<String> productTypeList = ['M', 'CTV', 'HL'];
  return productTypeList;
}

bool? allowLeaveDay(
  String? leaveDayType,
  List<String>? quotaLeaveDay,
  double? leaveDayInput,
) {
  if (leaveDayType == null || quotaLeaveDay == null || leaveDayInput == null)
    return false;

  final leaveTypes = {
    'ลาป่วย': 0,
    'ลากิจ': 1,
    'ลาพักร้อน': 2,
    'ลาอุปสมบท': 3,
    'ลาเพื่อรับราชการทหาร': 4,
    'ลาคลอด': 5,
    'ลาทำหมัน': 6,
    'ลาโดยไม่รับค่าตอบแทน': 7,
  };

  final index = leaveTypes[leaveDayType];

  if (index == null) return false;

  try {
    final quota = double.parse(quotaLeaveDay[index]);

    switch (index) {
      case 2:
        return quota >= leaveDayInput && leaveDayInput <= 5;
      default:
        return quota >= leaveDayInput;
    }
  } catch (e) {
    return false;
  }
}

String? leaveTimeToNumber(
  String? leaveTimeInput,
  String? leaveDayInput,
) {
  String result = '';
  if (leaveTimeInput == 'ลาเต็มวัน') {
    result = leaveDayInput!;
  } else {
    result = '0.5';
  }
  return result;
}

bool? allowFileInput(
  String? leaveTypeInput,
  double? leaveDayInput,
) {
  bool result = true;
  if (leaveTypeInput == 'ลาป่วย' && leaveDayInput! >= 3) {
    result = true;
  } else if (leaveTypeInput == 'ลาป่วย' && leaveDayInput! < 3) {
    result = false;
  } else if (leaveTypeInput == 'ลาทำหมัน') {
    result = true;
  } else if (leaveTypeInput == 'ลาเพื่อรับราชการทหาร') {
    result = true;
  } else {
    result = false;
  }
  return result;
}

Color? getNotificationCardColor(
  Color? notiNotReadCardColor,
  bool? thisNotiIsRead,
) {
  Color notiCardColor = Colors.white;

  if (thisNotiIsRead == false) {
    notiCardColor = notiNotReadCardColor!;
  }

  return notiCardColor;
}

bool? checkLeaveDays(double? leaveDaysInput) {
  bool result = true;

  if (leaveDaysInput! <= 0) {
    result = false;
  } else {
    result = true;
  }
  return result;
}

bool? checkLeaveDayNumber(String? leaveDayNumber) {
  return leaveDayNumber!.contains('.');
}

dynamic createNotificationBody(
  String? body,
  String? title,
  String? icon,
) {
  return {"body": body!, "title": title!, "icon": icon!};
}

dynamic createNotificationDataBody(String? type) {
  return {"type": type!};
}

String? splittingString(String? leaveDate) {
  List<String> splitDate = leaveDate!.split("-");

  return splitDate[0];
}

List<String>? removeLeaveworkFromList(List<String>? leaveTypeList) {
  leaveTypeList!.remove('ลาออก');
  return leaveTypeList;
}

String? imgPathListToString(List<String>? imgPathList) {
  if (imgPathList == null) {
    return "";
  }
  String namesString = '';

  for (String name in imgPathList!) {
    namesString += name + ',';
  }

// Remove the last comma
  namesString = namesString.substring(0, namesString.length - 1);

  return namesString;
}

List<String>? leaveStringImgToImgPathList(String? leaveStringImg) {
  List<String> listStr = leaveStringImg!.split(',').toList();
  return listStr;
}

bool? checkMonthLeave(
  String? monthName,
  String? leaveDate,
) {
  if (monthName == null || leaveDate == null) return null;

  // Use a map to store the month names and their abbreviations
  var monthAbbreviations = {
    'มกราคม': 'ม.ค',
    'กุมภาพันธ์': 'ก.พ',
    'มีนาคม': 'มี.ค.',
    'เมษายน': 'เม.ย.',
    'พฤษภาคม': 'พ.ค.',
    'มิถุนายน': 'มิ.ย.',
    'กรกฎาคม': 'ก.ค.',
    'สิงหาคม': 'ส.ค.',
    'กันยายน': 'ก.ย.',
    'ตุลาคม': 'ต.ค.',
    'พฤศจิกายน': 'พ.ย.',
    'ธันวาคม': 'ธ.ค.'
  };

  // Get the abbreviation for the given month name
  String? monthShortName = monthAbbreviations[monthName];
  if (monthShortName == null) return null;

  // Check if the leave date contains the month abbreviation
  return leaveDate.contains(monthShortName);
}

String? checkMonthLeaveCopy(
  String? monthName,
  String? leaveDate,
) {
  if (monthName == null || leaveDate == null) return null;

  // Use a map to store the month names and their abbreviations
  var monthAbbreviations = {
    'มกราคม': 'ม.ค',
    'กุมภาพันธ์': 'ก.พ',
    'มีนาคม': 'มี.ค.',
    'เมษายน': 'เม.ย.',
    'พฤษภาคม': 'พ.ค.',
    'มิถุนายน': 'มิ.ย.',
    'กรกฎาคม': 'ก.ค.',
    'สิงหาคม': 'ส.ค.',
    'กันยายน': 'ก.ย.',
    'ตุลาคม': 'ต.ค.',
    'พฤศจิกายน': 'พ.ย.',
    'ธันวาคม': 'ธ.ค.'
  };

  // Get the abbreviation for the given month name
  String? monthShortName = monthAbbreviations[monthName];
  if (monthShortName == null) return null;

  // Check if the leave date contains the month abbreviation
  return monthShortName;
}

String? currentTimeToMonthThai(DateTime? currentTime) {
  String? month = DateFormat.MMMM().format(currentTime!);
  Map<String, String> monthNames = {
    'January': 'มกราคม',
    'February': 'กุมภาพันธ์',
    'March': 'มีนาคม',
    'April': 'เมษายน',
    'May': 'พฤษภาคม',
    'June': 'มิถุนายน',
    'July': 'กรกฎาคม',
    'August': 'สิงหาคม',
    'September': 'กันยายน',
    'October': 'ตุลาคม',
    'November': 'พฤศจิกายน',
    'December': 'ธันวาคม',
  };

  String? monthNameInThai = monthNames[month];
  return monthNameInThai;
}

String? leaveStatusToText(String? leaveStatus) {
  if (leaveStatus == '1') {
    return 'รอการอนุมัติ';
  } else if (leaveStatus == '2') {
    return 'รอการอนุมัติ';
  } else if (leaveStatus == '3') {
    return 'อนุมัติการลาเรียบร้อย';
  } else if (leaveStatus == '4') {
    return 'ไม่อนุมัติการลา';
  } else if (leaveStatus == '0') {
    return 'ยกเลิกการลา';
  }
}

bool? checkEtcInCheckbox(List<String>? checkboxSelect) {
  return checkboxSelect!.contains('อื่นๆ');
}

String? findIndexOfList(
  List<String>? list1,
  List<String>? list2,
  String? input,
) {
  int targetIndex = list1!.indexOf(input!);
  return (list2![targetIndex]);
}

int? checkSundayBetween2Day(
  DateTime? startDate,
  DateTime? endDate,
) {
  int numSundays = 0;
  endDate = endDate!.add(Duration(days: 1));
  // Loop through each day between the start and end dates
  for (DateTime date = startDate!;
      date.isBefore(endDate);
      date = date.add(Duration(days: 1))) {
    // Check if the current day is a Sunday
    if (date.weekday == 7) {
      numSundays++;
    }
  }

  return numSundays;
}

Color? getResignCardColor(
  String? leaveName,
  Color? resignCardColor,
) {
  Color cardColor = Colors.white;

  if (leaveName! == 'ลาออก') {
    cardColor = resignCardColor!;
  }

  return cardColor;
}

bool? checkSundayDate(DateTime? startDate) {
  if (startDate!.weekday == 7) {
    return true;
  } else {
    return false;
  }
}

String? leaveCountMinusSunday(
  String? leaveCountDay,
  int? sundayNum,
  int? holidayNum,
) {
  var intCount = int.parse('$leaveCountDay');
  int ans = intCount - sundayNum! - holidayNum!;
  String result = '$ans';
  return result;
}

bool? checkHolidayDate(
  DateTime? startDate,
  List<String>? holidayDatelist,
) {
  int numHoliday = 0;
  DateFormat dateFormat = new DateFormat('yyyy-MM-dd');
  String startDateStr = dateFormat.format(startDate!);

  for (int i = 0; i < holidayDatelist!.length; i++) {
    if (startDateStr == holidayDatelist[i]) {
      numHoliday++;
    }
  }
  if (numHoliday > 0) {
    return true;
  } else {
    return false;
  }
}

int? checkHoliDayBetween2Day(
  DateTime? startDate,
  DateTime? endDate,
  List<String>? holidayList,
) {
  int numHoliday = 0;
  endDate = endDate!.add(Duration(days: 1));
  DateFormat dateFormat = new DateFormat('yyyy-MM-dd');
  // Loop through each day between the start and end dates

  for (int i = 0; i < holidayList!.length; i++) {
    // Check if the current day is a Sunday
    if (dateFormat
            .parse(holidayList[i])
            .isAfter(startDate!.add(Duration(days: -1))) &&
        dateFormat.parse(holidayList[i]).isBefore(endDate)) {
      numHoliday++;
    }
  }

  return numHoliday;
}

bool? checkYearLeave(DateTime? startDate) {
  int year = startDate!.year;

  if (year == 2022 || year == 2023) {
    return true;
  } else {
    return false;
  }
}

List<String>? leaveTypeToList1(String? leaveType) {
  List<String> result = [];
  result.add(leaveType!);
  return result;
}

bool? checkPhoneNumber10(String? phoneNumber) {
  if (phoneNumber!.length <= 10) {
    return true;
  } else {
    return false;
  }
}

String? showMatVideoInList(
  List<String>? materialVideoList,
  int? index,
) {
  // Add your function code here!
  return materialVideoList![index!];
}

bool? checkSickLeaveIsBeforeCurrentDate(
  DateTime? currentDate,
  DateTime? leaveDate,
) {
  if (leaveDate!.isBefore(currentDate!)) {
    return true;
  } else {
    return false;
  }
}

String? getDateFormat(DateTime? leaveEndDate) {
  return DateFormat('yyyy-MM-dd').format(leaveEndDate!);
  ;
}

List<String>? sortStringList(List<String>? stringList) {
  stringList!.sort();
  return stringList;
}

String? combineStringFromList(List<String>? stringList) {
  String text = '';

  for (int i = 0; i < stringList!.length; i++) {
    if (i == 0) {
      text = stringList[i];
    } else {
      text = text + ',${stringList[i]}';
    }
  }

  return text;
}

bool checkPhoneNumberChar(String? text) {
  bool isPhoneNumber = false;

  if (text!.length == 9 || text.length == 10) {
    isPhoneNumber = true;
  }
  return isPhoneNumber;
}

bool checkEmailPattern(String? email) {
  return email!.contains('@');
}

List<String> splitStringToList(String? stringList) {
  List<String> listStr = stringList!.split(',').toList();
  return listStr;
}

String? getDateFormatAPIFromThaiFormat(String? thaiDate) {
  List<String> listStr = thaiDate!.split(' ').toList();
  //print(listStr);

  String dayThai = listStr[0].replaceAll(RegExp('[^A-Za-z0-9.ก-ฮะ-เ]'), '');
  String monthThai = listStr[1].replaceAll(RegExp('[^A-Za-z0-9.ก-ฮะ-เ]'), '');
  String yearThai = listStr[2].replaceAll(RegExp('[^A-Za-z0-9.ก-ฮะ-เ]'), '');

  //String? monthTH = monthThai;
  Map<String, String> monthNames = {
    'ม.ค.': '01',
    'ก.พ.': '02',
    'มี.ค.': '03',
    'เม.ย.': '04',
    'พ.ค.': '05',
    'มิ.ย.': '06',
    'ก.ค.': '07',
    'ส.ค.': '08',
    'ก.ย.': '09',
    'ต.ค.': '10',
    'พ.ย.': '11',
    'ธ.ค.': '12',
  };

  String? month = monthNames[monthThai];
  //print(month);

  String day = '';

  if (dayThai == '1') {
    day = '01';
  } else if (dayThai == '2') {
    day = '02';
  } else if (dayThai == '3') {
    day = '03';
  } else if (dayThai == '4') {
    day = '04';
  } else if (dayThai == '5') {
    day = '05';
  } else if (dayThai == '6') {
    day = '06';
  } else if (dayThai == '7') {
    day = '07';
  } else if (dayThai == '8') {
    day = '08';
  } else if (dayThai == '9') {
    day = '09';
  } else {
    day = dayThai;
  }

  int year = int.parse(yearThai) - 543;

  //print('$year-$month-$day');
  return '$year-$month-$day';
}

String? getKpiWelfareStatusText(
  String? percentKpiWelfare,
  String? percentTarget,
) {
  String statusText = 'status';

  if (double.parse(percentKpiWelfare!) >= double.parse(percentTarget!)) {
    statusText = 'ผ่าน';
    // } else if (double.parse(percentKpiWelfare!) >= 100.0) {
    //   statusText = 'ผ่าน';
    // } else if (double.parse(percentKpiWelfare!) >= 90.0) {
    //   statusText = 'ผ่าน';
    // } else if (double.parse(percentKpiWelfare!) >= 80.0) {
    //   statusText = 'ไม่ผ่าน';
  } else {
    statusText = 'ไม่ผ่าน';
  }

  return statusText;
}

List<String>? insurancePlan(String? planInsurance) {
  List<String>? PlanList = [];
  if (planInsurance == 'แผน 1') {
    PlanList = [
      '200,000',
      '200,000',
      '200,000',
      '20,000',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-'
    ];
  } else if (planInsurance == 'แผน 2') {
    PlanList = [
      '300,000',
      '300,000',
      '300,000',
      '30,000',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-'
    ];
  } else if (planInsurance == 'แผน 3') {
    PlanList = [
      '950,000',
      '950,000',
      '950,000',
      '50,000',
      '3,000',
      '6,000',
      '60,000',
      '3,000',
      '60,000',
      '2,500',
      '9,000',
      '9,000',
      '30,000',
      '2,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 4') {
    PlanList = [
      '950,000',
      '950,000',
      '950,000',
      '50,000',
      '10,000',
      '20,000',
      '100,000',
      '10,000',
      '100,000',
      '3,000',
      '15,000',
      '10,000',
      '100,000',
      '5,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 5') {
    PlanList = [
      '4,000,000',
      '4,000,000',
      '4,000,000',
      '50,000',
      '10,000',
      '20,000',
      '100,000',
      '10,000',
      '100,000',
      '3,000',
      '15,000',
      '10,000',
      '100,000',
      '5,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 6') {
    PlanList = [
      '8,000,000',
      '8,000,000',
      '8,000,000',
      '50,000',
      '10,000',
      '20,000',
      '100,000',
      '10,000',
      '100,000',
      '3,000',
      '15,000',
      '10,000',
      '100,000',
      '5,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 7') {
    PlanList = [
      '15,000,000',
      '15,000,000',
      '15,000,000',
      '50,000',
      '10,000',
      '20,000',
      '200,000',
      '10,000',
      '200,000',
      '3,500',
      '20,000',
      '12,000',
      '100,000',
      '6,500',
      '8,000'
    ];
  }
  return PlanList;
}

int? showMatIntInList(
  List<int>? materialIntList,
  int? index,
) {
  // Add your function code here!
  return materialIntList![index!];
}

String? leaveDateToStartLeaveDate(String? startLaveDate) {
  List<String> listStr = startLaveDate!.split(' - ').toList();
  return listStr[0];
}

bool? checkCurrentDateAfterStartDate(
  String? startDate,
  DateTime? currentDate,
) {
  DateTime parsedDate = DateTime.parse(startDate!);
  return (currentDate!.isBefore(parsedDate));
}

int? getWelfareMonthIndex(List<String>? monthList) {
  int index = 0;

  if (monthList![0] == 'currentmonth') {
    index = 0;
  } else {
    index = 1;
  }

  return index;
}

String? showMonthYearWelfareKpiPage(String? date) {
  return DateFormat('MMMM yyyy', 'th').format(DateTime.parse(date!));
}

String? getWelfareKpiDateLastMonth(String? date) {
  String text = 'text';

  if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'January') {
    text =
        'ธันวาคม ${int.parse(DateFormat('yyyy').format(DateTime.parse(date))) - 1}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'February') {
    text = 'มกราคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'March') {
    text = 'กุมภาพันธ์ ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'April') {
    text = 'มีนาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'May') {
    text = 'เมษายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'June') {
    text = 'พฤษภาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'July') {
    text = 'มิถุนายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'August') {
    text = 'กรกฎาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'September') {
    text = 'สิงหาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'October') {
    text = 'กันยายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'November') {
    text = 'ตุลาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'December') {
    text = 'พฤศจิกายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  }

  return text;
}

String? insurancePlanToThai(String? numberPlan) {
  String planThai = '';
  if (numberPlan == '01') {
    planThai = 'แผน 1';
  } else if (numberPlan == '02') {
    planThai = 'แผน 2';
  } else if (numberPlan == '04') {
    planThai = 'แผน 4';
  } else if (numberPlan == '05') {
    planThai = 'แผน 5';
  } else if (numberPlan == '06') {
    planThai = 'แผน 6';
  } else if (numberPlan == '07') {
    planThai = 'แผน 7';
  } else if (numberPlan == '03') {
    planThai = 'แผน 3';
  } else {
    planThai = '-';
  }
  return planThai;
}

bool? checkBirthday(
  String? birthdayFromAPI,
  String? currentDate,
) {
  DateFormat formatter = DateFormat('d/M');

  if (formatter.format(DateTime.parse(birthdayFromAPI!)) ==
      formatter.format(DateTime.parse(currentDate!))) {
    return true;
  } else {
    return false;
  }
}

String? getMaxValueWelfareKpi(String? percentTarget) {
  double text = double.parse(percentTarget!) * 2.0;
  return '$text';
}

List<String>? createContractKpiEmpIdList(List<String>? employeeList) {
  return employeeList!.toSet().toList();
}

List<int>? getContractKpiProductTypeIndex(
  List<String>? employeeIdListApi,
  String? employeeID,
) {
  List<int> index = [];
  for (int i = 0; i < employeeIdListApi!.length; i++) {
    if (employeeID! == employeeIdListApi![i]) {
      index.add(i);
    }
  }

  return index;
}

List<String> createEmployeeDropdown(
  List<String>? employeeNickname,
  List<String>? employeeBranch,
) {
  List<String> dropdown = [];

  for (int i = 0; i < employeeNickname!.length; i++) {
    dropdown.add('${employeeNickname![i]} (${employeeBranch![i]})');
  }

  return dropdown;
}

String? welfareCEOBranchText(
  String? dropdownBranch,
  String? regionName,
  String? areaName,
  String? branchDetail,
) {
  String text = 'status';

  if (dropdownBranch! == 'สาขา') {
    text = 'สาขา: ${branchDetail!}';
  } else if (dropdownBranch! == 'เขต') {
    text = 'เขต: ${areaName!}';
  } else if (dropdownBranch! == 'ภาค') {
    text = 'ภาค: ${regionName!}';
  }

  return text;
}

String getIndexRegionAreaCEOWelfare(
  List<String>? branchCodeList,
  List<String>? branchNameList,
  String? branchName,
) {
  return branchCodeList![branchNameList!.indexOf(branchName!)];
}

List<String> getRegionAreaNameCode(
  List<String>? branchName,
  List<String>? branchCode,
) {
  List<String> branchNameCode = [];

  for (int i = 0; i < branchName!.length; i++) {
    branchNameCode.add('(${branchCode![i]}) ${branchName![i]}');
  }

  return branchNameCode;
}

int getIndexOfSomethingList(
  List<String>? somethingList,
  String? somethingValue,
) {
  return somethingList!.indexOf(somethingValue!);
}

List<String>? increasedValueIntStringInList(
  List<String>? countCalledList,
  int? index,
  String? countCalledUpdate,
) {
  countCalledList![index!] = countCalledUpdate!;

  return countCalledList!;
}

LatLng? stringToLatLng(
  String? latitude,
  String? longitude,
) {
  // var latdouble = double.parse(latitude!);
  // var lngdouble = double.parse(longitude!);

  return LatLng(double.parse(latitude!), double.parse(longitude!));
}

double? currentLatLngDouble(
  LatLng? currentLocation,
  bool? isLatitude,
) {
  if (isLatitude! == true) {
    return currentLocation!.latitude;
  } else {
    return currentLocation!.longitude;
  }
}

List<String>? updateMatNameList(
  List<String>? materialNameList,
  int? index,
  String? value,
) {
  // Add your function code here!
  List<String> materialNameListUpdate = materialNameList!;
  materialNameListUpdate[index!] = value!;
  return materialNameListUpdate;
}

double? contrainerChange(double? contrainerHeight) {
  WidgetsFlutterBinding.ensureInitialized();
  double deviceTextScaleFactor =
      WidgetsBinding.instance!.window.textScaleFactor;
  return (contrainerHeight! * deviceTextScaleFactor);
}

List<String> createLeadName2List(
  List<String>? leadChannelList,
  List<String>? leadTeleName2List,
) {
  List<String> name2List = [];
  int leadTeleListIndex = 0;

  for (int i = 0; i < leadChannelList!.length; i++) {
    if (leadChannelList![i] == 'Lead Telesale') {
      name2List.add(leadTeleName2List![leadTeleListIndex]);
      leadTeleListIndex++;
    } else {
      name2List.add('-');
    }
  }

  return name2List;
}

String checkNullValueAndReturn(String? value) {
  String text = '';
  if (value! == 'null') {
    text = '-';
  } else {
    text = value!;
  }

  return text;
}

List<String>? checkLeadPhoneNumber(List<String>? leadPhoneList) {
  List<String> phoneList = [];

  for (int i = 0; i < leadPhoneList!.length; i++) {
    if (leadPhoneList![i].length >= 10) {
      phoneList.add(leadPhoneList![i].substring(0, 10));
    } else {
      phoneList.add('(เบอร์โทรไม่ถูก)');
    }
  }

  return phoneList!;
}

String? getLeadChannelCode(String? leadChannel) {
  List<String> list = leadChannel!.split(' ');

  //print(list);

  //print('${list[0]}_${list[1]}');

  return '${list[0]}_${list[1]}';
}

List<String>? convertIntListToStringList(List<int>? callStatusId) {
  List<String> list = [];

  for (int i = 0; i < callStatusId!.length; i++) {
    list.add('${callStatusId![i]}');
  }

  return list;
}

String? returnNumberWithComma2Decimal(String? number) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  String result = '${double.parse(number!).toStringAsFixed(2)}'
      .replaceAllMapped(reg, mathFunc);

  return result!;
}

String? returnAmountValueInList(
  String? value,
  List<String>? somethingList,
) {
  List<String> elements = somethingList!;
  var map = elements.fold<Map<String, int>>(
      {},
      (map, element) =>
          map..update(element, (value) => value + 1, ifAbsent: () => 1));

  var amount = map[value!] ?? 0;
//print(map["g"]);
  return '$amount';
}

int? checkLastIndexOfList(List<String>? somethingList) {
  int index = somethingList!.length - 1;
  return index;
}

List<String>? changeValueAtIndexSomethingList(
  List<String>? somethingList,
  int? index,
  String? value,
) {
  List<String> listOutput = somethingList!;

  listOutput[index!] = value!;

  return listOutput;
}

DateTime? parseStringToDatetime(String? datetimeStr) {
  return DateTime.parse(datetimeStr!);
}

String? thaipaiboonToEng(String? nameCampaign) {
  if (nameCampaign! == 'ครอบครัวสุขใจ X2') {
    return 'GroupFamily';
  } else if (nameCampaign! == 'อุ่นใจสบายกระเป๋า') {
    return 'GroupPocketEasy';
  } else {
    return 'GroupKoomSure';
  }
}

bool? checkIsHaveThisValueInList(
  List<String>? somethingList,
  String? value,
) {
  return somethingList!.contains(value!)!;
}

List<String>? containsWordInString(List<String>? campaignGroup) {
  List<String>? result = [];
  for (var i = 0; i < campaignGroup!.length; i++) {
    if (campaignGroup![i].contains("ครอบครัวสุขใจ X2")) {
      result!.add("ครอบครัวสุขใจ X2");
    } else if (campaignGroup![i].contains("พี่วินคุ้มชัวร์")) {
      result!.add("พี่วินคุ้มชัวร์");
    } else if (campaignGroup![i].contains("อุ่นใจสบายกระเป๋า")) {
      result!.add("อุ่นใจสบายกระเป๋า");
    } else {
      result!.add("อื่นๆ");
    }
  }
  return result;
}

String? showDateThaiFormat(String? dateString) {
  DateTime now = DateTime.parse(dateString!);
  DateFormat formatter = DateFormat('EEEE,d MMMM yyyy');
  String formatted = formatter.format(now);
  //print(formatted); // something like 2013-04-20

  return formatted;
}
