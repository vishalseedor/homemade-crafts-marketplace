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
    return InkWell(
      onTap: () {
      Navigator.of(context).pushNamed(ProductDetailsPage.routeName,arguments:widget.id);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
             
              height: 180,
              width: 200,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/category1.jpg'),fit: BoxFit.cover)),
              child: Column(
                children: [
                  
                ],
              ),
            ),
            Text(widget.productname,style: const TextStyle(fontWeight: FontWeight.bold),),
            Text('Price : ₹${widget.price}',style: TextStyle(color: colors,fontWeight: FontWeight.w900),)
          ],
        ),
      ),
    );
  }
}