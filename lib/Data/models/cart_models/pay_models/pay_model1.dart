import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';

class PaymentData1 {
  final int totalPrice;
  final int timeId;
  final DateTime date;
  final AddressData? addressdata;

  PaymentData1({
    required this.totalPrice,
    required this.timeId,
    required this.date,
    this.addressdata,
  });
}
