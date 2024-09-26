import 'datum.dart';
import 'extra_data.dart';

class OrderCardDetails {
  bool? status;
  String? message;
  List<OrderData>? data;
  ExtraData? extraData;

  OrderCardDetails({this.status, this.message, this.data, this.extraData});

  factory OrderCardDetails.fromJson(Map<String, dynamic> json) {
    return OrderCardDetails(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderData.fromJson(e as Map<String, dynamic>))
          .toList(),
      extraData: json['extra_data'] == null
          ? null
          : ExtraData.fromJson(json['extra_data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'extra_data': extraData?.toJson(),
      };
}
