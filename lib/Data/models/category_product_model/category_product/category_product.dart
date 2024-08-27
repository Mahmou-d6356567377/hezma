class CategoryProduct {
  int? id;
  String? name;
  int? categoryId;
  String? image;

  CategoryProduct({this.id, this.name, this.categoryId, this.image});

  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      CategoryProduct(
        id: json['id'] as int?,
        name: json['name'] as String?,
        categoryId: json['category_id'] as int?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category_id': categoryId,
        'image': image,
      };
}
