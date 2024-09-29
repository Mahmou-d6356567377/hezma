import 'datum.dart';

class SettingModel {
  bool? status;
  String? message;
  List<settingModel1>? data;

  SettingModel({this.status, this.message, this.data});

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => settingModel1.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
