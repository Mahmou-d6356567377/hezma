class PayDatum {
  int? id;
  String? name;
  String? desc;
  String? image;
  String? type;

  PayDatum({this.id, this.name, this.desc, this.image, this.type});

  factory PayDatum.fromJson(Map<String, dynamic> json) => PayDatum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        desc: json['desc'] as String?,
        image: json['image'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'desc': desc,
        'image': image,
        'type': type,
      };
}
