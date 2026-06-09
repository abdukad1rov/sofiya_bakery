import 'package:flutter/foundation.dart';
import 'package:shop_app/src/core/models/product_model.dart';

class OrderModel {
  final int id;
  final int userId;
  final String description;
  final String locationLink;
  final String totalPrice;
  final DateTime createdAt;
  final bool isAccepted;
  final bool isProcess;
  final bool isDelivered;
  final bool isCompleted;
  final bool isCanceled;
  final List<ProductModel> productsList;

  OrderModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.locationLink,
    required this.totalPrice,
    required this.createdAt,
    required this.isAccepted,
    required this.isProcess,
    required this.isDelivered,
    required this.isCompleted,
    required this.isCanceled,
    required this.productsList,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> productsList = [];
    if (json['productsList'] != null) {
      productsList = (json['productsList'] as List<dynamic>)
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    }

    return OrderModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      description: json['description'] as String,
      locationLink: json['locationLink'] as String,
      totalPrice: json['totalPrice'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isAccepted: json['isAccepted'] as bool,
      isProcess: json['isProcess'] as bool,
      isDelivered: json['isDelivered'] as bool,
      isCompleted: json['isCompleted'] as bool,
      isCanceled: json['isCanceled'] as bool,
      productsList: productsList,
    );
  }

  Map<String, Object?> toJson(List<Map<String, int>> productList) =>
      <String, Object?>{
        'id': id,
        'user_id': userId,
        'description': description,
        'locationLink': locationLink,
        'totalPrice': totalPrice,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'isAccepted': isAccepted,
        'isProcess': isProcess,
        'isDelivered': isDelivered,
        'isCompleted': isCompleted,
        'isCanceled': isCanceled,
        'productsList': productList,
      };

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.description == description &&
        other.locationLink == locationLink &&
        other.totalPrice == totalPrice &&
        other.createdAt == createdAt &&
        other.isAccepted == isAccepted &&
        other.isProcess == isProcess &&
        other.isDelivered == isDelivered &&
        other.isCompleted == isCompleted &&
        other.isCanceled == isCanceled &&
        listEquals(other.productsList, productsList);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      description.hashCode ^
      locationLink.hashCode ^
      totalPrice.hashCode ^
      createdAt.hashCode ^
      isAccepted.hashCode ^
      isProcess.hashCode ^
      isDelivered.hashCode ^
      isCompleted.hashCode ^
      isCanceled.hashCode ^
      productsList.hashCode;

  OrderModel copyWith({
    int? id,
    int? userId,
    String? description,
    String? locationLink,
    String? totalPrice,
    DateTime? createdAt,
    bool? isAccepted,
    bool? isProcess,
    bool? isDelivered,
    bool? isCompleted,
    bool? isCanceled,
    List<ProductModel>? productsList,
  }) =>
      OrderModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        description: description ?? this.description,
        locationLink: locationLink ?? this.locationLink,
        totalPrice: totalPrice ?? this.totalPrice,
        createdAt: createdAt ?? this.createdAt,
        isAccepted: isAccepted ?? this.isAccepted,
        isProcess: isProcess ?? this.isProcess,
        isDelivered: isDelivered ?? this.isDelivered,
        isCompleted: isCompleted ?? this.isCompleted,
        isCanceled: isCanceled ?? this.isCanceled,
        productsList: productsList ?? this.productsList,
      );

  @override
  String toString() => 'OrderModel(id: $id,'
      'userId: $userId,'
      'description: $description,'
      'locationLink: $locationLink,'
      'totalPrice: $totalPrice,'
      'createdAt: $createdAt,'
      'isAccepted: $isAccepted,'
      'isProcess: $isProcess,'
      'isDelivered: $isDelivered,'
      'isCompleted: $isCompleted,'
      'isCanceled: $isCanceled,'
      'productsList: $productsList)';
}
