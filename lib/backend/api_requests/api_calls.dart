import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AuthenAPICall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? apiUrl = '1',
  }) {
    final body = '''
{
  "username": "${username}",
  "password": "${password}",
  "api_url": "${apiUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'authenAPI',
      apiUrl: '${apiUrl}/api/login',
      callType: ApiCallType.POST,
      headers: {
        'ContentType': 'application/json; charset=utf-8,',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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

class TimesheetDetailAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? apiUrl = '',
    String? pageName = '',
    String? recordId = '',
  }) {
    final body = '''
{
  "token": "${token}",
  "api_url": "${apiUrl}",
  "page_name": "${pageName}",
  "RecordId": "${recordId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TimesheetDetailAPI',
      apiUrl: '${apiUrl}/api/detail/${pageName}/${recordId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      apiUrl: 'http://49.229.60.115/api/v1/branchview/contract',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic bmV3QlZBdXRoOjEyMzQ1Ng==',
      },
      params: {
        'func': "get_contract",
        'cuscod': cuscod,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
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
