import 'package:collection/collection.dart';

import 'paginate.dart';
import 'product.dart';

class Data {
  List<Product>? products;
  Paginate? paginate;

  Data({this.products, this.paginate});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        paginate: json['paginate'] == null
            ? null
            : Paginate.fromJson(json['paginate'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'paginate': paginate?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => products.hashCode ^ paginate.hashCode;
}
