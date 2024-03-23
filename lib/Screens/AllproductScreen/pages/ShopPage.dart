import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/pages/cartscreen.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Screens/FavouriteScreen/pages/favouritescreen.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/provider/productprovider.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/widgets/allhomeproductwidget.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/pages/CategoryPage.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/pages/allproductscreen.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/pages/categoryscreen.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/widgets/categorywidget.dart';
import 'package:homemade_marketplace_project/Screens/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
    @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
     Provider.of<ProductProvider>(context,listen: false)
        .getAllProductData(context: context);
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
     final category = Provider.of<CategoryProvider>(context);
     final product=Provider.of<ProductProvider>(context);
     final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeInUp(duration: const Duration(milliseconds: 1000), child: Container(
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/K.png'),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                 decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeInUp(duration: const Duration(milliseconds: 1200), child: IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.white,), onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder:(context)=>const FavouriteScreen()));
                            },
                          )),
                          FadeInUp(duration: const Duration(milliseconds: 1300), child: IconButton(
                            icon: const Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
                            },
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeInUp(duration: const Duration(milliseconds: 1500), child: const Text("Our Homemade Crafts Products", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
                            const SizedBox(height: 15,),
                             Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].firstName;
                }
                return FadeInUp(
                  duration: const Duration(milliseconds: 1700),
                  child: Text(
                    '$userAddress , User',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w900),
                  ),
                );
              }),
                            // FadeInUp(duration: const Duration(milliseconds: 1700), child: const Row(
                            //   children: [
                                
                                
                            //     // Text("VIEW MORE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                            //     //  SizedBox(width: 5,),
                            //     // Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15,)
                            //   ],
                            // ))
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )),
            FadeInUp(duration: const Duration(milliseconds: 1400), child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Categories", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>const CategoryNewScreen()));
                        },
                        child: Text("All"))
                    ],
                  ),
                  const SizedBox(height: 20,),
                   category.loadingSpinner
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
                  : category.category.isEmpty
                      ? Center(
                          child: Text(
                          'No Categories...',
                          style: TextStyle(color:colors),
                        ))
                      : SizedBox(
                          height: size.height * 0.2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.category.length,
                            itemBuilder: (context, intex) {
                              return AllCategoryWidget(
                                id: category.category[intex].id,
                                name: category.category[intex].name,
                                image: category.category[intex].photo,
                               
                              );
                            },
                          ),
                        ),         
                  // Container(
                  //   height: 150,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       makeCategory(image: 'assets/category1.jpg', title: 'Paper craft', tag: 'beauty'),
                  //       makeCategory(image: 'assets/category2.jpg', title: 'Bottle craft', tag: 'clothes'),
                  //       makeCategory(image: 'assets/category3.jpg', title: 'Coconut Shell craft', tag: 'perfume'),
                  //       makeCategory(image: 'assets/category4.jpg', title: 'Thread craft', tag: 'glass'),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 40,),

                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("People Near You", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>const AllProductsScreen()));
                        },
                        child: Text("All"))
                    ],
                  ),
                  const SizedBox(height: 20,),
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
                          'No Products...',
                          style: TextStyle(color:colors),
                        ))
                      : SizedBox(
                          height: size.height * 0.24,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.products.length,
                            itemBuilder: (context, intex) {
                              return AllHomeProductWidget(
                                id: product.products[intex].id,
                                name: product.products[intex].name,
                                image: product.products[intex].file,
                           
                               
                              );
                            },
                          ),
                        ),         

                  // Container(
                  //  height: 150,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       makeBestCategory(image: 'assets/category1.jpg', title: 'Paper'),
                  //       makeBestCategory(image: 'assets/category2.jpg', title: 'Bottle'),
                  //       makeBestCategory(image: 'assets/category3.jpg', title: 'Coconut Shell'),
                  //       makeBestCategory(image: 'assets/category4.jpg', title: 'Thread'),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 80,),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget makeCategory({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(image: image, title: title, tag: tag,)));
          },
          child: Material(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.0),
                    ]
                  )
                ),
                child: 
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeBestCategory({image, title}) {
    return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.0),
              ]
            )
          ),
          child: 
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
          ),
        ),
      ),
    );
  }
}