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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          Center(child: Image.asset('assets/cate.png',scale: 3)),
          SizedBox(height: size.height*0.02),
          const Center(child: Text('Your Category is Empty....!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          SizedBox(height: size.height*0.02),
          ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(backgroundColor: colors),
           child:const Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
        ],
      );
    

  }
}