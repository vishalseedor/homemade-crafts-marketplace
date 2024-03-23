import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';




class AllEachCategoryWidget extends StatefulWidget {
  final String productid;
  final String productname;
  final String productprice;
  final String quantity;
  final String image;
  

  const AllEachCategoryWidget(
      {super.key,
     required this.productid,
     required this.productname,
     required this.productprice,
     required this.quantity,
     required this.image
      });

  @override
  State<AllEachCategoryWidget > createState() => _AllEachCategoryWidgetState();
}

class _AllEachCategoryWidgetState extends State<AllEachCategoryWidget > {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

      return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: GestureDetector(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(image: image, title: title, tag: tag,)));
        },
        child: Material(
          child: Container(
          
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/category2.jpg'),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.0),
                  ]
                )
              ),
              child: 
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(widget.productname, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
