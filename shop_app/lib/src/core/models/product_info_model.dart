class ProductInfo {
  const ProductInfo({
    required this.productId,
    required this.count,
  });

  final String productId;
  final String count;

  Map<String, Object?> toJson() => <String, Object?>{
        'productId': productId,
        'count': count,
      };

  factory ProductInfo.fromJson(Map<String, Object?> json) => ProductInfo(
        productId: json['productId'] as String,
        count: json['count'] as String,
      );

  @override
  bool operator ==(covariant ProductInfo other) {
    if (identical(this, other)) return true;

    return other.productId == productId && other.count == count;
  }

  @override
  int get hashCode => productId.hashCode ^ count.hashCode;

  ProductInfo copyWith({
    String? productId,
    String? count,
  }) =>
      ProductInfo(
        productId: productId ?? this.productId,
        count: count ?? this.count,
      );

  @override
  String toString() => 'ProductInfo('
      'productId: $productId,'
      'count: $count)';
}
