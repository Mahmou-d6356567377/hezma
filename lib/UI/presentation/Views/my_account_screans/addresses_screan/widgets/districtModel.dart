class ModelOfDistractis {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double distance;

  ModelOfDistractis({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.distance,
  });

  factory ModelOfDistractis.fromJson(Map<String, dynamic> json) {
    return ModelOfDistractis(
      id: json['id'],
      name: json['name'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      distance: double.parse(json['distance']),
    );
  }
}