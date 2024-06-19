import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getUserLocation(LatLng? userLocation) {
  String userLatLng = '${userLocation!.latitude},${userLocation.longitude}';
  return userLatLng;
}

String showNumberWithCommaWithDot(String? number) {
  // Add your function code here!
  List<String> numberSplit = number!.split('.');
  // Check if the input is null or empty

  double? parsedNumber = 0.00;
  if (number.contains('.')) {
    if (numberSplit[1].length > 1) {
      parsedNumber = double.tryParse(
          '${numberSplit[0]}.${numberSplit[1][0]}${numberSplit[1][1]}');
    } else {
      parsedNumber = double.tryParse('${numberSplit[0]}.${numberSplit[1]}0');
    }
  } else {
    parsedNumber = double.tryParse(number + '.00');
  }

  // Parse the input string to a double

  // Check if parsing was successful

  // Format the double as a string with two decimal places
  if (parsedNumber != null) {
    // Format the number with two decimal places
    String formattedNumber = parsedNumber.toStringAsFixed(2);

    // Use regular expression to add commas
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';

    // Format the number with commas and print
    String result = formattedNumber.replaceAllMapped(reg, mathFunc);
    return (result!);
  } else {
    return ("0.00");
  }
}

List<String>? combine2List(
  List<String>? list1,
  List<String>? list2,
) {
  List<String> listString = [];

  for (int i = 0; i < list1!.length; i++) {
    listString.add('[${list1![i]}] ${list2![i]}');
  }

  return listString; // Join the list elements into a single string
}

