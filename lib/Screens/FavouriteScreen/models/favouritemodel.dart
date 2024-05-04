import 'package:flutter/material.dart';

class FavouiteModel {
  final String  id;
  final String  name;
  final String  file;
  final String image;
  
  FavouiteModel(
      {required this.id,
      required this.name,
      required this.file,
      required this.image,
     });

  factory FavouiteModel.fromJson(Map<String, dynamic> json) {
    return FavouiteModel(
      id:json['id'],
      name:json['name'],
      file: json['file'],
      image: json['photo']
      );
  
   
  }}