import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Helpers/provider.dart';
import 'package:homemade_marketplace_project/Helpers/routues.dart';
import 'package:homemade_marketplace_project/Screens/HomeScreen/homescreen.dart';
import 'package:homemade_marketplace_project/Screens/LoginScreen/loginscreen.dart';
import 'package:homemade_marketplace_project/Screens/SplashScreen/splashscreen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:multiprovider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pet Adoption Center',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor:colors),
          useMaterial3: true,
        ),
        home: const LoginPage(),
        routes: customRoutes
          
          
      ),
    );
  }
}
