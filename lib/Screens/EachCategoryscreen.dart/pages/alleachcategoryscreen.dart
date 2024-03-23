import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/pages/categoryemptyscreen.dart';
import 'package:homemade_marketplace_project/Screens/EachCategoryscreen.dart/provider/categoryeachprovider.dart';
import 'package:homemade_marketplace_project/Screens/EachCategoryscreen.dart/widget/allproductbycategorywidget.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';

import 'package:provider/provider.dart';


class AllCategoryEachScreen extends StatefulWidget {
  static const routeName = 'all_categoryproduct_screen';
    final String cateproduct;

  const AllCategoryEachScreen({
    Key? key,required this.cateproduct
  }) : super(key: key);

  @override
  State<AllCategoryEachScreen> createState() => _AllCategoryEachScreenState();
}

class _AllCategoryEachScreenState extends State<AllCategoryEachScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryEachProvider>(context, listen: false)
        .getAllEachCategorysData(context: context,categoryproduct: widget.cateproduct);
        
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cateproduct= Provider.of<CategoryEachProvider>(context);
    return Scaffold(
     
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor:colors,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CategoryProducts',
              style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
            ),
         
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            children: [
              cateproduct.loadingSpinner
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           
                              const LoadingScreen(title: 'Loading'),
                              CircularProgressIndicator(
                                color:colors,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                               
                           
                            ],
                          )
                         
                          
                        : cateproduct.categorybyproducts.isEmpty
                            ? const CategoryEmptyScreen()
                            : SizedBox(
                                height: size.height * 0.6,
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 0.9),
                                  scrollDirection: Axis.vertical,
                                  itemCount: cateproduct.categorybyproducts.length,
                                  itemBuilder: (context, intex) {
                                    return AllEachCategoryWidget(
                                      productid: cateproduct.categorybyproducts[intex].id,
                                      productname:cateproduct.categorybyproducts[intex].name,
                                      productprice: cateproduct.categorybyproducts[intex].price,
                                      quantity:cateproduct.categorybyproducts[intex].quantity,
                                      image: cateproduct.categorybyproducts[intex].file
                                    
                                    );
                                  },
                                ),
                              ),
            ],
          ),
        ),
      ),     
    );
  }
}
