import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';


class CartEmptyScreen extends StatefulWidget {
  const CartEmptyScreen({super.key});

  @override
  State<CartEmptyScreen> createState() => _CartEmptyScreenState();
}

class _CartEmptyScreenState extends State<CartEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Center(child: Image.asset('assets/empty.jpg',scale: 3)),
          SizedBox(height: size.height*0.02),
          const Center(child: Text('Your Cart is Empty....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          SizedBox(height: size.height*0.02),
          ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(backgroundColor: colors),
           child:const Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        ],
      );
    

  }
}