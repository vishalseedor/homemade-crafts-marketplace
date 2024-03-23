import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/provider/productprovider.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/widgets/allproductwidget.dart';

import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
    static const routeName = 'all_productss_screen';
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  TextEditingController searchController=TextEditingController();
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
      final product= Provider.of<ProductProvider>(context);
      final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:colors,
        title: const Text('Craft Products',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),

        child: Column(
          children: [
          TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                     // size: 17,
                    ),
                    hintText: "Search a Products",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                       fontSize: 14,
                        fontWeight: FontWeight.w600),
                    border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    if (value != "") {
                      String searchQuery = value.toLowerCase();
                      print("hhhhhhhhh");
                      product.getSearchData(value: searchQuery);
                    }
                  },
                ),
           const SizedBox(height: 20),
           Expanded(
             child:  FadeInUp(
              duration: const Duration(milliseconds: 2000),
               child:  product.loadingSpinner
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingScreen(title: 'Loading'),
                          CircularProgressIndicator(
                            color: colors,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    : product.products.isEmpty
                        ? Center(
                            child: Text(
                            'No Products...',
                            style: TextStyle(color: colors),
                          ))
                        : product.searchProducts.isEmpty &&
                                searchController.text.isNotEmpty
                            ? Center(
                                child: Text(
                                'No Products available...',
                                style: TextStyle(color: colors),
                              ))
                            : searchController.text.isNotEmpty &&
                                    product.searchProducts.isNotEmpty
                                ? SizedBox(
                                    height: size.height * 0.6,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 0.7),
                                      scrollDirection: Axis.vertical,
                                      itemCount: product.searchProducts.length,
                                      itemBuilder: (context, intex) {
                                        return AllProductWidget(
                                          id: product.searchProducts[intex].id,
                                          productname: product.searchProducts[intex].name,
                                          price: product.searchProducts[intex].price,
                                          quantity: product.searchProducts[intex].quantity,
                                          
                                        
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    height: size.height * 0.6,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 0.7),
                                      scrollDirection: Axis.vertical,
                                      itemCount: product.products.length,
                                      itemBuilder: (context, intex) {
                                      
                                        return  AllProductWidget(
                                          id: product.products[intex].id,
                                          productname: product.products[intex].name,
                                          price: product.products[intex].price,
                                          quantity: product.products[intex].quantity,
                                          
                                        
                                        );
                                      },
                                    ),
                                  ),
             ),         
           )
          
          ],
        ),
      ),
    );
  }
}