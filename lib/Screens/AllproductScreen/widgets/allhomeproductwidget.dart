import 'package:flutter/material.dart';

class AllHomeProductWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  const AllHomeProductWidget({super.key,required this.id,required this.name,required this.image});

  @override
  State<AllHomeProductWidget> createState() => _AllHomeProductWidgetState();
}

class _AllHomeProductWidgetState extends State<AllHomeProductWidget> {
  @override
  Widget build(BuildContext context) {
   return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
            image: AssetImage('assets/category4.jpg'),
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
    );
  }
}