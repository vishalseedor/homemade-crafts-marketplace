import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String? title;
  final String? image;
  final String? tag;

  const CategoryPage({Key? key, this.title, this.image, this.tag}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.tag!,
              child: Material(
                child: Container(
                  height: 360,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image!),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.1),
                        ]
                      )
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios, color: Colors.white,), 
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FadeInUp(duration: const Duration(milliseconds: 1200), child: IconButton(
                                  icon: const Icon(Icons.search, color: Colors.white,), onPressed: () {},
                                )),
                                FadeInUp(duration: const Duration(milliseconds: 1200), child: IconButton(
                                  icon: const Icon(Icons.favorite, color: Colors.white,), onPressed: () {},
                                )),
                                FadeInUp(duration: const Duration(milliseconds: 1300), child: IconButton(
                                  icon: const Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {},
                                )),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        FadeInUp(duration: const Duration(milliseconds: 1200), child: Text(widget.title!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1400), child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("New Product", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Row(
                        children: <Widget>[
                          Text("View More", style: TextStyle(color: Colors.grey),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios, size: 11, color: Colors.grey,)
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: 20,),
                  FadeInUp(duration: const Duration(milliseconds: 1500), child:  makeProduct(image: 'assets/category1.jpg', title: 'Paper Craft', price: '100\$')),
                  FadeInUp(duration: const Duration(milliseconds: 1600), child:  makeProduct(image: 'assets/category2.jpg', title: 'Bottle Craft', price: '100\$')),
                  FadeInUp(duration: const Duration(milliseconds: 1700), child:  makeProduct(image: 'assets/category3.jpg', title: 'Coconut Shell Craft', price: '100\$')),
                  FadeInUp(duration: const Duration(milliseconds: 1800), child:  makeProduct(image: 'assets/category4.jpg', title: 'Thread Craft', price: '100\$')),
                  FadeInUp(duration: const Duration(milliseconds: 1900), child:  makeProduct(image: 'assets/person.jpg', title: 'Person', price: '100\$')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeProduct({image, title, price}) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
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
              Colors.black.withOpacity(.1),
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FadeInUp(duration: const Duration(milliseconds: 1400), child: const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border, color: Colors.white,),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(duration: const Duration(milliseconds: 1500), child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20),)),
                    FadeInUp(duration: const Duration(milliseconds: 1500), child: Text(price, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                  ],
                ),
                FadeInUp(duration: const Duration(milliseconds: 2000), child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Center(
                    child: Icon(Icons.add_shopping_cart, size: 18, color: Colors.grey[700],),
                  )
                ))
              ],
            ),
          ],
        ),
      )
    );
  }
}