import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/models/categorymodel.dart';

import 'package:http/http.dart' as https;

class CategoryProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<CategoryModel> _category = [];
  List<CategoryModel> get category {
    return [..._category];
  }

  Future getAllCategoryData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_all_categories.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_all_categories.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _category = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> categoryDetails = extractedData['categories'];
        for (var i = 0; i < categoryDetails.length; i++) {
          _category.add(
            CategoryModel(
              id:categoryDetails[i]['id'].toString(),
              name: categoryDetails[i]['name'].toString(),
              photo: categoryDetails[i]['photo'].toString(),
             
            ),
          );
        }
        ;

        print('pet details' + _category.toString());
        _isLoading = false;
        print('cateogory products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Pet Data is one by one loaded the pet' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
 
}