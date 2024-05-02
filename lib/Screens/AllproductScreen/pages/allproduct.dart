import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/provider/productprovider.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/widgets/allproductwidget.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';

import 'package:provider/provider.dart';

class AllProduct extends StatefulWidget {
     static const routeName = 'all_productss_screen';
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  TextEditingController searchText = TextEditingController();
bool isVisible=false;
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProductData(context: context);
    // Provider.of<UserProvider>(context,listen: false).getUsertData(context: context);
      Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
   

    super.initState();
  }
 
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = Provider.of<ProductProvider>(context);
    final category=Provider.of<CategoryProvider>(context);
   // final userprovider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
   backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
       backgroundColor: colors,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  const Text(
                    'Local Farmers Market',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const AddressScreen()));
                      },
                      child: const Icon(
                        Icons.expand_more,
                        size: 20,
                      ))
                ],
              ),
              // Consumer<UserProvider>(builder: (context, value, child) {
              //   String userAddress = "";
              //   for (var i = 0; i < value.users.length; i++) {
              //     userAddress = value.users[i].address;
              //   }
              //   return Text(
              //     userAddress,
              //     style: const TextStyle(
              //         color: Colors.black,
              //         fontSize: 10,
              //         fontWeight: FontWeight.w900),
              //   );
              // }),
            ],
          ),
          GestureDetector(
            onTap: () {
           //  Navigator.push(context,MaterialPageRoute(builder:(context)=> MyCartScreen()));
            },
            child: Image.asset(
              'assets/cart.png',
              height: 35,
              width: 35,
              
            ),
          )
        ]),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        // final Size size = constraints.biggest;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                // ImageSlideshow(
                //   //  indicatorRadius: ,
                //   width: double.infinity,
                //   height: size.height * 0.26,
                //   initialPage: 0,
                //   indicatorColor: Colors.blue,
                //   indicatorBackgroundColor: Colors.grey,
                //   children: [
                //     Container(
                //       // width: 300,
                //       // margin: EdgeInsets.all(10),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(16),
                //         child: Image(
                //           image: AssetImage('assets/banner1.png'),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       //  width: 500,
                //       // margin: EdgeInsets.all(10),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(14),
                //         child: Image(
                //           image: AssetImage('assets/banner2.png'),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       //  width: 300,
                //       //  margin: EdgeInsets.all(10),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(16),
                //         child: Image(
                //           image: AssetImage('assets/banner3.png'),
                //         ),
                //       ),
                //     ),
                //   ],
                //   onPageChanged: (value) {},
                //   autoPlayInterval: 3000,
                //   isLoop: false,
                // ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
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
                    focusedBorder: InputBorder.none,
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
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                //             category.loadingSpinner
                // ? const Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       LoadingScreen(title: 'Loading'),
                //       CircularProgressIndicator(
                //         color: Colors.blue,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Loading...',
                //         style: TextStyle(fontSize: 20),
                //       ),
                //     ],
                //   )
                // : category.categories.isEmpty
                //     ? const Center(child: Text('No Products...'))
                //     : ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: category.categories.length,
                //       itemBuilder: (context, index) {
                //         return AllCategoryWidget(
                //           id: category.categories[index].id,
                //           name:  category.categories[index].name,
                //           quantity: category.categories[index].quantity,
                //           farmerid:  category.categories[index].farmerid,
                //           image:  category.categories[index].image);
                      
                //     },),
                        
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Popular Near You',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                product.loadingSpinner
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
                            'No Pets...',
                            style: TextStyle(color: colors),
                          ))
                        : product.searchProducts.isEmpty &&
                                searchController.text.isNotEmpty
                            ? Center(
                                child: Text(
                                'No Pets available...',
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
                                              childAspectRatio: 0.8),
                                      scrollDirection: Axis.vertical,
                                      itemCount: product.searchProducts.length,
                                      itemBuilder: (context, intex) {
                                        return AllProductWidget(
                                          id: product.searchProducts[intex].id,
                                          productname: product.searchProducts[intex].name,
                                          price: product.searchProducts[intex].price,
                                          quantity: product.searchProducts[intex].quantity,
                                          image: product.searchProducts[intex].file,
                                              

                                        
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
                                              childAspectRatio: 0.6),
                                      scrollDirection: Axis.vertical,
                                      itemCount: product.products.length,
                                      itemBuilder: (context, intex) {
                                        return AllProductWidget(
                                          id: product.products[intex].id,
                                          productname: product.products[intex].name,
                                          price: product.products[intex].price,
                                          quantity: product.products[intex].quantity,
                                          image: product.products[intex].file,
                                             
                                         
                                        );
                                      },
                                    ),
                                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
