import 'package:collection/collection.dart';

import 'data.dart';
import 'extra_data.dart';

class HomeProductsModel {
  bool? status;
  String? message;
  Data? data;
  ExtraData? extraData;

  HomeProductsModel({this.status, this.message, this.data, this.extraData});

  factory HomeProductsModel.fromJson(Map<String, dynamic> json) {
    return HomeProductsModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      extraData: json['extra_data'] == null
          ? null
          : ExtraData.fromJson(json['extra_data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
        'extra_data': extraData?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HomeProductsModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^ message.hashCode ^ data.hashCode ^ extraData.hashCode;
}
