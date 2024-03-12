import 'package:flutter/material.dart';


class AllCategoryWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  const AllCategoryWidget({super.key,required this.id,required this.name,required this.image});

  @override
  State<AllCategoryWidget> createState() => _AllCategoryWidgetState();
}

class _AllCategoryWidgetState extends State<AllCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: GestureDetector(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(image: image, title: title, tag: tag,)));
        },
        child: Material(
          child: Container(
           margin: const EdgeInsets.only(right: 20),
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
                child: Text(widget.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
              ),
            ),
          ),
        ),
      ),
    );
  }
}