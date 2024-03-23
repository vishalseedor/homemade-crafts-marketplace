import 'package:flutter/material.dart';

class CategoryByProdcuts {
  final String id;
  final String name;
  final String categoryId;
  final String file;
  final String quantity;
  final String price;

  CategoryByProdcuts(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.file,
      required this.quantity,
      required this.price});

  factory CategoryByProdcuts.fromJson(Map<String, dynamic> json) {
    return CategoryByProdcuts(
        id: json['id'],
        name: json['name'],
        categoryId: json['category_id'],
        file: json['file'],
        price: json['price'],
        quantity: json['quantity']);
  }
}
