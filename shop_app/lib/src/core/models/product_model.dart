class ProductModel {
  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.count,
  });

  final int id;
  final String image;
  final String name;
  final String price;
  final String description;
  final int categoryId;
  final int count;

  factory ProductModel.fromJson(Map<String, Object?> json) => ProductModel(
        id: json['id'] as int,
        image: json['image'] as String,
        name: json['name'] as String,
        price: json['price'] as String,
        description: json['description'] as String,
        categoryId: json['category_id'] as int,
        count: json['count'] as int,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'image': image,
        'name': name,
        'price': price,
        'description': description,
        'categoryId': categoryId,
        'count': count,
      };

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.name == name &&
        other.price == price &&
        other.description == description &&
        other.categoryId == categoryId &&
        other.count == count;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      image.hashCode ^
      name.hashCode ^
      price.hashCode ^
      description.hashCode ^
      categoryId.hashCode ^
      count.hashCode;

  ProductModel copyWith({
    int? id,
    String? image,
    String? name,
    String? price,
    String? description,
    int? categoryId,
    int? count,
  }) =>
      ProductModel(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        price: price ?? this.price,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        count: count ?? this.count,
      );

  @override
  String toString() => 'ProductModel(id: $id,'
      'image: $image,'
      'name: $name,'
      'price: $price,'
      'description: $description,'
      'categoryId: $categoryId,'
      'count: $count)';
}
