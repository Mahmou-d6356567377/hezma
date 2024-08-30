class DistrictModel {
  int? id;
  String? name;
  String? latitude;
  String? longitude;
  String? distance;

  DistrictModel(
      {this.id, this.name, this.latitude, this.longitude, this.distance});

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        distance: json['distance'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'distance': distance,
      };
}
