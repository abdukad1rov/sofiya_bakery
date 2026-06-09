import 'package:flutter/foundation.dart';
import 'package:shop_app/src/core/models/order_model.dart';

class UserModel {
  final int id;
  final String fullName;
  final String phoneNumber;
  final String password;
  final List<int> favoriteProducts;
  final List<OrderModel> orders;

  UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.password,
    required this.favoriteProducts,
    required this.orders,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    List<int> favoriteProductsList = [];

    if (json['favoriteProducts'] != null) {
      if (json['favoriteProducts'] is List) {
        favoriteProductsList = List<int>.from(json['favoriteProducts']);
      } else {
        favoriteProductsList.add(json['favoriteProducts'] as int);
      }
    }

    List<OrderModel> ordersList = [];
    if (json['orders'] != null) {
      ordersList = (json['orders'] as List<dynamic>)
          .map((orderJson) => OrderModel.fromJson(orderJson))
          .toList();
    }

    return UserModel(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      favoriteProducts: favoriteProductsList,
      orders: ordersList,
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'password': password,
        'favoriteProducts': favoriteProducts,
        'orders': orders.map((x) => x.toJson([{}])).toList(),
      };

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.password == password &&
        listEquals(other.favoriteProducts, favoriteProducts) &&
        listEquals(other.orders, orders);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      fullName.hashCode ^
      phoneNumber.hashCode ^
      password.hashCode ^
      favoriteProducts.hashCode ^
      orders.hashCode;

  UserModel copyWith({
    int? id,
    String? fullName,
    String? phoneNumber,
    String? password,
    List<int>? favoriteProducts,
    List<OrderModel>? orders,
  }) =>
      UserModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        favoriteProducts: favoriteProducts ?? this.favoriteProducts,
        orders: orders ?? this.orders,
      );

  @override
  String toString() => 'UserModel(id: $id,'
      'fullName: $fullName,'
      'phoneNumber: $phoneNumber,'
      'password: $password,'
      'favoriteProducts: $favoriteProducts,'
      'orders: $orders)';
}
