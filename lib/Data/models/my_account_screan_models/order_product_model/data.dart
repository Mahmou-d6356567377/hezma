import 'address.dart';
import 'cart.dart';
import 'order_delivery_time.dart';
import 'user.dart';

class OrderProductModel {
  int? orderId;
  int? usedCoupon;
  String? couponPrice;
  String? couponCode;
  String? totalPrice;
  int? productsPrice;
  String? shipping;
  String? tax;
  int? status;
  String? statusName;
  int? tracking;
  String? trackingName;
  String? paymentMethod;
  String? orderDate;
  String? orderTime;
  String? orderDeliveryData;
  OrderDeliveryTime? orderDeliveryTime;
  List<Cart>? cart;
  User? user;
  Address? address;

  OrderProductModel({
    this.orderId,
    this.usedCoupon,
    this.couponPrice,
    this.couponCode,
    this.totalPrice,
    this.productsPrice,
    this.shipping,
    this.tax,
    this.status,
    this.statusName,
    this.tracking,
    this.trackingName,
    this.paymentMethod,
    this.orderDate,
    this.orderTime,
    this.orderDeliveryData,
    this.orderDeliveryTime,
    this.cart,
    this.user,
    this.address,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        orderId: json['order_id'] as int?,
        usedCoupon: json['used_coupon'] as int?,
        couponPrice: json['coupon_price'] as String?,
        couponCode: json['coupon_code'] as String?,
        totalPrice: json['total_price'] as String?,
        productsPrice: json['products_price'] as int?,
        shipping: json['shipping'] as String?,
        tax: json['tax'] as String?,
        status: json['status'] as int?,
        statusName: json['status_name'] as String?,
        tracking: json['tracking'] as int?,
        trackingName: json['tracking_name'] as String?,
        paymentMethod: json['payment_method'] as String?,
        orderDate: json['order_date'] as String?,
        orderTime: json['order_time'] as String?,
        orderDeliveryData: json['order_delivery_data'] as String?,
        orderDeliveryTime: json['order_delivery_time'] == null
            ? null
            : OrderDeliveryTime.fromJson(
                json['order_delivery_time'] as Map<String, dynamic>),
        cart: (json['cart'] as List<dynamic>?)
            ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
            .toList(),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'used_coupon': usedCoupon,
        'coupon_price': couponPrice,
        'coupon_code': couponCode,
        'total_price': totalPrice,
        'products_price': productsPrice,
        'shipping': shipping,
        'tax': tax,
        'status': status,
        'status_name': statusName,
        'tracking': tracking,
        'tracking_name': trackingName,
        'payment_method': paymentMethod,
        'order_date': orderDate,
        'order_time': orderTime,
        'order_delivery_data': orderDeliveryData,
        'order_delivery_time': orderDeliveryTime?.toJson(),
        'cart': cart?.map((e) => e.toJson()).toList(),
        'user': user?.toJson(),
        'address': address?.toJson(),
      };
}
