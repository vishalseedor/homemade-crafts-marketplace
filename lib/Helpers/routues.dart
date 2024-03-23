

import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/pages/allproduct.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/pages/allproductscreen.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/pages/cartscreen.dart';
import 'package:homemade_marketplace_project/Screens/EachCategoryscreen.dart/pages/alleachcategoryscreen.dart';
import 'package:homemade_marketplace_project/Screens/FavouriteScreen/pages/favouritescreen.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/pages/homeallproductscreen.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/pages/allcategoryscreen.dart';
import 'package:homemade_marketplace_project/Screens/ProductDetailsScreen/pages/detailspage.dart';


var customRoutes = <String, WidgetBuilder>{
    'all_category_screen': (context) => const AllCategoryScreen(),
    'all_products_screen':(context) => const AllProductHomeScreen(),
    'all_productss_screen':(context)=> const AllProductsScreen(),
    'all_carts_screen':(context) => const CartScreen(),
     'all_favourites_screen':(context) => const FavouriteScreen(),
    'product_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return ProductDetailsPage(
      id: id,
    );
  },
     'all_categoryproduct_screen': (context) {
  var data = ModalRoute.of(context)!.settings.arguments;
  if (data is String) {
    return AllCategoryEachScreen(cateproduct: data);
  } else if (data is Map<String, dynamic>) {
    return AllCategoryEachScreen(cateproduct: data['category_id']);
  } else {
    print('Unexpected argument type: ${data.runtimeType}');
    return const Scaffold( 
      body: Center(
        child: Text(''),
      ),
    );
  }
},


   
};
