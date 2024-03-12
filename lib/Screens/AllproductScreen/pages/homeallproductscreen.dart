import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/ExtraScreens/errorscreen.dart';
import 'package:homemade_marketplace_project/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/provider/productprovider.dart';

import 'package:provider/provider.dart';


class AllProductHomeScreen extends StatefulWidget {
  static const routeName = 'all_products_screen';

  const AllProductHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllProductHomeScreen> createState() => _AllProductHomeScreenState();
}

class _AllProductHomeScreenState extends State<AllProductHomeScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProductData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final product= Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category Products',
                style: TextStyle(fontSize: 14),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body: product.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : product.isError
                ? ErrorScreen(title: product.isError.toString())
                : product.products.isEmpty
                    ? const Text(
                        'No Products ',
                      )
                    : product.products.isEmpty
                        ? const Center(child: Text("No Products"))
                        : ListView.builder(
                            itemCount:product.products.length,
                            itemBuilder: (ctx, index) {
                              print(product.products.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
