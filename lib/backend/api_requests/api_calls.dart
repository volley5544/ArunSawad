import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Spring Firebase Api Group Group Code

class SpringFirebaseApiGroupGroup {
  static String getBaseUrl() => 'https://4d69-223-27-201-20.ngrok-free.app';
  static Map<String, String> headers = {};
  static UploadFileFirebaseStorageApiCall uploadFileFirebaseStorageApiCall =
      UploadFileFirebaseStorageApiCall();
}

class UploadFileFirebaseStorageApiCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? multipartFile,
    String? uploadedFolderName = '',
    String? appName = '',
  }) async {
    final baseUrl = SpringFirebaseApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'uploadFileFirebaseStorageApi',
      apiUrl: '${baseUrl}/firebase-storage/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'multipartFile': multipartFile,
        'uploadedFolderName': uploadedFolderName,
        'appName': appName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Spring Firebase Api Group Group Code

class AuthenAPICall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? apiUrl = '1',
    String? fcmToken = '',
    String? uid = '',
    String? check = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "password": "${password}",
  "api_url": "${apiUrl}",
  "fcm_token": "${fcmToken}",
  "uid": "${uid}",
  "check": "${check}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'authenAPI',
      apiUrl: '${apiUrl}/api/login',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  static String? employeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.employee_id''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.branch_code''',
      ));
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class CheckInAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckInAPI',
      apiUrl: '${apiUrl}/api/send-data/check-in',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
}

class GetTimesheetAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetTimesheetAPI',
      apiUrl: '${apiUrl}/api/detail/timesheet',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].RecordId''',
      ));
  static String? jobType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Job_Type''',
      ));
  static String? clockIn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].ClockIn''',
      ));
  static int? latitude(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Latitude''',
      ));
  static int? longitude(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Longitude''',
      ));
  static dynamic? timesheetData(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data''',
      );
}

class GetApprovedAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? approvedTypes = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "approved_types": "${approvedTypes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getApprovedAPI',
      apiUrl: '${apiUrl}/api/leave/${approvedTypes}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? approvedID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedEmpID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedEmpName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveDoc(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedEmpTel(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? approvedLeaveCreateDate(dynamic response) =>
      (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? cancelBy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      ) as List?;
  static List<String>? reasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SendResignFormEmailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? leaveDocId = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "leave_doc_id": "${leaveDocId}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendResignFormEmailAPI',
      apiUrl: '${apiUrl}/api/leave/sendmail/${leaveDocId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? statusLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
}

class TimesheetDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? pageName = '',
    String? recordId = '',
    String? editCheck = '',
    String? remark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "page_name": "${pageName}",
  "RecordId": "${recordId}",
  "editCheck": "${editCheck}",
  "Remark": "${remark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TimesheetDetailAPI',
      apiUrl: '${apiUrl}/api/detail/${pageName}/${recordId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].RecordId''',
      ));
  static String? citizenID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].CitizenId''',
      ));
  static String? customerName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Customer_Name''',
      ));
  static String? landmark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Landmark''',
      ));
  static String? remark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Remark''',
      ));
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].Description''',
      ));
  static String? contNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].ContNo''',
      ));
  static String? assetID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data[:].AssetId''',
      ));
  static List<String>? matName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Material_Name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? matImg(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Img_Url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? material(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:]''',
        true,
      ) as List?;
  static String? marketingBranchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Branch_Code''',
      ));
  static String? marketingAreaDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Area_Description''',
      ));
  static String? marketingDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Detail''',
      ));
  static String? marketingRemark(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Remark''',
      ));
  static String? marketingRecordId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].RecordId''',
      ));
  static dynamic statusDescription(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status_desc''',
      );
}

class GetUserProfileAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? projectName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "project_name": "${projectName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserProfileAPI',
      apiUrl: '${apiUrl}/api/user-profile',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? profileEmployeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      ));
  static String? profileFullName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      ));
  static String? profileNickName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      ));
  static String? profileHiredDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      ));
  static String? profileServiceDurationYY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      ));
  static String? profileServiceDurationMM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      ));
  static String? profileServiceDurationDD(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      ));
  static String? profileArea(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      ));
  static String? profileRegion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      ));
  static String? profliePositionName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      ));
  static String? profileBranchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      ));
  static String? profileBirthDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static dynamic? profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static String? profilePositionAgeYY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.year''',
      ));
  static String? profilePositionAgeMM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.month''',
      ));
  static String? profilePositionAgeDD(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.day''',
      ));
  static String? profilePositionAgeCheck(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].checkPositionAge''',
      ));
  static String? profilePhoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].MobileNumber''',
      ));
  static String? profileFirstBossEmpID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeBefore''',
      ));
  static String? profileFirstBossName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameBefore''',
      ));
  static String? profileSecondBossEmpID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeAfter''',
      ));
  static String? profileSecondBossName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameAfter''',
      ));
  static String? profileLevel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Level''',
      ));
  static String? profileBranch(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Branch''',
      ));
  static String? insurancePlan(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].InsurancePlan''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchCode''',
      ));
  static String? department(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Department''',
      ));
  static String? profileRoleName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.UserRole[:].profile[:].role_name''',
      ));
}

class GetUserInsuranceLicenseCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserInsuranceLicense',
      apiUrl: '${apiUrl}/api/insurance/license-insurance-broker',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? jsonData(dynamic response) => getJsonField(
        response,
        r'''$.dataInfo''',
      );
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<int>? statusLayer2(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? messageLayer2(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeID(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].data[*].EmployeeID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].data[*].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? idCard(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].data[*].IDCard''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? licenseNumber(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].data[*].LicenseNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? startDate(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].data[*].IssuuedDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expireDate(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].data[*].ExpirationDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? data(dynamic response) => (getJsonField(
        response,
        r'''$.dataInfo[*].data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ActionUserAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'actionUserAPI',
      apiUrl: '${apiUrl}/api/action-user',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? profileEmployeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      ));
  static String? profileFullName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      ));
  static String? profileNickName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      ));
  static String? profileHiredDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      ));
  static String? profileServiceDurationYY(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      ));
  static String? profileServiceDurationMM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      ));
  static String? profileServiceDurationDD(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      ));
  static dynamic? profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static String? profileArea(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      ));
  static String? profileRegion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      ));
  static String? profliePositionName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      ));
  static String? profileBranchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      ));
  static String? profileBirthDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetLeadDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadDetailAPI',
      apiUrl: '${apiUrl}/api/lead/getlead',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? connectStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? dataStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.DataLeadInfo.status''',
      ));
  static List<String>? dataLeadID(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataFirstName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataPhoneNum(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataCallStatus(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].call_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataCreatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataLeadChannel(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].channel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataEmployeeID(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].employee_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataBranchCode(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataBranchName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? dataMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DataLeadInfo.message''',
      ));
  static String? dataLevel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.DataLeadInfo.level''',
      ));
  static String? connectionMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? countCalled(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].countCall''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstName2(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.first_name2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber2(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.phone_number2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastName2(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.last_name2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? descInfo(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info''',
        true,
      ) as List?;
  static List<String>? carVehicleName(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].car_vehicle_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? amountRequest(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].amount_request''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? statusReason(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].statusCallOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractStatus(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].StatusContract''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contractDate(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].contract_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? fullName2LeadManagement(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.customerName''',
        true,
      ) as List?;
  static List? lastName2LeadManagement(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.customerLastname''',
        true,
      ) as List?;
  static List? phoneNumber2LeadManagement(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.customerPhoneNumber''',
        true,
      ) as List?;
  static List<String>? leadSystem(dynamic response) => (getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].lead_system''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetWelfareKpiCurrentMonthAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWelfareKpiCurrentMonthAPI',
      apiUrl: '${apiUrl}/api/incentive/incentive-current-month',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      ));
  static String? branchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      ));
  static String? percentSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      ));
  static String? flagSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      ));
  static String? percentTarget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      ));
  static dynamic branchDetail(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_detail''',
      );
}

class GetWelfareKpiCEOAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? branchCode = '',
    String? branchType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "branchCode": "${branchCode}",
  "branchType": "${branchType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWelfareKpiCEOAPI',
      apiUrl: '${apiUrl}/api/branchkpi/incentive',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2CM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].status''',
      ));
  static String? messageLayer2CM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].message''',
      ));
  static int? statusLayer2LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.LastMonth[:].status''',
      ));
  static String? messageLayer2LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].message''',
      ));
  static String? branchCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchCode''',
      ));
  static String? branchNameLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchName''',
      ));
  static String? successPercentLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessPercent''',
      ));
  static String? succesFlagLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessFlag''',
      ));
  static String? targetSuccessLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].TargetPercent''',
      ));
  static String? regionCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionCode''',
      ));
  static String? regionNameLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionName''',
      ));
  static String? areaCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaCode''',
      ));
  static String? areaNameLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaName''',
      ));
  static String? branchCodeCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchCode''',
      ));
  static String? branchNameCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchName''',
      ));
  static String? successPercentCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessPercent''',
      ));
  static String? succesFlagCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessFlag''',
      ));
  static String? targetSuccessCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].TargetPercent''',
      ));
  static String? regionCodeCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionCode''',
      ));
  static String? regionNameCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionName''',
      ));
  static String? areaCodeCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaCode''',
      ));
  static String? areaNameCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaName''',
      ));
  static String? branchDetailCM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchDetail''',
      ));
  static String? branchDetailLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchDetail''',
      ));
}

class GetWelfareKpiLastMonthAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getWelfareKpiLastMonthAPI',
      apiUrl: '${apiUrl}/api/incentive/incentive-last-month',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      ));
  static String? branchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      ));
  static String? percentSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      ));
  static String? flagSuccess(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      ));
  static String? percentTarget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      ));
  static String? branchDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info[:].branch_detail''',
      ));
}

class LeaveDayAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LeaveDayAPI',
      apiUrl: '${apiUrl}/api/leave/leave-day',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? connectStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? connectionMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? dateInfo(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
        true,
      ) as List?;
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static List<String>? statusCheckCount(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].StatusCheckCount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? totalLeave(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].TotalLeave''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countLeave(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].CountLeave''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeDay(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].LeaveDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeId(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].LeaveID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
}

class LogoutAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'logoutAPI',
      apiUrl: '${apiUrl}/api/logout',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class SurveyAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? citizenId = '',
    String? customerName = '',
    String? landmark = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "CitizenId": "${citizenId}",
  "Customer_Name": "${customerName}",
  "Landmark": "${landmark}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SurveyAPI',
      apiUrl: '${apiUrl}/api/send-data/survey',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
}

class CollectionAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? citizenId = '',
    String? customerName = '',
    String? contNo = '',
    String? apiUrl = '',
    String? vLoanServer = '',
    String? urlImg = '',
    String? branchLocation = '',
    String? branchName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "CitizenId": "${citizenId}",
  "Customer_Name": "${customerName}",
  "ContNo": "${contNo}",
  "api_url": "${apiUrl}",
  "VLoan_Server": "${vLoanServer}",
  "url_img": "${urlImg}",
  "Branch_Location": "${branchLocation}",
  "Branch_Name": "${branchName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CollectionAPI',
      apiUrl: '${apiUrl}/api/send-data/collection',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
}

class CheckerAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? citizenId = '',
    String? customerName = '',
    String? contNo = '',
    String? apiUrl = '',
    String? vLoanServer = '',
    String? urlImg = '',
    String? branchLocation = '',
    String? branchName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "CitizenId": "${citizenId}",
  "Customer_Name": "${customerName}",
  "ContNo": "${contNo}",
  "api_url": "${apiUrl}",
  "VLoan_Server": "${vLoanServer}",
  "url_img": "${urlImg}",
  "Branch_Location": "${branchLocation}",
  "Branch_Name": "${branchName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckerAPI ',
      apiUrl: '${apiUrl}/api/send-data/checker',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
}

class GetMaterialAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMaterialAPI',
      apiUrl: '${apiUrl}/api/get-materials',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$[:].RecordId''',
      );
  static dynamic materialName(dynamic response) => getJsonField(
        response,
        r'''$[:].Material_Name''',
      );
  static dynamic imgUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].Img_Url''',
      );
}

class GetCheckinTimeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCheckinTimeAPI',
      apiUrl: '${apiUrl}/api/check-in/getdate-time',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$[:].RecordId''',
      );
  static dynamic materialName(dynamic response) => getJsonField(
        response,
        r'''$[:].Material_Name''',
      );
  static dynamic imgUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].Img_Url''',
      );
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? checkinDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.Date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkinTime(dynamic response) => (getJsonField(
        response,
        r'''$.info.Time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MarketingAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? apiUrl = '',
    String? branchCode = '',
    String? areaDescription = '',
    String? detail = '',
    String? materialRecordId = '',
    String? amount = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "api_url": "${apiUrl}",
  "Branch_Code": "${branchCode}",
  "Area_Description": "${areaDescription}",
  "Detail": "${detail}",
  "Material_RecordId": "${materialRecordId}",
  "Amount": "${amount}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MarketingAPI',
      apiUrl: '${apiUrl}/api/send-data/marketing',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
}

class NpaAPICall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? remark = '',
    String? uid = '',
    String? jobType = '',
    String? location = '',
    String? username = '',
    String? token = '',
    String? apiUrl = '',
    String? assetId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Description": "${description}",
  "Remark": "${remark}",
  "UID": "${uid}",
  "Job_Type": "${jobType}",
  "Location": "${location}",
  "Username": "${username}",
  "token": "${token}",
  "api_url": "${apiUrl}",
  "AssetId": "${assetId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'npaAPI',
      apiUrl: '${apiUrl}/api/send-data/survey-npa',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      ));
  static int? mainStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? recordID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      ));
}

class OpsAPICall {
  static Future<ApiCallResponse> call({
    String? coordinate = '',
    String? branchCode = '',
    String? assetRef = '',
    String? assetType = '',
    String? assetDetail = '',
    String? remark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "coordinate": "${coordinate}",
  "branch_code": "${branchCode}",
  "asset_ref": "${assetRef}",
  "asset_type": "${assetType}",
  "asset_detail": "${assetDetail}",
  "remark": "${remark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'opsAPI',
      apiUrl:
          'https://efa0-122-154-11-110.ap.ngrok.io/Services/MobileService.asmx/Save',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NpaCheckAssetIdAPICall {
  static Future<ApiCallResponse> call({
    String? assetid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "assetid": "${assetid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'npaCheckAssetIdAPI',
      apiUrl:
          'http://27.254.207.150:86/Services/MobileService.asmx/CheckAssetId',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic resultResponse(dynamic response) => getJsonField(
        response,
        r'''$.d''',
      );
}

class ListAPITestCall {
  static Future<ApiCallResponse> call({
    String? perPage = '',
    String? page = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listAPITest',
      apiUrl: 'https://reqres.in/api/unknown',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'per_page': perPage,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetVloanContractAPICall {
  static Future<ApiCallResponse> call({
    String? cuscod = '',
    String? token = '',
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getVloanContractAPI',
      apiUrl: '${apiUrl}/api/v1/branchview/contract',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic ${token}',
      },
      params: {
        'func': "get_contract",
        'cuscod': cuscod,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? contNo(dynamic response) => (getJsonField(
        response,
        r'''$.contract.*[0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? customerName(dynamic response) => (getJsonField(
        response,
        r'''$.contract.*[3]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
  static List<String>? vloanServer(dynamic response) => (getJsonField(
        response,
        r'''$.contract.*[4]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CheckAppFromVloanAPICall {
  static Future<ApiCallResponse> call({
    String? vloanNo = '',
    String? system = '',
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'checkAppFromVloanAPI',
      apiUrl: '${apiUrl}/api/v1/DLT/dlt_post_collateral',
      callType: ApiCallType.POST,
      headers: {
        'Cookie': 'PHPSESSID=m2vjett3i2bc97k5cq7ip3ail6',
      },
      params: {
        'vloan_no': vloanNo,
        'system': system,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? vehicleInfo(dynamic response) => getJsonField(
        response,
        r'''$.detail.vehicleInfo''',
      );
}

class CheckVloanContractActiveAPICall {
  static Future<ApiCallResponse> call({
    String? contractNo = '',
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'checkVloanContractActiveAPI',
      apiUrl: '${apiUrl}/api/v1/los/check_contract_active',
      callType: ApiCallType.POST,
      headers: {
        'Cookie': 'PHPSESSID=m2vjett3i2bc97k5cq7ip3ail6',
      },
      params: {
        'contract_no': contractNo,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? contractStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class RemarkVLoneAPICall {
  static Future<ApiCallResponse> call({
    String? cuscod = '',
    String? lat = '',
    String? long = '',
    String? contno = '',
    String? server = '',
    String? msg = '',
    String? func = '',
    String? apiUrl = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'remarkVLoneAPI',
      apiUrl: '${apiUrl}/api/v1/branchview/remark',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic ${token}',
      },
      params: {
        'func': func,
        'cuscod': cuscod,
        'lat': lat,
        'long': long,
        'contno': contno,
        'server': server,
        'msg': msg,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result''',
      ));
}

class GetlocationAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branch = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branch": "${branch}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetlocationAPI',
      apiUrl: '${apiUrl}/api/check-in/location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? group(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.Group''',
      ));
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_CODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchName(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_NAME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchLat(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].LATITUDE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchLong(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].LONGITUDE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchRadius(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].RADIUS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static int? statusLayer3(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.Location.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetBranchAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? type = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branchCode": "${branchCode}",
  "api_url": "${apiUrl}",
  "type": "${type}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBranchAPI',
      apiUrl: '${apiUrl}/api/branchkpi/getbranch',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].BranchCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].BranchName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].RegionCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].RegionName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].AreaCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].AreaName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? groupCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].GroupCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchSize(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].branch[:].BranchSize''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetRegionAreaAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branchType = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branchType": "${branchType}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRegionAreaAPI',
      apiUrl: '${apiUrl}/api/branchkpi/getall-branch',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List? areaCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaCode''',
        true,
      ) as List?;
  static List? areaName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaName''',
        true,
      ) as List?;
  static List? areaType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].Type''',
        true,
      ) as List?;
  static List<String>? regionCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].region[:].RegionCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].region[:].RegionName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regionType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].region[:].Type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetEmployeeIdFromNicknameAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? searchName = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "searchName": "${searchName}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getEmployeeIdFromNicknameAPI',
      apiUrl: '${apiUrl}/api/branchkpi/searchname-getempcode',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? employeeID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? firstName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].FirstName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].LastName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? nickName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].NickName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mapNickname(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].MapNickName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branch(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].Brach''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? getKeyWordName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail[:].GetKeyWord''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? detailMessage(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].detail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAllEmployeeAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? searchKeyname = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "search_keyname": "${searchKeyname}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllEmployeeAPI',
      apiUrl: '${apiUrl}/api/internal-service/get-list-name',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessages''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.message''',
      ));
  static List<String>? fullname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].EmployeeCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workPosition(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].BranchCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CheckinAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? latitude = '',
    String? urlImg = '',
    String? branch = '',
    String? token = '',
    String? longitude = '',
    String? remark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "branch": "${branch}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "api_url": "${apiUrl}",
  "url_img": "${urlImg}",
  "remark": "${remark}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckinAPI',
      apiUrl: '${apiUrl}/api/check-in/work-check',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? checkinMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static String? massageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetDateTimeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getDateTimeAPI',
      apiUrl: '${apiUrl}/api/check-in/getdate-time',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? currentDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.Date''',
      ));
  static String? currentTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.Time''',
      ));
  static dynamic currentDateYMD(dynamic response) => getJsonField(
        response,
        r'''$.info.DateYMD''',
      );
}

class AddPhoneCalledLeadAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? leadID = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "leadID": "${leadID}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addPhoneCalledLeadAPI',
      apiUrl: '${apiUrl}/api/lead/call-out',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static String? info(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].info''',
      ));
  static dynamic countCalled(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CountCall''',
      );
}

class CheckinoutThisMonthAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkinoutThisMonthAPI',
      apiUrl: '${apiUrl}/api/check-in/current-month',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? flagCheck(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.flag''',
      ));
  static List<String>? listBranchCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listTimeCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listDateCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listActionStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listCheckinoutDate(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? workInStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? infoCheckCurrent(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
        true,
      ) as List?;
}

class CheckinoutLastMonthAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkinoutLastMonthAPI',
      apiUrl: '${apiUrl}/api/check-in/last-month',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? flagCheck(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.flag''',
      ));
  static List<String>? listBranchCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listTimeCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listDateCheckin(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listActionStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? listCheckinoutDate(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? workInStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workInTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutStatus(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutDateTH(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? workOutTime(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetTargetContractKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetContractKPIAPI',
      apiUrl: '${apiUrl}/api/actual/target-contract',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantity(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLastMonth(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? positionLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCodeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actualLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantityLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? monthLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetEmpTargetContractKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? empCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "empCode": "${empCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpTargetContractKPIAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-contract-empcode',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantity(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List<String>? dataInfoLastMonth(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? positionLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCodeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actualLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantityLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? monthLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdTM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetTargetBudgetKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetBudgetKPIAPI',
      apiUrl: '${apiUrl}/api/actual/target-budget-set',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List? dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?;
  static String? position(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      ));
  static String? branchCodeTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      ));
  static String? actual(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      ));
  static String? targetBudget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaRespons(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static String? actualBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      ));
  static String? targetBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaResponsLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static String? areaGradeTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
      ));
  static String? areaTypeTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
      ));
  static String? ageOfPositionTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
      ));
  static String? areaGradeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
      ));
  static String? areaTypeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
      ));
  static String? ageOfPositionLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
      ));
  static String? employeeID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      ));
  static String? employeeIDLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      ));
  static String? branchCodeLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
      ));
}

class GetEmpTargetBudgetKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? empCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "empCode": "${empCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getEmpTargetBudgetKPIAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-amount-empcode',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List? dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?;
  static String? position(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      ));
  static String? branchCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      ));
  static String? actual(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      ));
  static String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      ));
  static String? targetBudget(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaRespons(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static String? actualBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      ));
  static String? targetBudgetLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      ));
  static String? areaResponsLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      ));
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static String? employeeIdTM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      ));
  static String? employeeIdLM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      ));
  static dynamic areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
      );
  static dynamic areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
      );
  static dynamic ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
      );
  static dynamic areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
      );
  static dynamic areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
      );
  static dynamic ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
      );
}

class GetTargetBudgetKpiCEOAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? branchCode = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "branchCode": "${branchCode}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetBudgetKpiCEOAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-amount',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetBudget(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List<String>? dataInfoLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actualBudgetLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetBudgetLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? employeeID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?;
  static List? areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      ) as List?;
  static List? ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?;
  static List? areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?;
  static List? areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      ) as List?;
  static List? ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?;
}

class GetTargetContractKpiCEOAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? branchCode = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "branchCode": "${branchCode}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTargetContractKpiCEOAPI',
      apiUrl: '${apiUrl}/api/branchkpi/actual-contract',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static List<String>? dataInfo(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actual(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? month(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaRespons(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      ));
  static List? dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      ) as List?;
  static List<String>? actualBudgetLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaResponsLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer3TM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      ));
  static String? messageLayer3TM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      ));
  static List<String>? employeeID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantity(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? productTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetQuantityLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?;
  static List? areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      ) as List?;
  static List? ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?;
  static List<String>? areaGradeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? areaTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ageOfPositionLM(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TelePackageSearchAPICall {
  static Future<ApiCallResponse> call({
    String? brandCode = '',
    String? modelCode = '',
    String? year = '',
    String? province = '',
    String? carRegistration = '',
    String? driver = '',
    String? vehicleUsage = '',
    List<String>? companyIdList,
    List<String>? coverTypeList,
    String? apiUrl = '',
  }) async {
    final companyId = _serializeList(companyIdList);
    final coverType = _serializeList(coverTypeList);

    final ffApiRequestBody = '''
{
  "brand_code": "${brandCode}",
  "model_code": "${modelCode}",
  "year": "${year}",
  "province": "${province}",
  "car_registration": "${carRegistration}",
  "driver": "${driver}",
  "vehicle_usage": "${vehicleUsage}",
  "cover_type": ${coverType},
  "company_id": ${companyId},
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'telePackageSearchAPI',
      apiUrl: '${apiUrl}/api/insurance/get_package',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer 17|7sJzQO3NJByIKfCID3xPMSk6MsI9P1bVXMLABiXr',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List? statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<String>? coverType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? grossTotal(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].gross_total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expiryDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? pa(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].pa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tppd(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].tppd''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumInsured(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].sum_insured''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].garage_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? actAmount(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].act_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? statusLayer1Message(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?;
  static List<String>? serialName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].serial_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TeleGetBrandAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetBrandAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_brands',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalBrand(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? brandID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? brandType(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TeleGetModelAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{"api_url":"${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetModelAPI ',
      apiUrl: '${apiUrl}/api/insurance/master/get_models',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalModel(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? brandID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelVehicleGroup(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].veh_group''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelNubmerSeat(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].no_seats''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelEnginCapacity(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].engine_capacity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modelWeight(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].weight''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TeleGetInsurersAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetInsurersAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_insurers',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalInsurers(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? companyCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyFullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TeleGetProvinceAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetProvinceAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_province',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalProvince(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? provinceID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provinceNameTH(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provinceNameEN(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TeleGetGarageTypeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetGarageTypeAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_garage_type',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalProvince(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List? provinceID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      ) as List?;
  static List? provinceNameTH(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      ) as List?;
  static List? provinceNameEN(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      ) as List?;
}

class TeleGetCoverTypeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'teleGetCoverTypeAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_cover_type',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLevel1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? totalProvince(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<String>? coverTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].cover_type_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LeaveRequestFirstAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? leaveCountDay = '',
    String? leaveStartDate = '',
    String? leaveEndDate = '',
    String? leavePeriod = '',
    String? empTel = '',
    String? leaveReason = '',
    String? leaveDocument = '',
    String? reasonResign = '',
    String? otherReasonResign = '',
    String? willComeBack = '',
    String? address = '',
    String? province = '',
    String? district = '',
    String? subdistrict = '',
    String? postcode = '',
    String? asset = '',
    String? otherAsset = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "leave_count_day": "${leaveCountDay}",
  "leave_start_date": "${leaveStartDate}",
  "leave_end_date": "${leaveEndDate}",
  "leave_period": "${leavePeriod}",
  "emp_tel": "${empTel}",
  "leave_reason": "${leaveReason}",
  "leave_document": "${leaveDocument}",
  "reason_resign": "${reasonResign}",
  "other_reason_resign": "${otherReasonResign}",
  "will_come_back": "${willComeBack}",
  "address": "${address}",
  "province": "${province}",
  "district": "${district}",
  "subdistrict": "${subdistrict}",
  "postcode": "${postcode}",
  "asset": "${asset}",
  "other_asset": "${otherAsset}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveRequestFirstAPI',
      apiUrl: '${apiUrl}/api/leave/leave-request/1',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
}

class LeaveEditAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? leaveCountDay = '',
    String? leaveStartDate = '',
    String? leaveEndDate = '',
    String? leavePeriod = '',
    String? empTel = '',
    String? leaveReason = '',
    String? leaveDocument = '',
    String? leaveListId = '',
    String? reasonResign = '',
    String? otherReasonResign = '',
    String? willComeBack = '',
    String? address = '',
    String? province = '',
    String? district = '',
    String? subdistrict = '',
    String? postcode = '',
    String? asset = '',
    String? otherAsset = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "leave_count_day": "${leaveCountDay}",
  "leave_start_date": "${leaveStartDate}",
  "leave_end_date": "${leaveEndDate}",
  "leave_period": "${leavePeriod}",
  "emp_tel": "${empTel}",
  "leave_reason": "${leaveReason}",
  "leave_document": "${leaveDocument}",
  "leave_list_id": "${leaveListId}",
  "reason_resign": "${reasonResign}",
  "other_reason_resign": "${otherReasonResign}",
  "will_come_back": "${willComeBack}",
  "address": "${address}",
  "province": "${province}",
  "district": "${district}",
  "subdistrict": "${subdistrict}",
  "postcode": "${postcode}",
  "asset": "${asset}",
  "other_asset": "${otherAsset}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveEditAPI ',
      apiUrl: '${apiUrl}/api/leave/leave-list/${leaveListId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
}

class LeaveListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headBefore(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      ) as List?;
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headAfter(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkEdit(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ResignListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resignListAPI',
      apiUrl: '${apiUrl}/api/leave/resign-list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headBefore(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      ) as List?;
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStartDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDateStart''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? headAfter(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? checkEdit(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? otherAsset(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].OtherAsset''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? asset(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Asset''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? postCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].PostCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subDistrict(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].SubDistrict''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? district(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].District''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? province(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Province''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flagComback(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FlagComeBack''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? otherReasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].OtherReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cancelBy(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDateEnd(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDateEnd''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LeaveListAprroveAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListAprroveAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list-approve',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveUserName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userPhoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonResign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? empIdBoss1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Username_O''',
      ));
  static String? fcmBoss1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Head_O''',
      ));
  static String? empIdBoss2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Username_T''',
      ));
  static String? fcmBoss2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.fcm.Head_T''',
      ));
  static String? massageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? nickName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].AboutEmployee[:].NickName''',
        true,
      ) as List?;
  static List? department(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].AboutEmployee[:].Department''',
        true,
      ) as List?;
}

class LeaveListAprroveTwoAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListAprroveTwoAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list-approve-two',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? createDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDocument(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveReason(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leavePeriod(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveDate(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveCountDay(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveID(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveUserName(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LeaveListCancelAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? reasonCancel = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "reason_cancel": "${reasonCancel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveListCancelAPI',
      apiUrl: '${apiUrl}/api/leave/leave-list/${leaveId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static dynamic infoDetail(dynamic response) => getJsonField(
        response,
        r'''$.info.detail''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class LeaveFlagApproveAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? flagApprove = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "flagApprove": "${flagApprove}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveFlagApproveAPI',
      apiUrl: '${apiUrl}/api/leave/leave-approve/${leaveId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class LeaveFlagApproveListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    List<String>? leaveIdList,
    String? flagApprove = '',
  }) async {
    final leaveId = _serializeList(leaveIdList);

    final ffApiRequestBody = '''
{
  "leaveId": ${leaveId},
  "flagApprove": "${flagApprove}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveFlagApproveListAPI',
      apiUrl: '${apiUrl}/api/leave/leave-approve-list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SendFCMNotificationAPICall {
  static Future<ApiCallResponse> call({
    String? to = '',
    dynamic? notificationJson,
    dynamic? dataJson,
  }) async {
    final notification = _serializeJson(notificationJson);
    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
{
  "to": "${to}",
  "notification": ${notification},
  "data": ${data}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendFCMNotificationAPI',
      apiUrl: 'https://fcm.googleapis.com/fcm/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'key=AAAAWEYHwRs:APA91bG7ezsMWzUoITp6S--2hs3LdrivYaMprdAPl42YdwC1CIu6e8FkOSOGhbtJvaYkdCIjsKBU_U76PKM-bhrwWrPJQy3gHg3ZSi6Uqb76XIuNSh-lIPQ_rloc5wXnTlQlzbaWUSpk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.success''',
      ));
  static int? failure(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.failure''',
      ));
  static String? errerMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results[:].error''',
      ));
  static String? messageID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].message_id''',
      ));
}

class LeaveFlagApproveTwoAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? flagApprove = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leave_id": "${leaveId}",
  "flagApprove": "${flagApprove}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leaveFlagApproveTwoAPI',
      apiUrl: '${apiUrl}/api/leave/leave-approve-two/${leaveId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? infoStatus(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? infoInfo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
}

class GetProvinceAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetProvinceAPI',
      apiUrl: '${apiUrl}/api/province-master/get-province',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? provCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? provName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ProvName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ChangeLocationAPICall {
  static Future<ApiCallResponse> call({
    String? latitude = '',
    String? longitude = '',
    String? flag = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "flag": "${flag}",
  "branchCode": "${branchCode}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangeLocationAPI',
      apiUrl: '${apiUrl}/api/hr-management/change-location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.returnDataView.status''',
      ));
  static String? oldLat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.info[:].LATITUDE''',
      ));
  static String? oldLng(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.info[:].LONGITUDE''',
      ));
  static int? statusConfirm(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.returnDataToEdit.status''',
      ));
  static String? messageView(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.message''',
      ));
  static String? messageEdit(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataToEdit.message''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? branchName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataView.info[:].BRANCH_NAME''',
      ));
}

class InsertLocationAPICall {
  static Future<ApiCallResponse> call({
    String? latitude = '',
    String? longitude = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? token = '',
    String? branchName = '',
    String? groupCode = '',
    String? regionCode = '',
    String? radius = '',
    String? areaCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "branch_code": "${branchCode}",
  "token": "${token}",
  "branch_name": "${branchName}",
  "group_code": "${groupCode}",
  "region_code": "${regionCode}",
  "radius": "${radius}",
  "area_code": "${areaCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InsertLocationAPI',
      apiUrl: '${apiUrl}/api/hr-management/insert-location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.returnDataInsert.status''',
      ));
  static String? statusMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.returnDataInsert.message''',
      ));
}

class GetBossAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetBossAPI',
      apiUrl: '${apiUrl}/api/checkhead/getcheck',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? bossCheck(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.info''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetHolidayAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}"
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetHolidayAPI',
      apiUrl: '${apiUrl}/api/holiday/get-holiday',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? holidayDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].DATE_OF_YEAR''',
        true,
      ) as List?;
  static List? holidayName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].NAME_TH''',
        true,
      ) as List?;
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetLeaveDateCheckinAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetLeaveDateCheckinAPI',
      apiUrl: '${apiUrl}/api/leave/check-leave',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.message''',
      ));
  static int? statusLayer3CM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.currentMonth.status''',
      ));
  static String? messageLayer3CM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info.currentMonth.message''',
      ));
  static int? statusLayer3LM(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info.lastMonth.status''',
      ));
  static String? messageLayer3LM(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info.lastMonth.message''',
      ));
  static List<String>? employeeIdLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].Employee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullnameLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].LeaveType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countDayLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].CountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? startLeaveDateLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].StartDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? endLeaveDateLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].EndDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subLeaveTypeLM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.lastMonth.info[:].Type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeIdCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].Employee''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fullnameCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].FullName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leaveTypeCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].LeaveType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countDayCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].CountDay''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? startLeaveDateCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].StartDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? endLeaveDateCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].EndDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subLeaveTypeCM(dynamic response) => (getJsonField(
        response,
        r'''$.results.info.currentMonth.info[:].Type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetDistrictAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? provCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "provCode": "${provCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetDistrictAPI',
      apiUrl: '${apiUrl}/api/province-master/get-district/${provCode}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? provCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? postCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].PostCode''',
        true,
      ) as List?;
  static List? districtName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictName''',
        true,
      ) as List?;
  static List? districtCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      ) as List?;
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetKPIAllCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? empCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "emp_code": "${empCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetKPIAll',
      apiUrl: '${apiUrl}/api/personal-kpi/all',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? monthth(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..month_th''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countNonLifeLicenseNumber(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data[*]..count_NonLifeLicenseNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countLifeLicenseNumber(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data[*]..count_LifeLicenseNumber''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countleadsurvey(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..count_lead_survey''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tagetUnit(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..Taget_Unit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countLeadID(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..CountLeadID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumKEYINCSHPRCLead(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..SumKEYINCSHPRCLead''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tagetkeyincshprc(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..TAGET_KEYINCSHPRC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? achieveKEYINCSHPRCLead(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data[*]..AchieveKEYINCSHPRCLead''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countPolicyNoTPB(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..CountPolicyNo_TPB''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ibssumApp(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..ibs_sumApp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? ibssumPremium(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..ibs_sumPremium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? insureSumTotalPremiumTPB(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data[*]..Insure_SumTotalPremium_TPB''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? etlCreateDate(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..etl_create_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetbranch(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..target_branch''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countpolicynoepa(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..countpolicyno_epa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? totalpremiumepa(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..total_premium_epa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countPolicyNoCMI(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..CountPolicyNo_CMI''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? totalPremiumCMI(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..Total_Premium_CMI''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countPolicyNoMOTOR(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..CountPolicyNo_MOTOR''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? totalPremiumMOTOR(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[*]..Total_Premium_MOTOR''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetLeadCalledStatusDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadChannel = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leadChannel": "${leadChannel}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadCalledStatusDropdownAPI',
      apiUrl: '${apiUrl}/api/lead/statuscall',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? callStatusId(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? channel(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].Channel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetLeadCalledHistoryAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadID = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leadID": "${leadID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadCalledHistoryAPI',
      apiUrl: '${apiUrl}/api/lead/call-history',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info.message''',
      ));
  static String? info(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.info''',
      ));
  static List<String>? callStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonName(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryReasonName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? note(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryNote''',
        true,
      ) as List?;
  static List<String>? callTime(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallTime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? historyStatus(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryStatus''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? employeeId(dynamic response) => (getJsonField(
        response,
        r'''$.info.Data[:].HistoryUserID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SaveCallStatusAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadID = '',
    String? statusCallID = '',
    String? reasonID = '',
    String? reasonDetail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "leadID": "${leadID}",
  "statusCall_ID": "${statusCallID}",
  "reason_ID": "${reasonID}",
  "reasonDetail": "${reasonDetail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveCallStatusAPI',
      apiUrl: '${apiUrl}/api/lead/save-call',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info[:].status''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].message''',
      ));
  static String? info(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info[:].info''',
      ));
  static String? callStatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].statusCall.call''',
      ));
  static String? callStatusReason(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].statusCall.callStatus''',
      ));
  static String? statusReasonDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.info[:].statusCall.callReason''',
      ));
}

class GetLeadReasonCallDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? callStatusId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}",
  "call_status_id": "${callStatusId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadReasonCallDropdownAPI',
      apiUrl: '${apiUrl}/api/lead/reasoncall/${callStatusId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? callStatusId(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonId(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ReasonID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ReasonName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetSubDistrictAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? districtCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "districtCode": "${districtCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetSubDistrictAPI',
      apiUrl: '${apiUrl}/api/province-master/get-sub-district/${districtCode}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? districtCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].SubDistrictName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? subCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].SubDistrictCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ThaipaiboonAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'thaipaiboonAPI',
      apiUrl: '${apiUrl}/api/insurance/thaipaiboon',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? empCode(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statuslayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.info.status''',
      ));
  static List<String>? groupCampaign(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].GroupCampaign''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? premiums(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].Premiums''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? noOfPolicy(dynamic response) => (getJsonField(
        response,
        r'''$.info.info[:].NoOfPolicy''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? info(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
        true,
      ) as List?;
}

class GetUniversalTimeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUniversalTime',
      apiUrl: 'http://worldtimeapi.org/api/timezone/Asia/Bangkok',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? unixTime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.unixtime''',
      ));
  static String? dateTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.datetime''',
      ));
  static dynamic dateTime1(dynamic response) => getJsonField(
        response,
        r'''$.utc_datetime''',
      );
}

class GetCheckinImgUrlApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCheckinImgUrlApi',
      apiUrl: 'https://40dd-223-27-201-20.ngrok-free.app/api/get',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$[:].urlImg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? time(dynamic response) => (getJsonField(
        response,
        r'''$[:].time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateFlag(dynamic response) => (getJsonField(
        response,
        r'''$[:].dateFlag''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCheckinImgUrlUrlApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCheckinImgUrlUrlApi',
      apiUrl: 'https://40dd-223-27-201-20.ngrok-free.app/api/get1',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$[:].urlImg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? time(dynamic response) => (getJsonField(
        response,
        r'''$[:].time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateFlag(dynamic response) => (getJsonField(
        response,
        r'''$[:].dateFlag''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class InsuranceRequestSendEmailAPICall {
  static Future<ApiCallResponse> call({
    String? carBrandId = '',
    String? carBrandName = '',
    String? carModelId = '',
    String? carModelName = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? driverType = '',
    String? carProvinceCode = '',
    String? carProvinceName = '',
    String? idNumber = '',
    String? carRegistration = '',
    String? carRegistrationYear = '',
    String? vehicleId = '',
    String? vehicleCode = '',
    String? vehicleName = '',
    String? idType = '',
    String? branchCode = '',
    FFUploadedFile? imageFront,
    FFUploadedFile? imageRear,
    FFUploadedFile? imageLeft,
    FFUploadedFile? imageRight,
    FFUploadedFile? imageRightfront,
    FFUploadedFile? imageRightrear,
    FFUploadedFile? imageLeftfront,
    FFUploadedFile? imageLeftrear,
    FFUploadedFile? imageRoof,
    FFUploadedFile? imageApplication,
    FFUploadedFile? imageIdcard,
    FFUploadedFile? imageBluebook,
    FFUploadedFile? imageExamination,
    FFUploadedFile? imageOther1,
    String? apiUrl = '',
    FFUploadedFile? imageOther2,
    FFUploadedFile? imageOther3,
    FFUploadedFile? imageOther4,
    FFUploadedFile? imageOther5,
    List<String>? insurerCodeList,
    List<String>? insurerIdList,
    List<String>? insurerNameList,
    List<String>? insurerShortNameList,
    List<String>? coverTypeIdList,
    List<String>? coverTypeCodeList,
    List<String>? coverTypeNameList,
    List<String>? garageTypeIdList,
    List<String>? garageTypeNameList,
    String? companyName = '',
    String? flgRenew = '',
    String? oldVMIPolicyNumber = '',
    String? flgDecoration = '',
    String? decorationDetail = '',
    String? flgCarrier = '',
    String? flgCoOrg = '',
    String? carrierType = '',
    String? carrierPrice = '',
    String? customerType = '',
    String? trailerCarRegistration = '',
    String? carrierPropose = '',
    String? remark = '',
    FFUploadedFile? imageFrontTrailer,
    FFUploadedFile? imageRearTrailer,
    FFUploadedFile? imageLeftTrailer,
    FFUploadedFile? imageRightTrailer,
    FFUploadedFile? imageRightfrontTrailer,
    FFUploadedFile? imageRightrearTrailer,
    FFUploadedFile? imageLeftfrontTrailer,
    FFUploadedFile? imageLeftrearTrailer,
    FFUploadedFile? imageRoofTrailer,
    String? carType = '',
    String? customerMemberchip = '',
    String? truckPart = '',
    String? flgAct = '',
    String? sumInsured = '',
    String? trailerSumInsured = '',
    String? truckCurrentPrice = '',
    String? token = '',
  }) async {
    final insurerCode = _serializeList(insurerCodeList);
    final insurerId = _serializeList(insurerIdList);
    final insurerName = _serializeList(insurerNameList);
    final insurerShortName = _serializeList(insurerShortNameList);
    final coverTypeId = _serializeList(coverTypeIdList);
    final coverTypeCode = _serializeList(coverTypeCodeList);
    final coverTypeName = _serializeList(coverTypeNameList);
    final garageTypeId = _serializeList(garageTypeIdList);
    final garageTypeName = _serializeList(garageTypeNameList);

    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestSendEmailAPI',
      apiUrl: '${apiUrl}/ssw_insurance_manual_api/api/manual-insurance/save',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'car_brand_id': carBrandId,
        'car_brand_name': carBrandName,
        'car_model_id': carModelId,
        'car_model_name': carModelName,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'driver_type': driverType,
        'car_province_code': carProvinceCode,
        'car_province_name': carProvinceName,
        'id_number': idNumber,
        'car_registration': carRegistration,
        'car_registration_year': carRegistrationYear,
        'vehicle_id': vehicleId,
        'vehicle_code': vehicleCode,
        'vehicle_name': vehicleName,
        'id_type': idType,
        'branch_code': branchCode,
        'image_front': imageFront,
        'image_rear': imageRear,
        'image_left': imageLeft,
        'image_right': imageRight,
        'image_rightfront': imageRightfront,
        'image_rightrear': imageRightrear,
        'image_leftfront': imageLeftfront,
        'image_leftrear': imageLeftrear,
        'image_roof': imageRoof,
        'image_application': imageApplication,
        'image_idcard': imageIdcard,
        'image_bluebook': imageBluebook,
        'image_examination': imageExamination,
        'image_other1': imageOther1,
        'api_url': apiUrl,
        'image_other2': imageOther2,
        'image_other3': imageOther3,
        'image_other4': imageOther4,
        'image_other5': imageOther5,
        'insurer_code': insurerCode,
        'insurer_id': insurerId,
        'insurer_name': insurerName,
        'insurer_short_name': insurerShortName,
        'cover_type_id': coverTypeId,
        'cover_type_code': coverTypeCode,
        'cover_type_name': coverTypeName,
        'garage_type_id': garageTypeId,
        'garage_type_name': garageTypeName,
        'company_name': companyName,
        'flg_renew': flgRenew,
        'old_VMI_policyNumber': oldVMIPolicyNumber,
        'flg_decoration': flgDecoration,
        'decoration_detail': decorationDetail,
        'flg_carrier': flgCarrier,
        'flg_co_org': flgCoOrg,
        'carrier_type': carrierType,
        'carrier_price': carrierPrice,
        'customer_type': customerType,
        'trailer_car_registration': trailerCarRegistration,
        'carrier_propose': carrierPropose,
        'remark': remark,
        'image_front_trailer': imageFrontTrailer,
        'image_rear_trailer': imageRearTrailer,
        'image_left_trailer': imageLeftTrailer,
        'image_right_trailer': imageRightTrailer,
        'image_rightfront_trailer': imageRightfrontTrailer,
        'image_rightrear_trailer': imageRightrearTrailer,
        'image_leftfront_trailer': imageLeftfrontTrailer,
        'image_leftrear_trailer': imageLeftrearTrailer,
        'image_roof_trailer': imageRoofTrailer,
        'car_type': carType,
        'customer_memberchip': customerMemberchip,
        'truck_part': truckPart,
        'flg_act': flgAct,
        'sum_insured': sumInsured,
        'trailer_sum_insured': trailerSumInsured,
        'truck_current_price': truckCurrentPrice,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic resultInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
      );
}

class InsuranceRequestEditAPICall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? imageFront,
    FFUploadedFile? imageRear,
    FFUploadedFile? imageLeft,
    FFUploadedFile? imageRight,
    FFUploadedFile? imageRightfront,
    FFUploadedFile? imageRightrear,
    FFUploadedFile? imageLeftfront,
    FFUploadedFile? imageLeftrear,
    FFUploadedFile? imageRoof,
    FFUploadedFile? imageIdcard,
    FFUploadedFile? imageBluebook,
    FFUploadedFile? imageOther1,
    String? apiUrl = '',
    FFUploadedFile? imageOther2,
    FFUploadedFile? imageOther3,
    FFUploadedFile? imageOther4,
    FFUploadedFile? imageOther5,
    String? insurerShortName = '',
    FFUploadedFile? imageFrontTrailer,
    FFUploadedFile? imageRearTrailer,
    FFUploadedFile? imageLeftTrailer,
    FFUploadedFile? imageRightTrailer,
    FFUploadedFile? imageRightfrontTrailer,
    FFUploadedFile? imageRightrearTrailer,
    FFUploadedFile? imageLeftfrontTrailer,
    FFUploadedFile? imageLeftrearTrailer,
    String? token = '',
    String? leadId = '',
    String? leadNo = '',
    String? imageOtherName = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestEditAPI',
      apiUrl: '${apiUrl}/ssw_insurance_manual_api/api/manual-insurance/edit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'image_front': imageFront,
        'image_rear': imageRear,
        'image_left': imageLeft,
        'image_right': imageRight,
        'image_rightfront': imageRightfront,
        'image_rightrear': imageRightrear,
        'image_leftfront': imageLeftfront,
        'image_leftrear': imageLeftrear,
        'image_roof': imageRoof,
        'image_idcard': imageIdcard,
        'image_bluebook': imageBluebook,
        'image_other1': imageOther1,
        'api_url': apiUrl,
        'image_other2': imageOther2,
        'image_other3': imageOther3,
        'image_other4': imageOther4,
        'image_other5': imageOther5,
        'insurer_short_name': insurerShortName,
        'image_front_trailer': imageFrontTrailer,
        'image_rear_trailer': imageRearTrailer,
        'image_left_trailer': imageLeftTrailer,
        'image_right_trailer': imageRightTrailer,
        'image_rightfront_trailer': imageRightfrontTrailer,
        'image_rightrear_trailer': imageRightrearTrailer,
        'image_leftfront_trailer': imageLeftfrontTrailer,
        'image_leftrear_trailer': imageLeftrearTrailer,
        'lead_id': leadId,
        'lead_no': leadNo,
        'image_other_name': imageOtherName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusCode''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results.statusMessage''',
      );
  static dynamic resultInfo(dynamic response) => getJsonField(
        response,
        r'''$.results.info''',
      );
}

class InsuranceRequestListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? ownerId = '',
    String? mode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "owner_id": "${ownerId}",
  "mode": "${mode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestListAPI',
      apiUrl: '${apiUrl}/ssw_insurance_manual_api/api/lead/get-lead-list',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static int? listTotal(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  static List<int>? leadId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? leadNo(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
        true,
      ) as List?;
  static List<String>? firstname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastname(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
        true,
      ) as List?;
  static List<String>? customerType(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? flagRenew(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class InsuranceRequestDetailAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "lead_id": "${leadId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestDetailAPI',
      apiUrl: '${apiUrl}/ssw_insurance_manual_api/api/lead/get-lead-detail',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statusCode''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statusMessage''',
      ));
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.statusCode''',
      ));
  static String? messageLayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.statusMessage''',
      ));
  static int? leadId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info[:].lead_id''',
      ));
  static String? leadNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].lead_no''',
      ));
  static dynamic leadStatus(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].lead_status''',
      );
  static String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].first_name''',
      ));
  static String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].last_name''',
      ));
  static dynamic company(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].company_name''',
      );
  static String? customerType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].customer_type''',
      ));
  static String? phoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].phone_number''',
      ));
  static String? flagRenew(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_renew''',
      ));
  static String? idCardNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].id_number''',
      ));
  static String? carType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_type''',
      ));
  static String? brandName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_brand_name''',
      ));
  static String? modelName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_model_name''',
      ));
  static String? province(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_province_name''',
      ));
  static String? plateNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_registration''',
      ));
  static String? year(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].car_registration_year''',
      ));
  static String? vehicleCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].vehicle_code''',
      ));
  static String? vehicleName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].vehicle_name''',
      ));
  static int? vehicleId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.info[:].vehicle_id''',
      ));
  static String? flagDecoration(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_decoration''',
      ));
  static String? decorationDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].decoration_detail''',
      ));
  static String? flagCarrier(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_carrier''',
      ));
  static String? flagCoop(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_co_org''',
      ));
  static String? carrierType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].carrier_type''',
      ));
  static String? carrierPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].carrier_price''',
      ));
  static String? remark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].remark''',
      ));
  static String? flagAct(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].flg_act''',
      ));
  static String? sumInsured(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].sum_insured''',
      ));
  static List<String>? insurerNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coverTypeNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].cover_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? garageTypeNameList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].garage_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? leadDetailId(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].lead_dtl_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? insurerShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].insurer_short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageFrontList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_front''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRearList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rear''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_left''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_right''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightFrontList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightfront''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightRearList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightrear''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftFrontList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftfront''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftRearList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftrear''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRoofList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_roof''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageFrontTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_front_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRearTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rear_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_left_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_right_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightFrontTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightfront_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRightRearTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_rightrear_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftFrontTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftfront_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageLeftRearTrailerList(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_leftrear_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageRoofTrailerList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_roof_trailer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageBluebookList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_bluebook''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageIdCardList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_idcard''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageOtherList(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_other''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? oldVmiPolicyNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].old_VMI_policyNumber''',
      ));
  static String? truckPart(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].truck_part''',
      ));
  static String? customerMemberchip(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].customer_memberchip''',
      ));
  static dynamic trailerPlateNo(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].trailer_car_registration''',
      );
  static String? carrierPropose(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].carrier_propose''',
      ));
  static dynamic trailerSumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.info[:].trailer_sum_insured''',
      );
  static String? truckCurrentPrice(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.info[:].truck_current_price''',
      ));
  static List<String>? imageOtherName(dynamic response) => (getJsonField(
        response,
        r'''$.results.info[:].leads_detail[:].image_other_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class InsuranceRequestGetVehicleAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestGetVehicleAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_vehicle',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? vehicleId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vehicleCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vehicleName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vehicletype(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].vehicle_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class InsuranceRequestGetInsurerAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'insuranceRequestGetInsurerAPI',
      apiUrl: '${apiUrl}/api/insurance/master/get_insurers_all',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? companyId(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyCode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyShortName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyFullName(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? companyListName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].list_name''',
        true,
      ) as List?;
}

class CollectionFollowupDebtCall {
  static Future<ApiCallResponse> call({
    String? branchCode = '',
    int? dataPage,
    int? pageSize,
    String? dataFilter = '',
    String? searchBy = '',
    String? search = '',
    String? sortBy = '',
    String? areaCode = '',
    String? regionCode = '',
    String? role = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "branchCode": "${branchCode}",
  "dataPage": ${dataPage},
  "pageSize": ${pageSize},
  "dataFilter": "${dataFilter}",
  "searchBy": "${searchBy}",
  "search": "${search}",
  "sortBy": "${sortBy}",
  "codeKate": "${areaCode}",
  "codeRegion": "${regionCode}",
  "role": "${role}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'collectionFollowupDebt',
      apiUrl: '${apiUrl}/collection/api/get_data_list',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? totalPages(dynamic response) => (getJsonField(
        response,
        r'''$.totalPages''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? database(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DATABASE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name1(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].NAME1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name2(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].NAME2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countNo(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CONTNO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mobileNumber(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].MOBILE_NUMBER''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cusCod(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CUSCOD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? teamFromCld(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].TEAM_FROM_CLD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expDay(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].EXP_DAY''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dayOfDue(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DAYOFDUE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codeBranch(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODEBRANCH''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codeKate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODEKATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codeRegion(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODEREGION''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codeNameRegion(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODENAMEREGION''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? calltype(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CALL_TYPE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expAmt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].EXP_AMT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? dateOfExp(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DATEOFEXP''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static List<String>? statusRefcontno(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].Status_REFCONTNO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? arnow(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].ARNOW''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataTabName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].dataTab''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regno(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REGNO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CollectionFollowupDebtPPCall {
  static Future<ApiCallResponse> call({
    String? branchCode = '',
    String? areaCode = '',
    String? regionCode = '',
    String? searchMonth = '',
    String? role = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "branchCode": "${branchCode}",
  "codeKate": "${areaCode}",
  "codeRegion": "${regionCode}",
  "searchMonth": "${searchMonth}",
  "role": "${role}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'collectionFollowupDebtPP',
      apiUrl: '${apiUrl}/collection/api/get_data_pp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? name1(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].NAME1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name2(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].NAME2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cusCod(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CUSCOD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static List<String>? remdetcode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REMDETCODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? arappdate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].ARAPPDATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? regno(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REGNO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CollectionApiGetDataPersonCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? idCard = '',
    int? dataFilter,
  }) async {
    final ffApiRequestBody = '''
{
  "api_url": "${apiUrl}",
  "idCard": "${idCard}",
  "dataFilter": ${dataFilter}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'collectionApiGetDataPerson',
      apiUrl: '${apiUrl}/collection/api/get_data_person',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? cuscod(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CUSCOD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? teamfromcld(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].TEAM_FROM_CLD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expday(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].EXP_DAY''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mobilenumber(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].MOBILE_NUMBER''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contno(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CONTNO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name2(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].NAME2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name1(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].NAME1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? database(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DATABASE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statuscode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].ID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dayofdue(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DAYOFDUE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codebranch(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODEBRANCH''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codekate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODEKATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? coderegion(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODEREGION''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? codenameregion(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CODENAMEREGION''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? calltype(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CALL_TYPE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expamt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].EXP_AMT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? targetstat(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].TARGETSTAT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contstat(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].CONTSTAT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateofexp(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DATEOFEXP''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? fDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].FDATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? statusRefContno(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].Status_REFCONTNO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? expFrm(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].EXP_FRM''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].UPDATED_AT''',
        true,
      ) as List?;
  static List<String>? dateofdue(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DATEOFDUE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sumCurrentDueAmt(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].SUM_CURRENTDUEAMT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateOfData(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].DATEOFDATA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lastPayDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].LPAYD''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataTab(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].dataTab''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? historyCount(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].historyCount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SaveCallCollectionCall {
  static Future<ApiCallResponse> call({
    dynamic? saveCallJson,
    String? apiUrl = '',
  }) async {
    final saveCall = _serializeJson(saveCallJson);
    final ffApiRequestBody = '''
{
  "saveCall": ${saveCall},
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveCallCollection',
      apiUrl: '${apiUrl}/collection/api/save_call_collection',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? statuscode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CollectionApiVloanDataCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'collectionApiVloanData',
      apiUrl: '${apiUrl}/collection/api/vloanData',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuscode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? remgcode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REMGCODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? remdesc(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REMDESC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? remdetcode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REMDETCODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? remdetdesc(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REMDETDESC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetDataSearchCollectionCall {
  static Future<ApiCallResponse> call({
    String? searchBy = '',
    String? search = '',
    int? dataFilter,
    String? branchCode = '',
    String? codeKate = '',
    String? codeRegion = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "searchBy": "${searchBy}",
  "search": "${search}",
  "dataFilter": ${dataFilter},
  "branchCode": "${branchCode}",
  "codeKate": "${codeKate}",
  "codeRegion": "${codeRegion}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getDataSearchCollection',
      apiUrl: '${apiUrl}/collection/api/get_data_search',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuscode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static String? cuscod(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].CUSCOD''',
      ));
  static String? database(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].DATABASE''',
      ));
  static String? name1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].NAME1''',
      ));
  static String? name2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].NAME2''',
      ));
  static String? contno(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].CONTNO''',
      ));
  static String? mobilenumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].MOBILE_NUMBER''',
      ));
  static String? teamfromcld(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].TEAM_FROM_CLD''',
      ));
  static String? expday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].EXP_DAY''',
      ));
  static String? dayofdue(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].DAYOFDUE''',
      ));
  static String? codebranch(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].CODEBRANCH''',
      ));
  static String? coderegion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].CODEREGION''',
      ));
  static String? codekate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].CODEKATE''',
      ));
  static String? codenameregion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].CODENAMEREGION''',
      ));
  static String? calltype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].CALL_TYPE''',
      ));
  static String? expamt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].EXP_AMT''',
      ));
  static String? targetstat(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].TARGETSTAT''',
      ));
  static String? contstat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].CONTSTAT''',
      ));
  static String? dateofexp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].DATEOFEXP''',
      ));
}

class CollectionApiGetDataCountCall {
  static Future<ApiCallResponse> call({
    String? branchCode = '',
    String? codeKate = '',
    String? codeRegion = '',
    String? role = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "branchCode": "${branchCode}",
  "codeKate": "${codeKate}",
  "codeRegion": "${codeRegion}",
  "role": "${role}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'collectionApiGetDataCount',
      apiUrl: '${apiUrl}/collection/api/get_data_count',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? dataTab(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].dataTab''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? count(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].Count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CollectionApiGetDataCountPPCall {
  static Future<ApiCallResponse> call({
    String? branchCode = '',
    String? codeKate = '',
    String? codeRegion = '',
    String? role = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "branchCode": "${branchCode}",
  "codeKate": "${codeKate}",
  "codeRegion": "${codeRegion}",
  "role": "${role}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'collectionApiGetDataCountPP',
      apiUrl: '${apiUrl}/collection/api/get_data_count_pp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static dynamic pp(dynamic response) => getJsonField(
        response,
        r'''$.data[:].PP''',
      );
}

class GetCalledHistoryCollectionApiCall {
  static Future<ApiCallResponse> call({
    String? contNo = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contNo": "${contNo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCalledHistoryCollectionApi',
      apiUrl: '${apiUrl}/collection/api/get_data_history',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.statuscode''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? calledStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].HISTORY_CALL_STATUS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? calledTime(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].HISTORY_CALL_TIME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].HISTORY_REASON_NAME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? arDate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].ARDATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? arDesc(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].ARDESC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? arAppdate(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].ARAPPDATE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? remdetcode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REMDETCODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? remgcode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].REMGCODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiRepaymentListCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? paiddate = '',
    String? contno = '',
  }) async {
    final ffApiRequestBody = '''
{
  "paiddate": "${paiddate}",
  "contno": "${contno}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'apiRepaymentList',
      apiUrl: '${apiUrl}/api/repayment/list',
      callType: ApiCallType.POST,
      headers: {
        'X-API-KEY': 'xs6PekOU2GPChNTgeHVmlvgs7QNImu9OqEksBQ01/Yg=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? overdueamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.over_due_amount''',
      ));
  static int? remain401(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.remain_401''',
      ));
  static int? remain624(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.remain_624''',
      ));
  static String? customername(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.customer_name''',
      ));
  static String? duedateshow(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.data.due_date_show''',
      ));
  static int? nextdueamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.next_due_amount''',
      ));
  static int? totaldueamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.total_due_amount''',
      ));
  static int? statuslayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static String? messagelayer2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? currentdueamount(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.results.data.current_due_amount''',
      ));
  static String? birthday(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.data.birth_day''',
      ));
}

class SaveRecordVideoApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? contno = '',
    String? checkType = '',
    String? employeeId = '',
    FFUploadedFile? filesVdo,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'saveRecordVideoApi',
      apiUrl: '${apiUrl}/upload_save.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'contno': contno,
        'check_type': checkType,
        'employee_id': employeeId,
        'files_vdo': filesVdo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status.code''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status.message''',
      ));
  static dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
