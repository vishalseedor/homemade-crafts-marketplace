import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Screens/FavouriteScreen/provider/favouriteprovider.dart';

import 'package:homemade_marketplace_project/Screens/FavouriteScreen/widgets/favouritewidget.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/ProfileScreen/provider/userprovider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
    static const routeName = 'all_favourites_screen';
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
    @override
  void initState() {
     final userProvider = Provider.of<UserProvider>(context, listen: false);
   
    Provider.of<FavouriteProvider>(context, listen: false)
        .getAllFavouritesData(context: context,userid: userProvider.currentUserId);
         super.initState();
  }
  @override
  Widget build(BuildContext context) {
      final favourite = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors,
        title: Text('Favourites',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: FadeInUp(
          duration: const Duration(milliseconds: 1500),
          child:favourite.loadingSpinner
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 
                                  const LoadingScreen(title: 'Loading'),
                                  CircularProgressIndicator(
                                    color: colors,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                               
                                ],
                              )
                            : favourite.favourites.isEmpty
                                ? Center(
                                    child: Text(
                                    'No Favourite Products...',
                                    style: TextStyle(color:colors,fontWeight: FontWeight.bold),
                                  ))
                                : SizedBox(
                                    //height: size.height * 0.2,
                                    child: GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.9,mainAxisSpacing: 15,crossAxisSpacing: 15),
                                      scrollDirection: Axis.vertical,
                                      itemCount: favourite.favourites.length,
                                      itemBuilder: (context, intex) {
                                        return AllFavouriteWidget(
                                          
                                          
                                          id: favourite.favourites[intex].id,
                                          name: favourite.favourites[intex].name,
                                          image:favourite.favourites[intex].image,
                                         
                                        );
                                      },
                                    ),
                                  ),
        ),
      ),
    );
  }
}