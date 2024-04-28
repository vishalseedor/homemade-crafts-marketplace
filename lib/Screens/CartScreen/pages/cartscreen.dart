import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/pages/cartemptyscreen.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/pages/ordersuccessfulscreen.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/provider/cartprovider.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/widgets/cartitemwidget.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartScreen extends StatefulWidget {
   static const routeName = 'all_carts_screen';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    Map<String, dynamic>? paymentIntent;
  bool isLoading = false;
     @override
  void initState() {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<CartProvider>(context, listen: false)
        .getAllCartsData(context: context, userid: userProvider.currentUserId);
  
    super.initState();
  }

  int cartcount=1;
  @override
  Widget build(BuildContext context) {
  final cart = Provider.of<CartProvider>(context);
  final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: const IconThemeData(color:Colors.white),
        backgroundColor: colors,
        title: const Text('Cart Products',style: TextStyle(color: Colors.white,fontSize:14,fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: (){}, child:Text('Clear',style: TextStyle(color: colors,fontWeight: FontWeight.bold),)),
          )
        ],

      ),
        
      body: 
        
          FadeInUp(
            duration: const Duration(milliseconds: 1500),
            child: cart.loadingSpinner
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
                : cart.carts.isEmpty
                    ? const CartEmptyScreen()
                    :SizedBox(
               //  height: size.height * 0,
                  child: ListView.builder(
                  
                    scrollDirection: Axis.vertical,
                    itemCount:cart.carts.length,
                    itemBuilder: (context, intex) {
                      return CartItem(
                        index: intex,
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
   void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    isLoading = true;
    setState(() {

    });
    await context
        .read<CartProvider>()
        .placeOrderApi(userid: userProvider.currentUserId).then((value) {
           isLoading = false;
    setState(() {

    });
        });
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const OrderSuccessScreen()));
    print(response.data.toString());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
