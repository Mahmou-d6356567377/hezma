class Detail {
  String? name;
  String? price;
  String? mainSectorId;
  String? sectorTypeId;

  Detail({
    this.name,
    this.price,
    this.mainSectorId,
    this.sectorTypeId,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    name: json['name'] as String?,
    price: json['price'] as String?,
    mainSectorId: json['main_sector_id'] as String?,
    sectorTypeId: json['sector_type_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'main_sector_id': mainSectorId,
    'sector_type_id': sectorTypeId,
  };
}
