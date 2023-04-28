import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AuthenAPICall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? apiUrl = '1',
    String? fcmToken = '',
    String? uid = '',
    String? check = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.user.employee_id''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.user.branch_code''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class GetTimesheetAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].RecordId''',
      );
  static dynamic jobType(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Job_Type''',
      );
  static dynamic clockIn(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].ClockIn''',
      );
  static dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Latitude''',
      );
  static dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data[:].Longitude''',
      );
  static dynamic timesheetData(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data''',
      );
}

class GetApprovedAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? approvedTypes = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic approvedID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic approvedEmpID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic approvedEmpName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      );
  static dynamic approvedLeaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic approvedLeaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic approvedLeaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic approvedLeavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic approvedLeaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic approvedLeaveDoc(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic approvedEmpTel(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic approvedLeaveCreateDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic cancelBy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      );
  static dynamic reasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      );
}

class SendResignFormEmailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? leaveDocId = '',
    String? email = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
}

class TimesheetDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? pageName = '',
    String? recordId = '',
    String? editCheck = '',
    String? remark = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].RecordId''',
      );
  static dynamic citizenID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].CitizenId''',
      );
  static dynamic customerName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Customer_Name''',
      );
  static dynamic landmark(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Landmark''',
      );
  static dynamic remark(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Remark''',
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].Description''',
      );
  static dynamic contNo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].ContNo''',
      );
  static dynamic assetID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data[:].AssetId''',
      );
  static dynamic matName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Material_Name''',
        true,
      );
  static dynamic matImg(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:].Img_Url''',
        true,
      );
  static dynamic material(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Product[:]''',
        true,
      );
  static dynamic marketingBranchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Branch_Code''',
      );
  static dynamic marketingAreaDescription(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Area_Description''',
      );
  static dynamic marketingDetail(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Detail''',
      );
  static dynamic marketingRemark(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].Remark''',
      );
  static dynamic marketingRecordId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Data.Marketing[:].RecordId''',
      );
  static dynamic statusDescription(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status_desc''',
      );
}

class GetUserProfileAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}"
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic profileEmployeeID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      );
  static dynamic profileFullName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      );
  static dynamic profileNickName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      );
  static dynamic profileHiredDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      );
  static dynamic profileServiceDurationYY(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      );
  static dynamic profileServiceDurationMM(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      );
  static dynamic profileServiceDurationDD(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      );
  static dynamic profileArea(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      );
  static dynamic profileRegion(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      );
  static dynamic profliePositionName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      );
  static dynamic profileBranchName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      );
  static dynamic profileBirthDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static dynamic profilePositionAgeYY(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.year''',
      );
  static dynamic profilePositionAgeMM(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.month''',
      );
  static dynamic profilePositionAgeDD(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge.day''',
      );
  static dynamic profilePositionAgeCheck(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].checkPositionAge''',
      );
  static dynamic profilePhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].MobileNumber''',
      );
  static dynamic profileFirstBossEmpID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeBefore''',
      );
  static dynamic profileFirstBossName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameBefore''',
      );
  static dynamic profileSecondBossEmpID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.EmpCodeAfter''',
      );
  static dynamic profileSecondBossName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HeadOfWork.FullnameAfter''',
      );
  static dynamic profileLevel(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Level''',
      );
  static dynamic profileBranch(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Branch''',
      );
  static dynamic insurancePlan(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].InsurancePlan''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchCode''',
      );
}

class ActionUserAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic profileEmployeeID(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].EmpCode''',
      );
  static dynamic profileFullName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].fullName''',
      );
  static dynamic profileNickName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].nickName''',
      );
  static dynamic profileHiredDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].HiredDate''',
      );
  static dynamic profileServiceDurationYY(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.year''',
      );
  static dynamic profileServiceDurationMM(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.month''',
      );
  static dynamic profileServiceDurationDD(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].ServiceDuration.day''',
      );
  static dynamic profilePositionAge(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionAge''',
      );
  static dynamic profileArea(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Area''',
      );
  static dynamic profileRegion(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].Region''',
      );
  static dynamic profliePositionName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].PositionName''',
      );
  static dynamic profileBranchName(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BranchName''',
      );
  static dynamic profileBirthDate(dynamic response) => getJsonField(
        response,
        r'''$.DataUserInfo[:].BirthDate''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetLeadDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic connectStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic dataStatus(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.status''',
      );
  static dynamic dataLeadID(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].lead_id''',
        true,
      );
  static dynamic dataFirstName(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].first_name''',
        true,
      );
  static dynamic dataPhoneNum(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].phone_number''',
        true,
      );
  static dynamic dataCallStatus(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].call_status''',
        true,
      );
  static dynamic dataCreatedAt(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].created_at''',
        true,
      );
  static dynamic dataLeadChannel(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].channel''',
        true,
      );
  static dynamic dataEmployeeID(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].employee_id''',
        true,
      );
  static dynamic dataBranchCode(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_code''',
        true,
      );
  static dynamic dataBranchName(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].branch_name''',
        true,
      );
  static dynamic dataMessage(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.message''',
      );
  static dynamic dataLevel(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.level''',
      );
  static dynamic connectionMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic countCalled(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].countCall''',
        true,
      );
  static dynamic firstName2(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.first_name2''',
        true,
      );
  static dynamic phoneNumber2(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.phone_number2''',
        true,
      );
  static dynamic lastName2(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info.last_name2''',
        true,
      );
  static dynamic descInfo(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].desc_info''',
        true,
      );
  static dynamic carVehicleName(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].car_vehicle_name''',
        true,
      );
  static dynamic amountRequest(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].amount_request''',
        true,
      );
  static dynamic statusReason(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].statusCallOut''',
        true,
      );
  static dynamic contractStatus(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].StatusContract''',
        true,
      );
  static dynamic contractDate(dynamic response) => getJsonField(
        response,
        r'''$.DataLeadInfo.DataInfo[:].contract_date''',
        true,
      );
}

class GetWelfareKpiCurrentMonthAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      );
  static dynamic percentSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      );
  static dynamic flagSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      );
  static dynamic percentTarget(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2CM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].status''',
      );
  static dynamic messageLayer2CM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].message''',
      );
  static dynamic statusLayer2LM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].status''',
      );
  static dynamic messageLayer2LM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].message''',
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchCode''',
      );
  static dynamic branchNameLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchName''',
      );
  static dynamic successPercentLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessPercent''',
      );
  static dynamic succesFlagLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].SuccessFlag''',
      );
  static dynamic targetSuccessLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].TargetPercent''',
      );
  static dynamic regionCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionCode''',
      );
  static dynamic regionNameLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].RegionName''',
      );
  static dynamic areaCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaCode''',
      );
  static dynamic areaNameLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].AreaName''',
      );
  static dynamic branchCodeCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchCode''',
      );
  static dynamic branchNameCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchName''',
      );
  static dynamic successPercentCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessPercent''',
      );
  static dynamic succesFlagCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].SuccessFlag''',
      );
  static dynamic targetSuccessCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].TargetPercent''',
      );
  static dynamic regionCodeCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionCode''',
      );
  static dynamic regionNameCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].RegionName''',
      );
  static dynamic areaCodeCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaCode''',
      );
  static dynamic areaNameCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].AreaName''',
      );
  static dynamic branchDetailCM(dynamic response) => getJsonField(
        response,
        r'''$.info.CurrentMonth[:].currentMonth[:].BranchDetail''',
      );
  static dynamic branchDetailLM(dynamic response) => getJsonField(
        response,
        r'''$.info.LastMonth[:].lastMonth[:].BranchDetail''',
      );
}

class GetWelfareKpiLastMonthAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_code''',
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_name''',
      );
  static dynamic percentSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_percent''',
      );
  static dynamic flagSuccess(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].success_flag''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].kpi_month''',
      );
  static dynamic percentTarget(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].target_percent''',
      );
  static dynamic branchDetail(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].branch_detail''',
      );
}

class LeaveDayAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic connectStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic connectionMessage(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic dateInfo(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
        true,
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic statusCheckCount(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].StatusCheckCount''',
        true,
      );
  static dynamic totalLeave(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].TotalLeave''',
        true,
      );
  static dynamic countLeave(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].CountLeave''',
        true,
      );
  static dynamic leaveTypeDay(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].LeaveDay''',
        true,
      );
  static dynamic leaveTypeName(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].LeaveName''',
        true,
      );
  static dynamic leaveTypeId(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].LeaveID''',
        true,
      );
}

class LogoutAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
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
  }) {
    final body = '''
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
  "VLoan_Server": "${vLoanServer}"
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
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
  }) {
    final body = '''
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
  "VLoan_Server": "${vLoanServer}"
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class GetMaterialAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic checkinDate(dynamic response) => getJsonField(
        response,
        r'''$.info.Date''',
        true,
      );
  static dynamic checkinTime(dynamic response) => getJsonField(
        response,
        r'''$.info.Time''',
        true,
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.status_code''',
      );
  static dynamic mainStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic recordID(dynamic response) => getJsonField(
        response,
        r'''$.info.Timesheet.Data.RecordId''',
      );
}

