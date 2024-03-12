

import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/CartScreen/pages/cartscreen.dart';
import 'package:homemade_marketplace_project/FavouriteScreen/pages/favouritescreen.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/pages/homeallproductscreen.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/pages/allcategoryscreen.dart';
import 'package:homemade_marketplace_project/Screens/ProductDetailsScreen/pages/detailspage.dart';


var customRoutes = <String, WidgetBuilder>{
    'all_category_screen': (context) => const AllCategoryScreen(),
    'all_products_screen':(context) => const AllProductHomeScreen(),
    'all_productss_screen':(context)=> const AllProductHomeScreen(),
    'all_carts_screen':(context) => const CartScreen(),
     'all_favourites_screen':(context) => const FavouriteScreen(),
    'product_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return ProductDetailsPage(
      id: id,
    );
  },


   
};
