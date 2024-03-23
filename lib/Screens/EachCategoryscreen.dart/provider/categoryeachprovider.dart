import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/EachCategoryscreen.dart/models/categoryeachmodel.dart';
import 'package:http/http.dart' as https;


class CategoryEachProvider with ChangeNotifier {
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

  

  List<CategoryByProdcuts> _categorybyproducts = [];
  List<CategoryByProdcuts> get categorybyproducts {
    return [..._categorybyproducts];
  }
 

  Future getAllEachCategorysData({required BuildContext context,required String categoryproduct}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_products_by_category.php?category_id=$categoryproduct"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_products_by_category.php?category_id=$categorybyproducts");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _categorybyproducts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> catDetails = extractedData['products'];
        for (var i = 0; i < catDetails.length; i++) {
          _categorybyproducts.add(
            CategoryByProdcuts(
              id: catDetails[i]['id'].toString(),
              categoryId: catDetails[i]['category_id'].toString(),
              name: catDetails[i]['name'].toString(),
              file: catDetails[i]['file'].toString(),
              quantity: catDetails[i]['quantity'].toString(),
              price: catDetails[i]['price'].toString()
              

              
            ),
          );
        }
        ;

        print('product details' + _categorybyproducts.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}