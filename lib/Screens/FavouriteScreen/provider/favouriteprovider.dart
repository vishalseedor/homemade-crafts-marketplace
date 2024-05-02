import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/FavouriteScreen/models/favouritemodel.dart';
import 'package:http/http.dart' as https;



class FavouriteProvider extends ChangeNotifier {
 
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

  List< FavouiteModel> _favourites = [];
  List< FavouiteModel> get favourites {
    return [..._favourites];
  }

  Future getAllFavouritesData({BuildContext? context,String? userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_favourite.php?user_id=$userid"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_favourite.php?user_id=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _favourites = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> favDetails = extractedData['favorite_products'];
        for (var i = 0; i < favDetails.length; i++) {
          _favourites.add(
            FavouiteModel(
            
              name: favDetails[i]['name'].toString(),
              id: favDetails[i]['id'].toString(),
              file: favDetails[i]['file'].toString()
            
             
              
            ),
          );
        }
        ;

        print('favourites details' + _favourites.toString());
        _isLoading = false;
        print('Favourites loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in fav prod -->>' + e.toString());
      print('Favourite Data is one by one loaded the favouite' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
  Future<void> AddtoFavourite({String? userid,String? productid}) async {
    final url = Uri.parse('http://campus.sicsglobal.co.in/Project/homemade_crafts/API/add_favourites.php?user_id=$userid&product_id=$productid');
    
    try {
      final response = await https.post(url);

      if (response.statusCode == 200) {
      getAllFavouritesData();
        print(url);
     
        // Cart deleted successfully
        print('Fav added successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }
    Future<void> deleteFavourite(String productId, BuildContext context) async {
    final url = Uri.parse('http://campus.sicsglobal.co.in/Project/homemade_crafts/API/delete_favourite.php?id=$productId');
    
    try {
      final response = await https.delete(url);

      if (response.statusCode == 200) {
        getAllFavouritesData();
        // Cart deleted successfully
        print('Cart deleted successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }
 


 
}


 
