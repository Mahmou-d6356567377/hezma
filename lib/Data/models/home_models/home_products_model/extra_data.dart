import 'package:collection/collection.dart';

import 'category.dart';
import 'city.dart';
import 'slider.dart';

class ExtraData {
  List<Category>? categories;
  List<City>? cities;
  List<Slider>? sliders;

  ExtraData({this.categories, this.cities, this.sliders});

  factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        cities: (json['cities'] as List<dynamic>?)
            ?.map((e) => City.fromJson(e as Map<String, dynamic>))
            .toList(),
        sliders: (json['sliders'] as List<dynamic>?)
            ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
        'cities': cities?.map((e) => e.toJson()).toList(),
        'sliders': sliders?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ExtraData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => categories.hashCode ^ cities.hashCode ^ sliders.hashCode;
}
