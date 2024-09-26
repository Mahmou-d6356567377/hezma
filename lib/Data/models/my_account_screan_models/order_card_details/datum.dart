class OrderData {
  int? orderId;
  int? usedCoupon;
  String? couponPrice;
  String? couponCode;
  String? totalPrice;
  String? date;
  int? type;
  String? paymentMethod;

  OrderData({
    this.orderId,
    this.usedCoupon,
    this.couponPrice,
    this.couponCode,
    this.totalPrice,
    this.date,
    this.type,
    this.paymentMethod,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        orderId: json['order_id'] as int?,
        usedCoupon: json['used_coupon'] as int?,
        couponPrice: json['coupon_price'] as String?,
        couponCode: json['coupon_code'] as String?,
        totalPrice: json['total_price'] as String?,
        date: json['date'] as String?,
        type: json['type'] as int?,
        paymentMethod: json['payment_method'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'used_coupon': usedCoupon,
        'coupon_price': couponPrice,
        'coupon_code': couponCode,
        'total_price': totalPrice,
        'date': date,
        'type': type,
        'payment_method': paymentMethod,
      };
}
