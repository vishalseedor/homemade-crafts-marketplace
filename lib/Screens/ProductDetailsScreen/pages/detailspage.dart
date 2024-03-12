

import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/AllproductScreen/provider/productprovider.dart';
import 'package:provider/provider.dart';



class ProductDetailsPage extends StatefulWidget {
static const routeName = 'product_details_screen';
  final String id;
  const ProductDetailsPage({super.key,required this.id
});



  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  


  @override
  Widget build(BuildContext context) {
          final productData =
        Provider.of<ProductProvider>(context).products.firstWhere((element) => element.id == widget.id);
  
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors,
        title:  Text("Craft Details",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined,color: Colors.white,),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/category1.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            productData.name,
            style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available in stock",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
             
            ],
          ),
          const SizedBox(height: 10),

          Text('₹ : ${productData.price}',style: TextStyle(fontWeight: FontWeight.bold,color: colors,fontSize: 16),),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.star,
          //       size: 16,
          //       color: Colors.yellow.shade800,
          //     ),
          //      Text(
          //       "₹ : ${productData.price}",
          //     ),
          //     const Spacer(),
          //     SizedBox(
          //       height: 30,
          //       width: 30,
          //       child: IconButton.filledTonal(
          //         padding: EdgeInsets.zero,
          //         onPressed: () {},
          //         iconSize: 18,
          //         icon: const Icon(Icons.remove),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 12),
          //       child: Text(
          //         "2 ${'dddddddd'}",
          //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //               fontWeight: FontWeight.bold,
          //             ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 30,
          //       width: 30,
          //       child: IconButton.filledTonal(
          //         padding: EdgeInsets.zero,
          //         onPressed: () {},
          //         iconSize: 18,
          //         icon: const Icon(Icons.add),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 10),
          Text("Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),

           Text(productData.description),
             const SizedBox(height: 10),
            Text('Owner Name:  ${productData.ownerName}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
             const SizedBox(height: 10),
            Text('Owner Email: ${productData.ownerEmail}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
             const SizedBox(height: 10),
            Text('Owner Phone: ${productData.ownerPhone}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
             const SizedBox(height: 10),
            Text('Owner Address: ${productData.ownerAddress.substring(0,17)}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
             const SizedBox(height: 10),
            Text('Owner UnitName: ${productData.ownerUnitName}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            
          // RichText(
          //   text: TextSpan(
          //     style: Theme.of(context).textTheme.bodyMedium,
          //      children: [
          //       TextSpan(
          //         text: showMore
          //             ? gardenData.description
          //             : '${gardenData.description.substring(0, gardenData.description.length - 100)}...',
          //       ),
          //       TextSpan(
          //         recognizer: readMoreGestureRecognizer,
          //         text: showMore ? " Read less" : " Read more",
          //         style: TextStyle(
          //           color: Theme.of(context).colorScheme.primary,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(height: 20),
        
         
          // SizedBox(
          //   height: 90,
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         height: 90,
          //         width: 80,
          //         margin: const EdgeInsets.only(bottom: 16),
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: NetworkImage(gardenData.photo),
          //             fit: BoxFit.cover,
          //           ),
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //       );
          //     },
          //     separatorBuilder: (__, _) => const SizedBox(
          //       width: 10,
          //     ),
          //     itemCount: garden.gardens.length,
          //   ),
          // ),
          const SizedBox(height: 20),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor:colors ),
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag),
              label: const Text("Add to cart"))
        ],
      ),
    );
  }
}
