import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/EachCategoryscreen.dart/pages/alleachcategoryscreen.dart';


class AllCategoryNewWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  const AllCategoryNewWidget({super.key,required this.id,required this.name,required this.image});

  @override
  State<AllCategoryNewWidget> createState() => _AllCategoryNewWidgetState();
}

class _AllCategoryNewWidgetState extends State<AllCategoryNewWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: GestureDetector(
        onTap: () {
        Navigator.of(context)
                .pushNamed(AllCategoryEachScreen.routeName ,arguments:widget.id);
        },
        child: Material(
          child: Container(
           
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.image),
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
                child: Text(widget.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),)
              ),
            ),
          ),
        ),
      ),
    );
  }
}