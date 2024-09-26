import 'datum.dart';

class CartProduct {
  bool? status;
  String? message;
  List<CartProductModel>? data;

  CartProduct({this.status, this.message, this.data});

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
