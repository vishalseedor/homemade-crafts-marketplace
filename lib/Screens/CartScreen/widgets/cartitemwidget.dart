
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/CartScreen/provider/cartprovider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
    final String userid;
  final String cartid;
  final int index;
  final String productid;
  final String productname;
  final String image;
  final String quanity;
  final String price;
  final String description;
  const CartItem({super.key,required this.userid,
  required this.index,
  required this.cartid,required this.productid,required this.image,required this.quanity,required this.price, required this.productname,required this.description});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
   int quanity = 1;
  @override
  Widget build(BuildContext context) {
         final cart = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 140,
          child: Card(
            
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            elevation: 1.2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 90,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/category3.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.productname,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13,fontWeight: FontWeight.bold)),
                                IconButton(
                                  onPressed: () {
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
                                    
                                  },
                                 icon:Icon(Icons.delete,color:colors,))
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                         widget.description,
                         style: TextStyle(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹ : ${int.parse(widget.price) * quanity}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,fontSize: 13,fontWeight: FontWeight.bold
                                  ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ToggleButtons(
                                borderRadius: BorderRadius.circular(99),
                                constraints: BoxConstraints(
                                  minHeight: 30,
                                  minWidth: 30,
                                ),
                                selectedColor:
                                    Theme.of(context).colorScheme.primary,
                                isSelected:  [
                                  true,
                                  false,
                                  true,
                                ],
                                children: [
                                   InkWell(
                                    onTap: () {
                                       setState(() {
                                 quanity--;
                                cart.updateQuantity(widget.index, quanity.toString());

                              });
                                    },
                                     child: Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: colors,
                                                                     ),
                                   ),
                                  Text(quanity.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                quanity++;
                                cart.updateQuantity(widget.index, quanity.toString());

                              });
                                  },
                                  child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: colors,
                                    ),
                                ),
                                ],
                             
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                 
                 
                ],
              ),
              
            ),
            
          ),
          
        ),
    );
      
    // Dismissible(
    //   key: UniqueKey(),
    //   direction: DismissDirection.endToStart,
    //   background: Container(
    //     alignment: Alignment.centerRight,
    //     padding: const EdgeInsets.only(right: 20),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: Colors.red,
    //     ),
    //     child: Icon(
    //       Icons.delete,
    //       color: Colors.white,
    //       size: 25,
    //     ),
    //   ),
    //   confirmDismiss: (DismissDirection direction) async {
    //     final completer = Completer<bool>();
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         duration: const Duration(seconds: 3),
    //         action: SnackBarAction(
    //           label: "Keep",
    //           onPressed: () {
    //             completer.complete(false);
    //             ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //           },
    //         ),
    //         content: const Text(
    //           "Remove from cart?",
    //         ),
    //       ),
    //     );
    //     Timer(const Duration(seconds: 3), () {
    //       if (!completer.isCompleted) {
    //         completer.complete(true);
    //         ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //       }
    //     });

    //     return await completer.future;
    //   },
    //   child: 
    // );
  }
  
}