List<String>? returnValueSaveCallCollection(
  List<String>? list1,
  List<String>? list2,
  String? dropdown1Input,
) {
  List<String> listString = [];

  // Check if dropdown1Input is not null before using it in the loop
  if (dropdown1Input != null) {
    for (int i = 0; i < list1!.length; i++) {
      // Use == to compare the values, not the lists themselves
      if (list1[i] == dropdown1Input) {
        listString.add('${list2![i]}');
        // Perform your desired action here
      }
    }
  }

  return listString; // Join the list elements into a single string
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

List<String> returnvalueBooleanToString(
  List<bool>? somethingList1,
  List<String>? somethingList2,
  bool? searchValue,
) {
  List<String> mappedList = [];

  for (int i = 0; i < somethingList1!.length; i++) {
    if (searchValue! == somethingList2![i]) {
      mappedList.add(somethingList2![i]);
    }
  }

  return mappedList;
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

List<String>? returnValueSaveCallCollectionCopy(
  List<String>? remgCode,
  List<String>? remDetCode,
  String? dropdown1Input,
) {
  List<String> listString = [];

  for (int i = 0; i < remgCode!.length; i++) {
    if (remgCode[i] == dropdown1Input) {
      listString.add(remDetCode![i]);
    }
  }

  return listString; // Join the list elements into a single string
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
  return '${materialNameList![index!]}';
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

String? checkLeaveCheckinType(
  List<String>? leaveStartDate,
  List<String>? leaveEndDate,
  String? currentDate,
  List<String>? leaveType,
  List<String>? subLeaveType,
) {
  if (leaveStartDate!.length == 0) {
    return 'ไม่มีวันหยุด';
  } else {
    for (int i = 0; i < leaveStartDate!.length; i++) {
      if (DateTime.parse(leaveStartDate![i])
              .isBefore(DateTime.parse(currentDate!)) &&
          DateTime.parse(leaveEndDate![i])
              .isAfter(DateTime.parse(currentDate!))) {
        return '${leaveType![i]}${subLeaveType![i]}';
      } else if (DateTime.parse(leaveStartDate![i]) ==
              DateTime.parse(currentDate!) ||
          DateTime.parse(leaveEndDate![i]) == DateTime.parse(currentDate!)) {
        return '${leaveType![i]}${subLeaveType![i]}';
      }
    }
    return 'ไม่มีวันหยุด';
  }
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
  int? leadAge,
) {
  // Add your function code here!
  //leadCreatedTime = DateTime.parse("2022-09-20 10:00:00");
  DateTime leadCreatedTime = DateTime.parse(leadCreatedTimeTextList![index!]);

  DateTime leadFinalTime = leadCreatedTime.add(Duration(days: leadAge!));
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

int convertDynamicListToFirstIntValue(List<dynamic>? dynamicList) {
  List<int> outputList = List<int>.from(dynamicList!);

  return outputList[0];
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
  bool? isLeaving,
  String? leaveType,
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
        holidayList!.contains(date) ||
        isLeaving!) {
      statusText = 'วันหยุด';
      if (holidayList!.contains(date)) {
        holidayIndex = holidayList.indexOf(date);
        statusText = holidayNameList![holidayIndex];
      } else if (isLeaving!) {
        statusText = leaveType!;
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
        holidayList!.contains(date) ||
        isLeaving!) {
      statusText = 'วันหยุด';

      if (holidayList!.contains(date)) {
        holidayIndex = holidayList.indexOf(date);
        statusText = holidayNameList![holidayIndex];
      } else if (isLeaving!) {
        statusText = leaveType!;
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
  bool? isLeaving,
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
        holidayList!.contains(date) ||
        isLeaving!) {
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
        holidayList!.contains(date) ||
        isLeaving!) {
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
  if (brandNameList!.indexOf(brandNameTextField!) == -1) {
    return '999999';
  }

  return brandIDList![brandNameList!.indexOf(brandNameTextField!)];
}

String? dateToBEDateCopy(String? inputDate) {
  List<String> dateSplitList = inputDate!.split('/');
  int yearOutput = int.parse(dateSplitList[2]) + 543;

  return '${dateSplitList[0]}/${dateSplitList[1]}/${yearOutput}';
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

int leaveTypeToCanLeaveSince(
  String? leaveTypeDropdown,
  List<String>? leaveListAllowDay,
  List<int>? leaveListAllowInt,
) {
  // Add your function code here!
  int index = leaveListAllowDay!.indexOf('$leaveTypeDropdown');
  int result = leaveListAllowInt![index];
  // if (leaveTypeDropdown == 'ลาป่วย') {
  //   result = -7;
  // }
  // if (leaveTypeDropdown == 'ลากิจ') {
  //   result = 1;
  // }
  // if (leaveTypeDropdown == 'ลาพักร้อน') {
  //   result = 7;
  // }
  // if (leaveTypeDropdown == 'ลาคลอด') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาอุปสมบท') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาไม่โดยรับค่าตอบแทน') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาทำหมัน') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาเพื่อรับราชการทหาร') {
  //   result = 14;
  // }

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

String? imgPathListToStringCopy2(List<String>? imgPathList) {
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
  DateFormat dateFormat = new DateFormat('yyyy-MM-dd');
  // Loop through each day between the start and end dates

  for (int i = 0; i < holidayList!.length; i++) {
    // Check if the current day is a Sunday
    if (dateFormat.parse(holidayList[i]).isAfter(startDate!) &&
        dateFormat.parse(holidayList[i]).isBefore(endDate!)) {
      numHoliday++;
    }
  }

  return numHoliday;
}

bool? checkYearLeave(DateTime? startDate) {
  int year = startDate!.year;

  if (year == 2024 || year == 2023) {
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

  if ((text!.length == 9 || text.length == 10) && (text![0] == "0")) {
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
  if (number == 'null') {
    return '0.00';
  }

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

String? getFirstLastNameFromFullName(
  String? fullName,
  String? nameType,
) {
  String nameOutput = '';
  String firstName = '';
  String lastName = '';

  if (fullName!.split(' ').length > 2) {
    firstName = fullName!.split(' ')[0];
    for (int i = 1; i < fullName!.split(' ').length; i++) {
      if (i == 1) {
        lastName = fullName!.split(' ')[1];
      } else {
        lastName = lastName + ' ' + fullName!.split(' ')[i];
      }
    }
  } else {
    firstName = fullName!.split(' ')[0];
    lastName = fullName!.split(' ')[1];
  }

  if (nameType! == 'first_name') {
    nameOutput = firstName;
  } else {
    nameOutput = lastName;
  }

  return nameOutput;
}

String generateBranchViewMapLink(String? recordID) {
  // http://27.254.207.150:90/vloan_remark.html?id=7E72LN4914M3
  // https://pt.swpfin.com/bv/branchview_route.html?start=${branchLocation!}&?end=${coordinate!}&?branch=${branch!}&?id=${recordID}

  // return '<a target="_blank" href="http://27.254.207.150:90/vloan_remark.html?id=${recordID!}" title="${remark!}">คลิกที่นี่</a>';

  // String url = '';
  // int imgAmount = imgUrl!.length;
  // if (imgUrl!.length > 0) {
  //   for (int i = 0; i < imgUrl!.length; i++) {
  //     if (i == imgUrl!.length - 1) {
  //       url = url + imgUrl![i];
  //     } else {
  //       url = url + imgUrl![i] + ',';
  //     }
  //   }
  // } else {
  //   url = 'no_img';
  // }

  // String result = url.replaceAll("&", "volley5544");
  //start=${branchLocation!}&end=${coordinate!}&branch=${branch!}&
  //title="${remark!}"

  return '<a target="_blank" href="https://pt.swpfin.com/bv/branchview_route.php?id=${recordID!}">คลิกที่นี่</a>';
}

List<String>? createSomethingListWithNullValue(
  List<int>? statusCodeList,
  List<String>? inputList,
) {
  //List<int> inputStatusCode = List<int>.from(statusCodeList!);

  List<String> outputList = [];
  int indexOfInput = 0;

  for (int i = 0; i < statusCodeList!.length; i++) {
    if (statusCodeList![i] == 200) {
      outputList.add(inputList![indexOfInput]);
      indexOfInput++;
    } else {
      outputList.add('9999-01-01');
    }
  }

  return outputList;
}

List<int>? convertDynamicListToIntList(List<dynamic>? dynamicList) {
  List<int> outputList = List<int>.from(dynamicList!);

  return outputList;
}

List<DateTime>? stringlistToDateAD(List<String>? bcDateStrings) {
  List<DateTime> adDateTimes = [];

  for (String bcDateString in bcDateStrings!) {
    // Extract the year, month, and day components from the B.E. date string
    List<String> components = bcDateString!.split('-');
    int year = int.parse(components[0]);
    int month = int.parse(components[1]);
    int day = int.parse(components[2]);

    // Convert from B.E. to A.D. by subtracting 543 years
    year = year - 543;
    // Create a DateTime object using the A.D. components
    DateTime adDateTime = DateTime(year, month, day);

    adDateTimes.add(adDateTime);
  }

  return adDateTimes;
}

List<bool>? compareDate30(
  List<DateTime>? adDatetime,
  String? currentdate,
) {
  List<bool> result = [];
  DateTime current = DateTime.parse(currentdate!);
  for (int i = 0; i < adDatetime!.length; i++) {
    DateTime targetDate = adDatetime[i]!.subtract(Duration(days: 30));
    int comparison = current.compareTo(targetDate);
    if (comparison < 0) {
      result.add(false);
    } else {
      result.add(true);
    }
  }
  return result;
}

int? lengthMinus1(List<int>? list) {
  int result = list!.length;
  return result - 1;
}

List<bool>? changelistFalseToTrue(
  List<bool>? listFalse,
  int? index,
) {
  listFalse![index!] = true;
  return listFalse;
}

bool? compareListof2Date(
  List<DateTime>? firebaseList,
  List<DateTime>? currentList,
) {
  bool result = true;
  int comparison = 0;
  if (currentList!.length != firebaseList!.length) {
    return false;
  }

  for (int i = 0; i < currentList.length; i++) {
    int comparison = currentList[i].compareTo(firebaseList[i]);
    if (comparison != 0) {
      return false;
    }
  }
  return result;
}

String? censorString(
  String? inputString,
  int? visibledigit,
) {
  int totalLength = inputString!.length;

  if (totalLength <= visibledigit!) {
    return inputString;
  }

  String maskedString = '';

  for (int i = 0; i < totalLength - visibledigit!; i++) {
    maskedString += 'X';
  }

  maskedString += inputString!.substring(totalLength - visibledigit!);

  return maskedString;
}

String? splitDateintoStartDate(String? leavedate) {
  List<String> result = leavedate!.split(" - ");
  return result[0];
}

String? splitDateintoEndDate(String? leavedate) {
  List<String> result = leavedate!.split(" - ");
  return result[1];
}

LatLng? randomLatLng(
  double? latitude,
  double? longitude,
) {
  double radius = 30;
  // Calculate latitude range
  double latitudeRange = radius / 111000;

  // Calculate longitude range
  double longitudeRange =
      radius / (111000 * math.cos(latitude! * math.pi / 180));

  // Generate random latitude
  double randomLatitude = latitude! +
      math.Random().nextDouble() * 2 * latitudeRange -
      latitudeRange;

  // Generate random longitude
  double randomLongitude = longitude! +
      math.Random().nextDouble() * 2 * longitudeRange -
      longitudeRange;

  return LatLng(double.parse(randomLatitude.toStringAsFixed(6)),
      double.parse(randomLongitude.toStringAsFixed(6)));
}

bool? containWordinStringUrl(
  String? word,
  String? url,
) {
  if (url!.contains(word!)) {
    return true;
  } else {
    return false;
  }
}

String? checkType(String? target) {
  return target != null ? target.runtimeType.toString() : null;
}

bool? checkLeaveCheckin(
  List<String>? leaveStartDate,
  List<String>? leaveEndDate,
  String? currentDate,
) {
  if (leaveStartDate!.length == 0) {
    return false;
  } else {
    for (int i = 0; i < leaveStartDate!.length; i++) {
      if (DateTime.parse(leaveStartDate![i])
              .isBefore(DateTime.parse(currentDate!)) &&
          DateTime.parse(leaveEndDate![i])
              .isAfter(DateTime.parse(currentDate!))) {
        return true;
      } else if (DateTime.parse(leaveStartDate![i]) ==
              DateTime.parse(currentDate!) ||
          DateTime.parse(leaveEndDate![i]) == DateTime.parse(currentDate!)) {
        return true;
      }
    }
    return false;
  }
}

int? getLeadAgeIndex(
  List<String>? leadChannelList,
  String? leadChannel,
) {
  return leadChannelList!.indexOf(leadChannel!);
}

List<int>? setReportItemIndexList(String? pageNumber) {
  int page = int.parse(pageNumber!);
  //int firstIndex = (int.parse(pageNumber!)-1);
  int firstIndex = 0;
  int lastIndex = 9;
  List<int> indexList = [firstIndex, lastIndex];
  if (page == 1) {
    return indexList;
  } else {
    firstIndex = (((page - 1) * 10) + 1) - 1;
    lastIndex = (page * 10) - 1;
    indexList = [firstIndex, lastIndex];
    return indexList;
  }
}

List<String>? generate5CurrentPageNumber(
  String? currentPageNumber,
  int? maxPage,
) {
  List<String> pageSelectionList = [];
  int currentPage = int.parse(currentPageNumber!);

  if (currentPage == maxPage! || (currentPage + 1) == maxPage!) {
    for (int i = maxPage! - 4; i <= maxPage!; i++) {
      pageSelectionList.add('$i');
    }
  } else if (currentPage == 1 || currentPage == 2) {
    for (int i = 1; i <= 5!; i++) {
      pageSelectionList.add('$i');
    }
  } else {
    for (int i = currentPage - 2;
        i <= (currentPage + 2) && i <= maxPage!;
        i++) {
      pageSelectionList.add('$i');
    }
  }

  return pageSelectionList;
}

List<dynamic> reverseListJson(List<dynamic>? somethingList) {
  // Add your function code here!
  //List<String> reverseList = somethingList!.reversed;
  return somethingList!.reversed.toList();
}

bool? checkVisiblePreviousForwordButton(
  String? currentPage,
  String? buttonName,
  int? maxPage,
) {
  int currentSelected = int.parse(currentPage!);

  if (buttonName == 'previous_button') {
    if (currentSelected == 1) {
      return false;
    } else {
      return true;
    }
  } else {
    if (currentSelected == maxPage!) {
      return false;
    } else {
      return true;
    }
  }
}

int? getMaxPageNumber(int? reportItemNumber) {
  if (reportItemNumber! == 0) {
    return 1;
  }
  var maxPageNumber = reportItemNumber! / 10;
  int maxPage = 1;

  bool isInteger(num value) => value is int || value == value.roundToDouble();
  if (isInteger(maxPageNumber)) {
    // for (int i = 1; i <= maxPageNumber.toInt(); i++) {
    //   pageSelectionList.add('$i');
    // }
    maxPage = maxPageNumber.toInt();
  } else {
    // for (int i = 1; i <= (maxPageNumber.toInt() + 1); i++) {
    //   pageSelectionList.add('$i');
    // }
    maxPage = maxPageNumber.toInt() + 1;
  }

  return maxPage;
}

List<String>? generateMaxPageNumberList(int? maxPage) {
  List<String> pageSelectionList = [];

  for (int i = 1; i <= maxPage! && i <= 5; i++) {
    pageSelectionList.add('$i');
  }
  return pageSelectionList;
}

int stringToInteger(String? stringNumber) {
  return int.parse(stringNumber!);
}

List<String> generateLeadListByChannel(
  List<String>? leadChannelList,
  List<String>? leadDataList,
  String? channel,
) {
  List<String> dataOutput =
      List.generate(leadChannelList!.length, (index) => index)
          .where((index) => leadChannelList![index] == channel!)
          .map((index) => leadDataList![index])
          .toList();

  return dataOutput;
}

List<bool> generateTimeIsVisibleInChatPageList(int? totalMessage) {
  // int length = 5; // Specify the desired length of the list
  List<bool> visibleList = List.filled(totalMessage!, false);

  return visibleList;
}

bool? checkPhoneNumberInput(String? phoneNumber) {
  bool output = false;
  if (phoneNumber!.length == 10 &&
      phoneNumber![0] == '0' &&
      int.tryParse(phoneNumber!) != null) {
    output = true;
  }

  return output;
}

int checkStringLength(String? inputString) {
  return inputString!.length;
}

String generateBranchViewVloneRemark(
  int? urlLength,
  String? remark,
) {
  int endIndex = 300 - (urlLength! + 1);
  if (endIndex > remark!.length) {
    return remark!;
  }
  String output = remark!.substring(0, endIndex);

  return output;
}

List<dynamic>? test2DList() {
  List<String> listText = ['1', '2', '3'];
  List<String> listText1 = ['4', '5', '6'];
  List<String> listText2 = ['11', '22', '33'];
  List<dynamic> finalList = [listText1, listText2, listText];

  // List<String> insurerId = ['1','2','7];
  // List<String> insurerCode = ['111','222','777];
  // List<String> insurerName = ['ชับบ์','ทิพย์','ซัมติง']
  // List<dynamic> coverTypeId = [['1','2','3'],['2','3','5'],['1','2','3','4','5']];
  // List<dynamic> coverTypeName = [['ชั้น 1','ชั้น 2','ชั้น 2+'],['ชั้น 2','ชั้น 2+','ชั้น 3+'],['ชั้น 1','ชั้น 2','ชั้น 2+','ชั้น 3','ชั้น 3+']];

  return finalList;
}

String returnStringWithNoSpace(String? somethingText) {
  String textWithoutSpaces = somethingText!.replaceAll(' ', '');

  return textWithoutSpaces;
}

String searchMapValueFrom2List(
  List<String>? somethingList1,
  List<String>? somethingList2,
  String? searchValue,
) {
  // ใส่valueของ list2 เพื่อหาค่าที่mapกันของlist1

  Map<String, String> mappedList =
      Map.fromIterables(somethingList1!, somethingList2!);

  List<String> keysWithSearchValue = mappedList.entries
      .where((entry) => entry.value == searchValue!)
      .map((entry) => entry.key)
      .toList();

  if (keysWithSearchValue.length > 0) {
    return keysWithSearchValue[0];
  } else {
    return '';
  }
}

String? newCustomFunctionImagePath(FFUploadedFile? wow) {
  String eiei = '${wow!}';
  return eiei;
}

List<String> returnMappedListFrom2List(
  List<String>? somethingList1,
  List<String>? somethingList2,
  String? searchValue,
) {
  Map<String, String> mappedList =
      Map.fromIterables(somethingList1!, somethingList2!);

  List<String> keysWithSearchValue = mappedList.entries
      .where((entry) => entry.value == searchValue!)
      .map((entry) => entry.key)
      .toList();

  return keysWithSearchValue;
}

List<String>? generateInsuranceVehicleTypeDropdown(
  List<String>? vehicleTypeCodeList,
  List<String>? vehicleTypeTypeList,
  List<String>? vehicleTypeNameList,
) {
  List<String> vehicleTypeDropdown = [];

  for (int i = 0; i < vehicleTypeCodeList!.length; i++) {
    vehicleTypeDropdown.add(
        '${vehicleTypeCodeList![i]} ${vehicleTypeTypeList![i]}-${vehicleTypeNameList![i]}');
  }

  return vehicleTypeDropdown;
}

List<String>? returnMappedList(
  List<String>? somethingList1,
  List<String>? somethingList2,
  List<String>? searchedList,
) {
  List<String> output = [];

  for (int i = 0; i < searchedList!.length; i++) {
    output.add(somethingList1![somethingList2!.indexOf(searchedList![i])]);
  }

  return output;
}

List<String>? createListByItemNumber(
  String? value,
  int? listLength,
) {
  List<String> output = List.filled(listLength!, value!);

  return output;
}

bool? checkIsIntValue(String? value) {
  bool isInt = false;
  if (int.tryParse(value!) != null) {
    isInt = true;
  }

  return isInt;
}

String? getValueWithMappedList(
  List<String>? somethingList1,
  List<String>? somethingList2,
  String? searchValue,
) {
  return somethingList1![somethingList2!.indexOf(searchValue!)];
}

String? replaceUnderscrollToDat(String? originalString) {
  //String originalString = "example_string_with_underscores";
  String replacedString = originalString!.replaceAll('_', '-');

  return replacedString;
}

String? limitingString(
  String? originalString,
  int? maxCharacters,
) {
  String limitedString = '';

  if (maxCharacters! > originalString!.length) {
    limitedString = originalString!.substring(0, originalString!.length);
  } else {
    limitedString = originalString.substring(0, maxCharacters);
  }

  return limitedString;
}

bool? checkIsStringLengthInLength(
  String? inputString,
  int? length,
) {
  bool isInLength = false;

  if (inputString!.length <= length!) {
    isInLength = true;
  }

  return isInLength;
}

List<String>? randomItemList(List<String>? originalList) {
  originalList!.shuffle();
  List<String> randomList = originalList!;

  return randomList;
}

List<String>? returnInsuranceBasicInsurerList(
  List<String>? originalList1,
  List<String>? originalList2,
  List<String>? selectedList,
) {
  // find index of originalList1
  List<String> outputList = [];
  for (int i = 0; i < selectedList!.length; i++) {
    outputList.add(originalList1![originalList2!.indexOf(selectedList![i])]);
  }

  return outputList;
}

FFUploadedFile? returnFileUploadedNull() {
  return null;
}

List<String>? ganerateYearList(
  int? start,
  int? end,
) {
  List<String> yearList = [];

  for (int year = start!; year <= end!; year++) {
    yearList.add(year.toString());
  }

  return yearList;
}

List<String>? generateListFromSingleString(String? text) {
  List<String> listOutput = [];
  listOutput.add(text!);

  return listOutput;
}

String? generateVehicelUsedTesxt(
  List<String>? vehicleTypeCodeList,
  List<String>? vehicleTypeTypeList,
  List<String>? vehicleTypeNameList,
  String? vehicleTypeCode,
) {
  String type =
      vehicleTypeTypeList![vehicleTypeCodeList!.indexOf(vehicleTypeCode!)];
  String name =
      vehicleTypeNameList![vehicleTypeCodeList!.indexOf(vehicleTypeCode!)];

  return '${vehicleTypeCode!} ${type}-${name}';
}

String? stringToImgPath(String? stringImageLink) {
  return stringImageLink!;
}

List<String> returnListInList(
  List<dynamic>? mainList,
  int? index,
) {
  List<String> outputList = List<String>.from(mainList![index!]);
  return outputList;
}

List<String>? generateSelectedInsurerList(
  List<String>? insurerDisplayNameList,
  List<String>? insurerNameList,
  List<String>? insurerNameSelected,
) {
  List<String> outputList = [];

  for (int i = 0; i < insurerNameSelected!.length; i++) {
    outputList.add(insurerDisplayNameList![
        insurerNameList!.indexOf(insurerNameSelected![i])]);
  }

  return outputList;
}

List<bool>? sortingBoolListByOrder(
  List<bool>? boolList,
  List<int>? orderList,
) {
  List<bool> outputList = [];

  for (int i = 0; i < orderList!.length; i++) {
    outputList.add(boolList![orderList!.indexOf(i + 1)]);
  }

  return outputList;
}

String? convertDoubleTextToIntText(String? doubleTextInput) {
  if (doubleTextInput! == '-') {
    return '0';
  }

  double input = double.parse(doubleTextInput!);
  int intOutput = input.toInt();

  return '$intOutput';
}

double? changeToDouble(String? input) {
  if (double.tryParse(input!) != null) {
    return double.tryParse(input!);
  } else {
    return 0.0;
  }
}

String? roundStringTo2(String? originalString) {
// Parse the string as a double
  double originalNumber = double.parse(originalString!);

// Round the number to two decimal places
  String roundedNumber = '${double.parse(originalNumber.toStringAsFixed(2))}';

  return roundedNumber; // This will print 1.38 as a double
}

List<String>? removeDupeInList(List<String>? inputList) {
  // Convert the list to a set to remove duplicates
  Set<String> uniqueSet = Set<String>.from(inputList!);

  // Convert the set back to a list
  List<String> result = uniqueSet.toList();

  return result;
}

int? checkSameValueAmount(
  List<String>? leadChannelList,
  List<String>? leadSystemList,
) {
  int sameValueAmount = 0;

  for (int i = 0; i < leadChannelList!.length; i++) {
    if (leadChannelList![i] == 'Lead Telesale' &&
        leadSystemList![i] == 'Lead_Telesale') {
      sameValueAmount++;
    }
  }

  return sameValueAmount;
}

int? countTheValueInList(
  List<String>? somethingList,
  String? value,
) {
  int count = somethingList!.where((item) => item == value!).length;

  //print('The count of $targetValue is: $count');
  return count;
}

List<String>? createLeadCustomerList(
  List<String>? leadChannelList,
  List<String>? leadTeleCustomerList,
  List<String>? leadSystemList,
  List<String>? leadManagementCustomerList,
) {
  List<String> outputList = [];
  int leadTeleListIndex = 0;
  int leadManagementListIndex = 0;

  for (int i = 0; i < leadChannelList!.length; i++) {
    if (leadChannelList![i] == 'Lead Telesale') {
      if (leadSystemList![i] == 'Lead_Telesale') {
        outputList.add(leadTeleCustomerList![leadTeleListIndex]);
        leadTeleListIndex++;
      } else {
        outputList.add(leadManagementCustomerList![leadManagementListIndex]);
        leadManagementListIndex++;
      }
    } else {
      outputList.add('-');
    }
  }

  return outputList;
}

String? showCensorPhoneNumber(String? phoneNumber) {
  if (phoneNumber!.length == 10) {
    return '${phoneNumber![0]}${phoneNumber![1]}${phoneNumber![2]}-${phoneNumber![3]}${phoneNumber![4]}${phoneNumber![5]}-XXXX';
  } else {
    return '-';
  }
}

bool? containsValueInDataTypeList(
  List<AdminRoleGroupStruct>? dataTypeList,
  String? value,
  String? menuName,
) {
  for (int i = 0; i < dataTypeList!.length; i++) {
    if (dataTypeList![i].visibleMenuName.contains(menuName!)) {
      if (dataTypeList![i].employeeId.contains(value!)) {
        return true;
      }
    }
  }
  return false;
}

List<String> returnMapListFromBoolList(
  List<String>? somethingList1,
  List<bool>? somethingList2,
  bool? searchValue,
) {
  List<String> mappedList = [];

  for (int i = 0; i < somethingList1!.length; i++) {
    if (searchValue! == somethingList2![i]) {
      mappedList.add(somethingList1![i]);
    }
  }

  return mappedList;
}

List<bool>? createFalseListByItemNumber(
  bool? value,
  int? listLength,
) {
  List<bool> output = List.filled(listLength!, value!);

  return output;
}

List<String>? combine3List(
  List<String>? list1,
  List<String>? list2,
  List<String>? list3,
  String? dropdown1Input,
) {
  List<String> listString = [];

  // Check if dropdown1Input is not null before using it in the loop
  if (dropdown1Input != null) {
    for (int i = 0; i < list1!.length; i++) {
      // Use == to compare the values, not the lists themselves
      if (list1[i] == dropdown1Input) {
        listString.add('${list1[i]}${list2![i]}${list3![i]}');
        // Perform your desired action here
      }
    }
  }

  return listString; // Join the list elements into a single string
}

List<String>? generateListFromString(
  String? inputString,
  int? numberOfString,
) {
  List<String> myList = [];

  for (int i = 0; i < numberOfString!; i++) {
    myList.add(inputString!);
  }

  // พิมพ์ list ที่ได้
  return myList;
}

int? countTrueInBoolList(List<bool>? booleanList) {
  int trueCount = booleanList!.where((element) => element == true).length;

  return trueCount;
}

List<String>? returnMappedListFromBoolList(
  List<String>? somethingList1,
  List<bool>? somethingList2,
  bool? searchValue,
) {
  List<String> mappedList = [];

  for (int i = 0; i < somethingList1!.length; i++) {
    if (searchValue! == somethingList2![i]) {
      mappedList.add(somethingList1![i]);
    }
  }

  return mappedList;
}

List<String>? createdCallReasonCollectionDropdown(
  List<String>? remarkCodeList,
  List<String>? remarkDetCodeList,
  List<String>? remarkDetDescList,
  String? remarkCodeInput,
) {
  List<String> outputList = [];

  for (int i = 0; i < remarkCodeList!.length; i++) {
    if (remarkCodeInput! == remarkCodeList![i]) {
      outputList.add(
          '[${remarkCodeList![i]}][${remarkDetCodeList![i]}] ${remarkDetDescList![i]}');
    }
  }

  return outputList;
}

List<String>? generateStringListFromMappedValue(
  List<String>? somethingList1,
  List<String>? somethingList2,
  String? mappedValue,
) {
  List<String> outputList = [];

  for (int i = 0; i < somethingList1!.length; i++) {
    if (mappedValue! == somethingList2![i]) {
      outputList.add(somethingList1![i]);
    }
  }
  return outputList;
}

List<String>? generateNoneDupDataList(
  List<String>? somethingList1,
  List<String>? somethingList2,
) {
  List<String> tempList = [];

  for (int i = 0; i < somethingList2!.length; i++) {
    if (tempList.contains(somethingList2![i])) {
    } else {
      tempList.add(somethingList1![i]);
    }
  }

  return tempList;
}

String? showDateBE(String? inputDateStr) {
  DateTime inputDate = DateTime.parse(inputDateStr!);
  DateTime newDate =
      DateTime(inputDate!.year + 543, inputDate!.month, inputDate!.day);

  // Create a DateFormat instance with the Thai locale and B.E. era
//   final thaiDateFormat = DateFormat.yMd('th').add_y();
  final thaiDateFormat = DateFormat('dd/MM/y');

  // Format the date in Thai style with B.E. era
  String formattedDate = thaiDateFormat.format(newDate);

  print(formattedDate); // Output: "13 กุมภาพันธ์ 2539"
  return formattedDate;
}

String? return2ListIndexOfToString(
  List<String>? list1,
  List<String>? list2,
  String? keyword,
) {
  int? indexOfValue = list1!.indexOf(keyword!);

  if (indexOfValue != -1) {
    String? value = list2![indexOfValue];
    return value!; // Return value if index is valid
  } else {
    return null; // Return null if index is not found
  }
}

List<String>? sortingListByOrder(
  List<String>? somethingList,
  List<int>? orderList,
) {
  List<String> outputList = [];

  for (int i = 0; i < orderList!.length; i++) {
    outputList.add(somethingList![orderList!.indexOf(i + 1)]);
  }

  return outputList;
}

List<String>? imgPathListToStringList(List<String>? somethingList) {
  return somethingList!;
}

String? dateToBEDate(String? inputDate) {
  List<String> dateSplitList = inputDate!.split('/');
  int yearOutput = int.parse(dateSplitList[2]) + 543;

  return '${dateSplitList[0]}/${dateSplitList[1]}/${yearOutput}';
}

List<bool>? createFalseList(
  bool? value,
  int? listLength,
) {
  List<bool> output = List.filled(listLength!, value!);

  return output;
}

DateTimeRange? getFirstAndLastDayOfMonth(DateTime? currentDateTime) {
  DateTime now = currentDateTime!;
  DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
  DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

  DateTimeRange dateTimeRange =
      DateTimeRange(start: firstDayOfMonth, end: lastDayOfMonth);

  return dateTimeRange;
}

List<DateTime>? generateDateTimeList(DateTimeRange? timeStampRange) {
  List<DateTime> dateTimeList = [timeStampRange!.start, timeStampRange.end];
  return dateTimeList;
}

bool? lengthOfString(String? input) {
  return input!.length >= 8;
}

String? sumPaidAmount(
  String? overDue,
  String? remain624,
  String? remain401,
) {
  double overDueDouble = double.parse(overDue!); // Convert string to double
  double remain624Double = double.parse(remain624!);
  double remain401Double = double.parse(remain401!);

  double sum =
      overDueDouble + remain624Double + remain401Double; // Add the doubles

  String result = sum.toString(); // Convert the result back to string

  return result;
}

String? birthCheck(String? dateStr) {
  DateTime date = DateTime.parse(dateStr!);
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = (date.year + 543).toString();

  return '$day$month$year';
}

String? formatDateToSlash(String? inputDate) {
  if (inputDate == null || inputDate.isEmpty || inputDate == '-') {
    return '-';
  }

  // Parse the original date string to a DateTime object
  DateTime? dateTime;
  try {
    dateTime = DateTime.parse(inputDate);
  } catch (e) {
    // If parsing fails, return '-'
    return '-';
  }

  // Format the DateTime object to the desired format
  String formattedDateString = DateFormat('dd/MM/yyyy').format(dateTime!);

  // Return the formatted date string
  return formattedDateString;
}

String? stringToVideoPath(String? inputUrl) {
  return inputUrl!;
}
