import 'package:flutter/material.dart';

class CartModel {
  final String id;
  final String productId;
 String quantity;
  final String userId;
  final String checkoutStatus;
  final String createdAt;
  final String productName;
  final String categoryId;
  final String file;
  final String productQuantity;
  final String description;
  final String additionalInformation;
  final String ownerId;
  final String price;
  final String image;

  CartModel(
      {required this.id,
      required this.productId,
      required this.quantity,
      required this.userId,
      required this.checkoutStatus,
      required this.createdAt,
      required this.productName,
      required this.categoryId,
      required this.file,
      required this.productQuantity,
      required this.description,
      required this.additionalInformation,
      required this.image,
      required this.ownerId,
      required this.price});

 factory CartModel.fromJson(Map<String, dynamic> json) {
  return CartModel(
    id:json['id'],
    productId:json['product_id'],
    quantity:json['quantity'],
    userId:json['user_id'],
    checkoutStatus: json['checkout_status'], 
    createdAt:json['created_at'], 
    productName:json['product_name'], 
    categoryId: json['category_id'], 
    file:json['file'], 
    productQuantity: json['product_quantity'], 
    description:json['description'], 
    additionalInformation: json['additional_information'], 
    ownerId: json['owner_id'], 
    image: json['photo'],
    price: json['price']);
  
  }
}