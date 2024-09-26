class Sector {
  int? id;
  String? name;
  String? type;
  List<dynamic>? sectorTypes;

  Sector({this.id, this.name, this.type, this.sectorTypes});

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
        id: json['id'] as int?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        sectorTypes: json['sector_types'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'sector_types': sectorTypes,
      };
}
