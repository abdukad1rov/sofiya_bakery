class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
  });

  final int id;
  final String name;
  final String logo;
  final String description;

  factory CategoryModel.fromJson(Map<String, Object?> json) => CategoryModel(
        id: json['id'] as int,
        name: json['name'] as String,
        logo: json['logo'] as String,
        description: json['description'] as String? ?? '',
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'name': name,
        'logo': logo,
        'description': description,
      };

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.logo == logo &&
        other.description == description;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ logo.hashCode ^ description.hashCode;

  CategoryModel copyWith({
    int? id,
    String? name,
    String? logo,
    String? description,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        logo: logo ?? this.logo,
        description: description ?? this.description,
      );

  @override
  String toString() => 'CategoryModel(id: $id,'
      'name: $name,'
      'logo: $logo,'
      'description: $description)';
}
