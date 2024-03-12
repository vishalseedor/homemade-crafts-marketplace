import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/widgets/categorywidget.dart';
import 'package:provider/provider.dart';

class CategoryNewScreen extends StatefulWidget {
    static const routeName = 'category_screen';
  const CategoryNewScreen({super.key});

  @override
  State<CategoryNewScreen> createState() => _CategoryNewScreenState();
}

class _CategoryNewScreenState extends State<CategoryNewScreen> {
    @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);
  }
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryProvider>(context);
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: colors,
        title: Text('Category Products',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
        
      ),
      body  :Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.07,
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),fillColor:Colors.grey[200],filled: true,hintText: 'Search',
              hintStyle: TextStyle(color: colors,fontWeight: FontWeight.w400),prefixIcon: Icon(Icons.search,color: colors,)
              )),
            ),
            SizedBox(height: size.height*0.02),
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 3000),
                child: category.loadingSpinner
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
                            : category.category.isEmpty
                                ? Center(
                                    child: Text(
                                    'No Categories...',
                                    style: TextStyle(color:colors),
                                  ))
                                : SizedBox(
                                    //height: size.height * 0.2,
                                    child: GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.9,mainAxisSpacing: 15,crossAxisSpacing: 15),
                                      scrollDirection: Axis.vertical,
                                      itemCount: category.category.length,
                                      itemBuilder: (context, intex) {
                                        return AllCategoryWidget(
                                          id: category.category[intex].id,
                                          name: category.category[intex].name,
                                          image: category.category[intex].photo,
                                         
                                        );
                                      },
                                    ),
                                  ),
              ),
            ),
          ],
        ),
      ),         
    );
  }
}