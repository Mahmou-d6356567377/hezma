class AddressData {
  int? id;
  String? name;
  String? lat;
  String? lng;
  String? address;
  String? distance;

  AddressData({
    this.id,
    this.name,
    this.lat,
    this.lng,
    this.address,
    this.distance,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        address: json['address'] as String?,
        distance: json['distance'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lat': lat,
        'lng': lng,
        'address': address,
        'distance': distance,
      };
}
