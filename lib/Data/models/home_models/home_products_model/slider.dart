import 'package:collection/collection.dart';

class Slider {
  int? id;
  String? name;
  String? title;
  String? image;

  Slider({this.id, this.name, this.title, this.image});

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json['id'] as int?,
        name: json['name'] as String?,
        title: json['title'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'image': image,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Slider) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ title.hashCode ^ image.hashCode;
}
