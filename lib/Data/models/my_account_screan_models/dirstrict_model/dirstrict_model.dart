import 'datum.dart';

class DirstrictModel1 {
  bool? status;
  String? message;
  List<DistrictModel>? data;

  DirstrictModel1({this.status, this.message, this.data});

  factory DirstrictModel1.fromJson(Map<String, dynamic> json) {
    return DirstrictModel1(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DistrictModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
