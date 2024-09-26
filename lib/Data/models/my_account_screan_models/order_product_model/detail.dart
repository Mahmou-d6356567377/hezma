class Detail {
  final String name;
  final String price;
  final String mainSectorId;
  final String sectorTypeId;

  Detail({
    required this.name,
    required this.price,
    required this.mainSectorId,
    required this.sectorTypeId,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      name: json['name'],
      price: json['price'], // Convert to double if necessary
      mainSectorId: json['main_sector_id'],
      sectorTypeId: json['sector_type_id'],
    );
  }

  // Add this method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'main_sector_id': mainSectorId,
      'sector_type_id': sectorTypeId,
    };
  }
}
