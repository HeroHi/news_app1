class BaseResponse {
  String? status;
  String? code;
  String? message;
  BaseResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }
}
