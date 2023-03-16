import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final String name;
  final String price;
  final String category;
  final String type;
  final String brand;
  final String model;
  final int userId;
  final int companyId;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.type,
    required this.brand,
    required this.model,
    required this.userId,
    required this.companyId,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
      type: json['type'],
      brand: json['brand'],
      model: json['model'],
      userId: json['user_id'],
      companyId: json['company_id'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'category': category,
        'type': type,
        'brand': brand,
        'model': model,
        'user_id': userId,
        'company_id': companyId,
        'description': description,
      };
}