class OpsAPICall {
  static Future<ApiCallResponse> call({
    String? coordinate = '',
    String? branchCode = '',
    String? assetRef = '',
    String? assetType = '',
    String? assetDetail = '',
    String? remark = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NpaCheckAssetIdAPICall {
  static Future<ApiCallResponse> call({
    String? assetid = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic resultResponse(dynamic response) => getJsonField(
        response,
        r'''$.d''',
      );
}

class ListAPITestCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'listAPITest',
      apiUrl: 'https://reqres.in/api/unknown',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
}

class GetVloanContractAPICall {
  static Future<ApiCallResponse> call({
    String? cuscod = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getVloanContractAPI',
      apiUrl: 'http://115.31.145.26/api/v1/branchview/contract',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic YnJhbmNodmlldzpidjEyMzQq',
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
    );
  }

  static dynamic contNo(dynamic response) => getJsonField(
        response,
        r'''$.contract.*[0]''',
        true,
      );
  static dynamic customerName(dynamic response) => getJsonField(
        response,
        r'''$.contract.*[3]''',
        true,
      );
  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
      );
  static dynamic vloanServer(dynamic response) => getJsonField(
        response,
        r'''$.contract.*[4]''',
        true,
      );
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
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'remarkVLoneAPI',
      apiUrl: 'http://115.31.145.26/api/v1/branchview/remark',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic YnJhbmNodmlldzpidjEyMzQq',
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
    );
  }

  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.result''',
      );
}

class GetlocationAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branch = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic group(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Group''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_CODE''',
        true,
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_NAME''',
        true,
      );
  static dynamic branchLat(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].LATITUDE''',
        true,
      );
  static dynamic branchLong(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].LONGITUDE''',
        true,
      );
  static dynamic branchRadius(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location[:].RADIUS''',
        true,
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic statusLayer3(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location.status''',
      );
}

class GetBranchAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? type = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].BranchCode''',
        true,
      );
  static dynamic branchName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].BranchName''',
        true,
      );
  static dynamic regionCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].RegionCode''',
        true,
      );
  static dynamic regionName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].RegionName''',
        true,
      );
  static dynamic areaCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].AreaCode''',
        true,
      );
  static dynamic areaName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].AreaName''',
        true,
      );
  static dynamic groupCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].GroupCode''',
        true,
      );
  static dynamic branchSize(dynamic response) => getJsonField(
        response,
        r'''$.info[:].branch[:].BranchSize''',
        true,
      );
}

class GetRegionAreaAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branchType = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic areaCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaCode''',
        true,
      );
  static dynamic areaName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].AreaName''',
        true,
      );
  static dynamic areaType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].area[:].Type''',
        true,
      );
  static dynamic regionCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].region[:].RegionCode''',
        true,
      );
  static dynamic regionName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].region[:].RegionName''',
        true,
      );
  static dynamic regionType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].region[:].Type''',
        true,
      );
}

class GetEmployeeIdFromNicknameAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? searchName = '',
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].EmpCode''',
        true,
      );
  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].FirstName''',
        true,
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].LastName''',
        true,
      );
  static dynamic nickName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].NickName''',
        true,
      );
  static dynamic mapNickname(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].MapNickName''',
        true,
      );
  static dynamic branch(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].Brach''',
        true,
      );
  static dynamic getKeyWordName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail[:].GetKeyWord''',
        true,
      );
  static dynamic detailMessage(dynamic response) => getJsonField(
        response,
        r'''$.info[:].detail''',
        true,
      );
}

class CheckinAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? latitude = '',
    String? urlImg = '',
    String? branch = '',
    String? token = '',
    String? longitude = '',
  }) {
    final body = '''
{
  "token": "${token}",
  "branch": "${branch}",
  "latitude": "${latitude}",
  "longitude": "${longitude}",
  "api_url": "${apiUrl}",
  "url_img": "${urlImg}"
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic checkinMessage(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
}

class GetDateTimeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic currentDate(dynamic response) => getJsonField(
        response,
        r'''$.info.Date''',
      );
  static dynamic currentTime(dynamic response) => getJsonField(
        response,
        r'''$.info.Time''',
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info[:].info''',
      );
  static dynamic countCalled(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CountCall''',
      );
}

class CheckinoutThisMonthAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic flagCheck(dynamic response) => getJsonField(
        response,
        r'''$.Detail.flag''',
      );
  static dynamic listBranchCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      );
  static dynamic listTimeCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      );
  static dynamic listDateCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      );
  static dynamic listActionStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      );
  static dynamic listCheckinoutDate(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic workInStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      );
  static dynamic workInDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      );
  static dynamic workInTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      );
  static dynamic workOutStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      );
  static dynamic workOutDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      );
  static dynamic workOutTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      );
}

class CheckinoutLastMonthAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
  static dynamic flagCheck(dynamic response) => getJsonField(
        response,
        r'''$.Detail.flag''',
      );
  static dynamic listBranchCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].BRANCH_HERE''',
        true,
      );
  static dynamic listTimeCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].TIME''',
        true,
      );
  static dynamic listDateCheckin(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE_FLAG''',
        true,
      );
  static dynamic listActionStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].STATUS_CHECK''',
        true,
      );
  static dynamic listCheckinoutDate(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].DATE''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].YMD''',
        true,
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic workInStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkIN''',
        true,
      );
  static dynamic workInDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateIn''',
        true,
      );
  static dynamic workInTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeIn''',
        true,
      );
  static dynamic workOutStatus(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkOUT''',
        true,
      );
  static dynamic workOutDateTH(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkDateOut''',
        true,
      );
  static dynamic workOutTime(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info[:].WorkTimeOut''',
        true,
      );
}

class GetTargetContractKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantity(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLastMonth(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic positionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actualLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantityLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic monthLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
}

class GetEmpTargetContractKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? empCode = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantity(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLastMonth(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic positionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic productTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic actualLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetQuantityLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic monthLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic employeeIdTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      );
}

class GetTargetBudgetKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      );
  static dynamic branchCodeTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      );
  static dynamic targetBudget(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      );
  static dynamic targetBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic areaGradeTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
      );
  static dynamic areaTypeTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
      );
  static dynamic ageOfPositionTM(dynamic response) => getJsonField(
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
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      );
  static dynamic employeeIDLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      );
  static dynamic branchCodeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Department''',
      );
}

class GetEmpTargetBudgetKPIAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? empCode = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
      );
  static dynamic targetBudget(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
      );
  static dynamic targetBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic employeeIdTM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic targetBudget(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic targetBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetKEYINCSHPRC''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
  static dynamic areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
}

class GetTargetContractKpiCEOAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? branchCode = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic dataInfo(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo''',
        true,
      );
  static dynamic position(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Position''',
        true,
      );
  static dynamic branchCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Department''',
        true,
      );
  static dynamic actual(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].YearMonth''',
        true,
      );
  static dynamic areaRespons(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.status''',
      );
  static dynamic messageLayer3LM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.message''',
      );
  static dynamic dataInfoLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo''',
        true,
      );
  static dynamic actualBudgetLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].Actual''',
        true,
      );
  static dynamic areaResponsLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaOfRespons''',
        true,
      );
  static dynamic statusLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.status''',
      );
  static dynamic messageLayer3TM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.message''',
      );
  static dynamic employeeID(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic employeeIdLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].EmpCode''',
        true,
      );
  static dynamic productType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic targetQuantity(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic productTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].ProductType''',
        true,
      );
  static dynamic targetQuantityLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].TargetQuantity''',
        true,
      );
  static dynamic areaGradeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionCM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].currentMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
  static dynamic areaGradeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaGrade''',
        true,
      );
  static dynamic areaTypeLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AreaType''',
        true,
      );
  static dynamic ageOfPositionLM(dynamic response) => getJsonField(
        response,
        r'''$.info[:].lastMonth.DataInfo[:].AgeOfPosition''',
        true,
      );
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
  }) {
    final companyId = _serializeList(companyIdList);
    final coverType = _serializeList(coverTypeList);

    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
  static dynamic coverType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type''',
        true,
      );
  static dynamic fullName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      );
  static dynamic grossTotal(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].gross_total''',
        true,
      );
  static dynamic expiryDate(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].expiry_date''',
        true,
      );
  static dynamic pa(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].pa''',
        true,
      );
  static dynamic tppd(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].tppd''',
        true,
      );
  static dynamic sumInsured(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].sum_insured''',
        true,
      );
  static dynamic garageType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].garage_type''',
        true,
      );
  static dynamic brandCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_code''',
        true,
      );
  static dynamic brandName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_name''',
        true,
      );
  static dynamic modelCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].model_code''',
        true,
      );
  static dynamic modelName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].model_name''',
        true,
      );
  static dynamic actAmount(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].act_amount''',
        true,
      );
  static dynamic statusLayer1Message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic dataList(dynamic response) => getJsonField(
        response,
        r'''$.results.data''',
        true,
      );
  static dynamic serialName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].serial_name''',
        true,
      );
}

class TeleGetBrandAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalBrand(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic brandID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      );
  static dynamic brandName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      );
  static dynamic brandType(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].type''',
        true,
      );
}

class TeleGetModelAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalModel(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic brandID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].brand_id''',
        true,
      );
  static dynamic modelName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].name''',
        true,
      );
  static dynamic modelCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      );
  static dynamic modelVehicleGroup(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].veh_group''',
        true,
      );
  static dynamic modelNubmerSeat(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].no_seats''',
        true,
      );
  static dynamic modelEnginCapacity(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].engine_capacity''',
        true,
      );
  static dynamic modelWeight(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].weight''',
        true,
      );
}

class TeleGetInsurersAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalInsurers(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic companyCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].code''',
        true,
      );
  static dynamic companyShortName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].short_name''',
        true,
      );
  static dynamic companyFullName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].full_name''',
        true,
      );
  static dynamic companyID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].company_id''',
        true,
      );
}

class TeleGetProvinceAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalProvince(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic provinceID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      );
  static dynamic provinceNameTH(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      );
  static dynamic provinceNameEN(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      );
}

class TeleGetGarageTypeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalProvince(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic provinceID(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_id''',
        true,
      );
  static dynamic provinceNameTH(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_th''',
        true,
      );
  static dynamic provinceNameEN(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].prov_en''',
        true,
      );
}

class TeleGetCoverTypeAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLevel1(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic totalProvince(dynamic response) => getJsonField(
        response,
        r'''$.results.total''',
      );
  static dynamic coverTypeName(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type_name''',
        true,
      );
  static dynamic coverTypeCode(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type_code''',
        true,
      );
  static dynamic coverTypeId(dynamic response) => getJsonField(
        response,
        r'''$.results.data[:].cover_type_id''',
        true,
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoMessage(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoMessage(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
}

class LeaveListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic headBefore(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      );
  static dynamic headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic headAfter(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      );
  static dynamic userPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic checkEdit(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      );
}

class ResignListAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic headBefore(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadBefore''',
        true,
      );
  static dynamic headOfWork(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveStartDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDateStart''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic headAfter(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].HeadOfWork.HeadAfter''',
        true,
      );
  static dynamic userPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic checkEdit(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CheckEdit''',
        true,
      );
  static dynamic otherAsset(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].OtherAsset''',
        true,
      );
  static dynamic asset(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Asset''',
        true,
      );
  static dynamic postCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].PostCode''',
        true,
      );
  static dynamic subDistrict(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].SubDistrict''',
        true,
      );
  static dynamic district(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].District''',
        true,
      );
  static dynamic province(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Province''',
        true,
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Address''',
        true,
      );
  static dynamic flagComback(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FlagComeBack''',
        true,
      );
  static dynamic otherReasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].OtherReasonResign''',
        true,
      );
  static dynamic reasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      );
  static dynamic cancelBy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CancelBy''',
        true,
      );
  static dynamic leaveDateEnd(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDateEnd''',
        true,
      );
}

class LeaveListAprroveAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic leaveUserName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      );
  static dynamic userPhoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Tel''',
        true,
      );
  static dynamic reasonResign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ReasonResign''',
        true,
      );
  static dynamic empIdBoss1(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Username_O''',
      );
  static dynamic fcmBoss1(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Head_O''',
      );
  static dynamic empIdBoss2(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Username_T''',
      );
  static dynamic fcmBoss2(dynamic response) => getJsonField(
        response,
        r'''$.info.fcm.Head_T''',
      );
}

class LeaveListAprroveTwoAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic createDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].CreateDate''',
        true,
      );
  static dynamic leaveStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveStatus''',
        true,
      );
  static dynamic leaveDocument(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDocument''',
        true,
      );
  static dynamic leaveReason(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveReason''',
        true,
      );
  static dynamic leavePeriod(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeavePeriod''',
        true,
      );
  static dynamic leaveDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveDate''',
        true,
      );
  static dynamic leaveCountDay(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveCountDay''',
        true,
      );
  static dynamic leaveName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].LeaveName''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic leaveID(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].ID''',
        true,
      );
  static dynamic leaveUserName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].FullName''',
        true,
      );
}

class LeaveListCancelAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? reasonCancel = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoDetail(dynamic response) => getJsonField(
        response,
        r'''$.info.detail''',
      );
}

class LeaveFlagApproveAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? flagApprove = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
}

class SendFCMNotificationAPICall {
  static Future<ApiCallResponse> call({
    String? to = '',
    dynamic? notificationJson,
    dynamic? dataJson,
  }) {
    final notification = _serializeJson(notificationJson);
    final data = _serializeJson(dataJson);
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  static dynamic failure(dynamic response) => getJsonField(
        response,
        r'''$.failure''',
      );
  static dynamic errerMessage(dynamic response) => getJsonField(
        response,
        r'''$.results[:].error''',
      );
  static dynamic messageID(dynamic response) => getJsonField(
        response,
        r'''$.results[:].message_id''',
      );
}

class LeaveFlagApproveTwoAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leaveId = '',
    String? flagApprove = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic infoStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic infoInfo(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
}

class GetProvinceAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic provCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      );
  static dynamic provName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ProvName''',
        true,
      );
}

