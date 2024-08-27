import 'data.dart';

class LoginModel {
  bool? status;
  String? message;
  LoginData? data;
  String? token;

  LoginModel({this.status, this.message, this.data, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : LoginData.fromJson(json['data'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
        'token': token,
      };
}
