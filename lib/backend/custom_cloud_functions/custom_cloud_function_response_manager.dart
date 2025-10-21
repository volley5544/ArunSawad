import '/backend/schema/structs/index.dart';

class GetServerCurrentDateTimeCloudFunctionCallResponse {
  GetServerCurrentDateTimeCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
