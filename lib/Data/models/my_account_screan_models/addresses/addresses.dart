import 'data.dart';

class Addresses {
  bool? status;
  String? message;
  AddressData? data;

  Addresses({this.status, this.message, this.data});

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : AddressData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
