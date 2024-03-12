import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:provider/provider.dart';

import '../provider/cartprovider.dart';

class AllCartWidget extends StatefulWidget {
  final String userid;
  final String cartid;
  final String productid;
  final String productname;
  final String image;
  final String quanity;
  final String price;

  const AllCartWidget({super.key,required this.userid, required this.cartid,required this.productid,required this.productname,required this.image,required this.quanity,required this.price});

  @override
  State<AllCartWidget> createState() => _AllCartWidgetState();
}

class _AllCartWidgetState extends State<AllCartWidget> {
    int cartcount=1;
  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<CartProvider>(context);
   return Padding(
            padding: const EdgeInsets.all(13.0),
            child: Card(
              elevation:2,
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/category2.jpg'),fit: BoxFit.cover)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.productname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                          IconButton(onPressed: (){
                             cart.deleteCart(widget.cartid,context);
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           backgroundColor: colors,
                           content: const Text(
                             'Cart item Deleted successfully!',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold),
                           ),
                           duration: const Duration(seconds: 4),
                         ));
                          }, icon:Icon(Icons.delete))
                        ],
                      ),
                      Text('Premium ctaft',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('₹ : ${widget.price}',style: TextStyle(color: colors,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  cartcount--;
                                });
                              }, icon:Icon(Icons.remove_circle_outline,color: colors,)),
                              Text(cartcount.toString()),
                               IconButton(onPressed: (){
                                setState(() {
                                  cartcount++;
                                });
                               }, icon:Icon(Icons.add_circle_outline,color: colors,)),
        
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}