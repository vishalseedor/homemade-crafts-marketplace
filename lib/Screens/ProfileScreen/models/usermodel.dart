import 'package:flutter/material.dart';


class ProfileModel {
  final String userid;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String photo;

  ProfileModel(
      {required this.userid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.photo});
factory  ProfileModel.fromJson(Map<String, dynamic> json) {
  return ProfileModel
  (userid: json['userid'], 
  firstName: json['first_name'],
   lastName: json['last_name'],
    email: json['email'],
     phone:json['phone'],
      photo:json['photo']);

    
  }}