class ChangeLocationAPICall {
  static Future<ApiCallResponse> call({
    String? latitude = '',
    String? longitude = '',
    String? flag = '',
    String? branchCode = '',
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      apiUrl: '${apiUrl}/api/fordevelop/change-location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.status''',
      );
  static dynamic oldLat(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.info[:].LATITUDE''',
      );
  static dynamic oldLng(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.info[:].LONGITUDE''',
      );
  static dynamic statusConfirm(dynamic response) => getJsonField(
        response,
        r'''$.returnDataToEdit.status''',
      );
  static dynamic messageView(dynamic response) => getJsonField(
        response,
        r'''$.returnDataView.message''',
      );
  static dynamic messageEdit(dynamic response) => getJsonField(
        response,
        r'''$.returnDataToEdit.message''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetBossAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic bossCheck(dynamic response) => getJsonField(
        response,
        r'''$.Detail.info''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.Detail.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.Detail.status''',
      );
}

class GetHolidayAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic holidayDate(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].DATE_OF_YEAR''',
        true,
      );
  static dynamic holidayName(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].NAME_TH''',
        true,
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
}

class GetDistrictAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? provCode = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic provCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ProvCode''',
        true,
      );
  static dynamic postCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].PostCode''',
        true,
      );
  static dynamic districtName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictName''',
        true,
      );
  static dynamic districtCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      );
}

class GetLeadCalledStatusDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadChannel = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic callStatusId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      );
  static dynamic channel(dynamic response) => getJsonField(
        response,
        r'''$.info[:].Channel''',
        true,
      );
  static dynamic callStatusType(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusType''',
        true,
      );
  static dynamic callStatusCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusCode''',
        true,
      );
  static dynamic callStatusName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusName''',
        true,
      );
}

class GetLeadCalledHistoryAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadID = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.message''',
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
      );
  static dynamic callStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallStatus''',
        true,
      );
  static dynamic reasonName(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryReasonName''',
        true,
      );
  static dynamic note(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryNote''',
        true,
      );
  static dynamic callTime(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryCallTime''',
        true,
      );
  static dynamic historyStatus(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryStatus''',
        true,
      );
  static dynamic employeeId(dynamic response) => getJsonField(
        response,
        r'''$.info.Data[:].HistoryUserID''',
        true,
      );
}

class SaveCallStatusAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadID = '',
    String? statusCallID = '',
    String? reasonID = '',
    String? reasonDetail = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info[:].info''',
      );
  static dynamic callStatus(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.call''',
      );
  static dynamic callStatusReason(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.callStatus''',
      );
  static dynamic statusReasonDetail(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.callReason''',
      );
}

class GetLeadReasonCallDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? callStatusId = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic messageLayer1(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic callStatusId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      );
  static dynamic reasonId(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ReasonID''',
        true,
      );
  static dynamic reasonName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].ReasonName''',
        true,
      );
}

class GetSubDistrictAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? districtCode = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic districtCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].DistrictCode''',
        true,
      );
  static dynamic subName(dynamic response) => getJsonField(
        response,
        r'''$.info[:].SubDistrictName''',
        true,
      );
  static dynamic subCode(dynamic response) => getJsonField(
        response,
        r'''$.info[:].SubDistrictCode''',
        true,
      );
}

class ThaipaiboonAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statusLayer1(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Date''',
        true,
      );
  static dynamic empCode(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].EmpCode''',
        true,
      );
  static dynamic statuslayer2(dynamic response) => getJsonField(
        response,
        r'''$.info.status''',
      );
  static dynamic groupCampaign(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].GroupCampaign''',
        true,
      );
  static dynamic premiums(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].Premiums''',
        true,
      );
  static dynamic noOfPolicy(dynamic response) => getJsonField(
        response,
        r'''$.info.info[:].NoOfPolicy''',
        true,
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info.info''',
        true,
      );
}

class GetUniversalTimeCall {
  static Future<ApiCallResponse> call() {
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
    );
  }

  static dynamic unixTime(dynamic response) => getJsonField(
        response,
        r'''$.unixtime''',
      );
  static dynamic dateTime(dynamic response) => getJsonField(
        response,
        r'''$.datetime''',
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
