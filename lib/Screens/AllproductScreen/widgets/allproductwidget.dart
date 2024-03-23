import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/ProductDetailsScreen/pages/detailspage.dart';

class AllProductWidget extends StatefulWidget {
  final String id;
  final String productname;
  final String price;
  final String quantity;
  const AllProductWidget({super.key,required this.id,required this.productname,required this.price,required this.quantity});

  @override
  State<AllProductWidget> createState() => _AllProductWidgetState();
}

class _AllProductWidgetState extends State<AllProductWidget> {
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsPage.routeName,arguments:widget.id);
      },
      child: Card(
        
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(                                               
              height: 150,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/category4.jpg'),
                  fit: BoxFit.cover,
                ),   
              ),
              child: SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filledTonal(
                  padding: EdgeInsets.zero,
                  onPressed: () {}, 
                  iconSize: 18,
                  icon: const Icon(Icons.favorite_border),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      widget.productname,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "₹${widget.price}",
                                style:TextStyle(color: colors,fontWeight: FontWeight.bold)),
                            // TextSpan(
                            //     text: "/${'22'}",
                            //     style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   width: 30,
                      //   height: 30,
                      //   child: IconButton.filled(
                      //     padding: EdgeInsets.zero,
                      //     onPressed: () {},
                      //     iconSize: 18,
                      //     icon: const Icon(Icons.add),
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    // return InkWell(
    //   onTap: () {
    //   Navigator.of(context).pushNamed(ProductDetailsPage.routeName,arguments:widget.id);
    //   },
    //   child: Card(
    //     clipBehavior: Clip.antiAlias,
    //     child: Column(
          
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Container(
             
    //           height: 180,
    //           width: 200,
    //           decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/category1.jpg'),fit: BoxFit.cover)),
    //           child: Column(
    //             children: [
                  
    //             ],
    //           ),
    //         ),
    //         Text(widget.productname,style: const TextStyle(fontWeight: FontWeight.bold),),
    //         Text('Price : ₹${widget.price}',style: TextStyle(color: colors,fontWeight: FontWeight.w900),)
    //       ],
    //     ),
    //   ),
    // );
  }
}