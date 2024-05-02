
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/HomeScreen/homescreen.dart';
import 'package:homemade_marketplace_project/Screens/ProfileScreen/models/usermodel.dart';
import 'package:homemade_marketplace_project/Screens/ProfileScreen/provider/userprovider.dart';
import 'package:homemade_marketplace_project/Screens/RegisterScreen/registerscreen.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _passwordVisible;
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
 void loginHomemadecraft(String email, String password) async {
    print(email);
    print(password);
    const url =
        'http://campus.sicsglobal.co.in/Project/homemade_crafts/API/login.php';

    Map<String, String> body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["status"]);
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {


          List user = jsonData['user_data'];
          if (user.isNotEmpty) {
            ProfileModel userdata = ProfileModel.fromJson(user[0]);
            String userId = userdata.userid;
            Provider.of<UserProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colors,
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['status'] == false) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:colors,
              content: const Text(
                'Invalid email and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
    @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login.jpg'), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.transparent,
              const Color(0xff161d27).withOpacity(0.9),
              const Color(0xff161d27),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Time to purchase, let's Sign in",
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      
                      controller: emailcontroller,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined,color: colors,),
                        hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                           errorStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: const Color(0xff161d27).withOpacity(0.9),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: colors)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: colors)),
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                         
                        },
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      
                      controller: passwordcontroller,
                      obscureText: _passwordVisible,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_outline,color: colors,),
                        hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                           errorStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: const Color(0xff161d27).withOpacity(0.9),
                       suffixIcon:  IconButton(
                                  icon: Icon(
                                   
                                     _passwordVisible
                                     ? Icons.visibility
                                     : Icons.visibility_off,
                                     color: colors
                                     ),
                                  onPressed: () {
                                 
                                     setState(() {
                                         _passwordVisible = !_passwordVisible;
                                     });
                                   },
                                  ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: colors)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: colors)),
                      ),
                       validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          
                        },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // Text(
                  //   "Forgot Password?",
                  //   style: TextStyle(
                  //       color: colors, fontSize: 14, fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: ElevatedButton(
                      
                      onPressed: () {
                       if (_formKey.currentState!.validate()) {
                          loginHomemadecraft(
                            emailcontroller.text.toString(),
                            passwordcontroller.text.toString(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: colors,  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),),
                
                    
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      const Text(
                        "It's your first time here?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>const RegisterPage()));
                        },
                        child: Text(
                          "Sign up",
                          style:
                              TextStyle(color: colors, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}