
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/HomeScreen/Pages/ShopPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800)
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(_scaleController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       Navigator.push(context, MaterialPageRoute(builder:(context)=> ShopPage()));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/V.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4),
              ]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Homemade crafts marketplace", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),)),
                SizedBox(height: 20,),
                FadeInUp(duration: Duration(milliseconds: 1300), child: Text("Let's start with purchase", style: TextStyle(color: Colors.white, fontSize: 20),)),
                SizedBox(height: 100,),
                InkWell(
                  onTap: () {
                    setState(() {
                      hide = true;
                    });
                    _scaleController.forward();
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeInUp(duration: Duration(milliseconds: 1500), child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(
                          child: hide == false ? Text("Get Start", style: TextStyle(fontWeight: FontWeight.bold),) : Container(),
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                FadeInUp(duration: Duration(milliseconds: 1700), child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Text("Create Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                )),
                SizedBox(height: 30,),
      

              ],
            ),
          ),
        ),
      ),
    );
  }
}