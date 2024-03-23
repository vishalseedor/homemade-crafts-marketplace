import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/errorscreen.dart';
import 'package:homemade_marketplace_project/Screens/ExtraScreens/loadingscreen.dart';
import 'package:homemade_marketplace_project/Screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:provider/provider.dart';


class AllCategoryScreen extends StatefulWidget {
  static const routeName = 'all_category_screen';

  const AllCategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
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
    //final size = MediaQuery.of(context).size;
    final category = Provider.of<CategoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category Products',
                style: TextStyle(fontSize: 14),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body: category.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : category.isError
                ? ErrorScreen(title: category.isError.toString())
                : category.category.isEmpty
                    ? const Text(
                        'No Products ',
                      )
                    : category.category.isEmpty
                        ? const Center(child: Text("No Pets"))
                        : ListView.builder(
                            itemCount: category.category.length,
                            itemBuilder: (ctx, index) {
                              print(category.category.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
