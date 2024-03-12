

import 'package:homemade_marketplace_project/CartScreen/provider/cartprovider.dart';
import 'package:homemade_marketplace_project/FavouriteScreen/provider/favouriteprovider.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/provider/productprovider.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => CategoryProvider()),
  ChangeNotifierProvider(create: (context)=>ProductProvider()),
  ChangeNotifierProvider(create: (context)=>CartProvider()),
  ChangeNotifierProvider(create: (context)=>FavouriteProvider())

];
