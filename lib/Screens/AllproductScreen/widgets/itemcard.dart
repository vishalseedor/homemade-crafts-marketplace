import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';


class ItemCard extends StatefulWidget {
    final String id;
  final String productname;
  final String price;
  final String quantity;
  const ItemCard({super.key,required this.id,required this.productname,required this.price,required this.quantity});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
           
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(

                color: colors,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${widget.id}",
                child: Image.asset('assets/category3.jpg',width: double.infinity,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              // products is out demo list
              widget.productname,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "\$${widget.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}