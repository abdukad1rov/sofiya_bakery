class PosterModel {
  const PosterModel({
    required this.id,
    required this.image,
  });

  final int id;
  final String image;

  factory PosterModel.fromJson(Map<String, Object?> json) => PosterModel(
        id: json['id'] as int,
        image: json['image'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'image': image,
      };

  @override
  bool operator ==(covariant PosterModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;

  PosterModel copyWith({
    int? id,
    String? image,
  }) =>
      PosterModel(
        id: id ?? this.id,
        image: image ?? this.image,
      );

  @override
  String toString() => 'PosterModel(id: $id, image: $image)';
}
