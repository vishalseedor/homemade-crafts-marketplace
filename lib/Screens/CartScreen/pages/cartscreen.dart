import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/pages/cartemptyscreen.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/provider/cartprovider.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/widgets/cartitemwidget.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/widgets/cartwidget.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
   static const routeName = 'all_carts_screen';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    @override
   void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context);
  }
  int cartcount=1;
  @override
  Widget build(BuildContext context) {
  final cart = Provider.of<CartProvider>(context);
  final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color:Colors.white),
        backgroundColor: colors,
        title: const Text('Cart Products',style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: (){}, child:Text('Clear',style: TextStyle(color: colors,fontWeight: FontWeight.bold),)),
          )
        ],

      ),
      body: FadeInUp(
      duration: const Duration(milliseconds: 1300),
        child:     cart.loadingSpinner
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoadingScreen(title: 'Loading'),
                      CircularProgressIndicator(
                        color:colors,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                   
                    ],
                  )
                : cart.carts.isEmpty
                    ? const CartEmptyScreen()
                    : SizedBox(
                     //  height: size.height * 0,
                        child: ListView.builder(
                        
                          scrollDirection: Axis.vertical,
                          itemCount:cart.carts.length,
                          itemBuilder: (context, intex) {
                            return CartItem(
                              userid:cart.carts[intex].userId , 
                              cartid: cart.carts[intex].id,
                               productid:cart.carts[intex].quantity,
                                image: cart.carts[intex].file, 
                                quanity:cart.carts[intex].quantity, 
                                price: cart.carts[intex].price, 
                                description: cart.carts[intex].description,
                                productname: cart.carts[intex].productName);
                            // return AllCartWidget(
                            //   cartid:cart.carts[intex].id,
                            //   userid: cart.carts[intex].userId,
                            //   image: cart.carts[intex].file,
                            //   price: cart.carts[intex].price,
                            //   productid: cart.carts[intex].productId,
                            //   productname: cart.carts[intex].productName,
                            //   quanity: cart.carts[intex].quantity,
                             
              
                            // );
                            
                          },
                        ),
                      ),       
      ),
    );
  }
}