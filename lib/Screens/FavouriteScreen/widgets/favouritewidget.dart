import 'package:flutter/material.dart';

class AllFavouriteWidget extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  const AllFavouriteWidget({super.key,required this.id,required this.image,required this.name});

  @override
  State<AllFavouriteWidget> createState() => _AllFavouriteWidgetState();
}

class _AllFavouriteWidgetState extends State<AllFavouriteWidget> {

  bool isfav=false;
  @override
  Widget build(BuildContext context) {

     return AspectRatio(
  aspectRatio: 3 / 2.2,
  child: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/category4.jpg'),
            fit: BoxFit.cover,
          ),
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
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: Center(
            child: IconButton(
              icon:  Icon(
          isfav ? Icons.favorite : Icons.favorite_outline,
          color: isfav ? Colors.red : Colors.black,
        ),
              onPressed: () {
                setState(() {
                  isfav=!isfav;
                });
                // Add your onPressed logic here
              },
            ),
          ),
        ),
      ),
    ],
  ),
);

  }
}