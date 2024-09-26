import 'detail.dart';
import 'product.dart';

class CartProductModel {
  int? cartId;
  String? quantity;
  String? totalPrice;
  List<Detail>? details;
  Product1? product;

  CartProductModel({
    this.cartId,
    this.quantity,
    this.totalPrice,
    this.details,
    this.product,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        cartId: json['cart_id'] as int?,
        quantity: json['quantity'] as String?,
        totalPrice: json['total_price'] as String?,
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
            .toList(),
        product: json['product'] == null
            ? null
            : Product1.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'cart_id': cartId,
        'quantity': quantity,
        'total_price': totalPrice,
        'details': details?.map((e) => e.toJson()).toList(),
        'product': product?.toJson(),
      };
}
