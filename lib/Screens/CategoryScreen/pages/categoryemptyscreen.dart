import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';


class CategoryEmptyScreen extends StatefulWidget {
  const CategoryEmptyScreen({super.key});

  @override
  State<CategoryEmptyScreen> createState() => _CategoryEmptyScreenState();
}

class _CategoryEmptyScreenState extends State<CategoryEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          Center(child: Image.asset('assets/n.png',scale: 1.8)),
         // SizedBox(height: size.height*0.02),
          const Center(child: Text('Your Category is Empty....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),),),
          SizedBox(height: size.height*0.02),
          
        ],
      );
    

  }
}