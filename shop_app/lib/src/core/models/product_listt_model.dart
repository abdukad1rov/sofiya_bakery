// import 'package:flutter/foundation.dart';
// import 'product_model.dart';

// class ProductListModel {
//   const ProductListModel({required this.products});

//   final List<ProductModel> products;

//   factory ProductListModel.fromJson(Map<String, Object?> json) =>
//       ProductListModel(
//         products: List<ProductModel>.from(
//           (json['products'] as List<int>).map<ProductModel>(
//             (x) => ProductModel.fromJson(x as Map<String, Object?>),
//           ),
//         ),
//       );

//   Map<String, Object?> toJson() => <String, Object?>{
//         'products': products.map((x) => x.toJson()).toList(),
//       };

//   @override
//   bool operator ==(covariant ProductListModel other) {
//     if (identical(this, other)) return true;

//     return listEquals(other.products, products);
//   }

//   @override
//   int get hashCode => products.hashCode;

//   ProductListModel copyWith({
//     List<ProductModel>? products,
//   }) =>
//       ProductListModel(
//         products: products ?? this.products,
//       );

//   @override
//   String toString() => 'ProductListModel(products: $products)';
// }
