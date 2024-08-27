import 'detail.dart';

class CartProductModel {
  int? cartId;
  String? quantity;
  String? totalPrice;
  List<Detail>? details;
  dynamic product;

  CartProductModel({
    this.cartId,
    this.quantity,
    this.totalPrice,
    this.details,
    this.product,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
        cartId: json['cart_id'] as int?,
        quantity: json['quantity'] as String?,
        totalPrice: json['total_price'] as String?,
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
            .toList(),
        product: json['product'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'cart_id': cartId,
        'quantity': quantity,
        'total_price': totalPrice,
        'details': details?.map((e) => e.toJson()).toList(),
        'product': product,
      };
}
