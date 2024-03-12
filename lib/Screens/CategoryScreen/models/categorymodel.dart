import 'package:flutter/material.dart';

class CategoryModel {
 final String id;
 final String name;
 final String photo;

  CategoryModel({required this.id,required this.name,required this.photo});

 factory CategoryModel.fromJson(Map<String, dynamic> json) {
  return CategoryModel(
    id:  json['id'],
    name: json['name'],
    photo: json['photo']);
  }
}