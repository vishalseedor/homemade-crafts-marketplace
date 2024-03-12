import 'package:flutter/material.dart';

class FavouiteModel {
  final String  id;
  final String  name;
  final String  file;
  
  FavouiteModel(
      {required this.id,
      required this.name,
      required this.file,
     });

  factory FavouiteModel.fromJson(Map<String, dynamic> json) {
    return FavouiteModel(
      id:json['id'],
      name:json['name'],
      file: json['file']);
  
   
  }}