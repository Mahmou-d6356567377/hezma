import 'data.dart';

class OrderProductModel1 {
  bool? status;
  String? message;
  OrderProductModel1? data;

  OrderProductModel1({this.status, this.message, this.data});

  factory OrderProductModel1.fromJson(Map<String, dynamic> json) {
    return OrderProductModel1(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OrderProductModel1.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
