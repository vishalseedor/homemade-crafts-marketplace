import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/models/productmodel.dart';
import 'package:http/http.dart' as https;

class ProductProvider with ChangeNotifier {
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

  List<ProductModel> _products = [];
  List<ProductModel> get products {
    return [..._products];
  }

  Future getAllProductData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_all_products.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_all_products.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> productDetails = extractedData['products'];
        for (var i = 0; i < productDetails.length; i++) {
          _products.add(
            ProductModel(
              id:productDetails[i]['id'].toString(),
              name: productDetails[i]['name'].toString(),
              categoryId: productDetails[i]['category_id'].toString(),
              file: productDetails[i]['file'].toString(),
              quantity: productDetails[i]['quantity'].toString(),
              description: productDetails[i]['description'].toString(),
              additionalInformation: productDetails[i]['additional_information'].toString(),
              price: productDetails[i]['price'].toString(),
              ownerId: productDetails[i]['owner_id'].toString(),
              ownerName: productDetails[i]['owner_name'].toString(),
              ownerEmail: productDetails[i]['owner_email'].toString(),
              ownerPhone: productDetails[i]['owner_phone'].toString(),
              ownerAddress: productDetails[i]['owner_address'].toString(),
              ownerUnitName: productDetails[i]['owner_unit_name'].toString(),

            ),
          );
        }
        ;

        print('pet details' + _products.toString());
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