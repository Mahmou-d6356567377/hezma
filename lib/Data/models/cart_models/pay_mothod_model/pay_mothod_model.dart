import 'datum.dart';

class PayMothodModel {
  bool? status;
  String? message;
  List<PayDatum>? data;

  PayMothodModel({this.status, this.message, this.data});

  factory PayMothodModel.fromJson(Map<String, dynamic> json) {
    return PayMothodModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PayDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
