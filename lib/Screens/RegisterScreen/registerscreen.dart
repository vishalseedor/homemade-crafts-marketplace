
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';
import 'package:homemade_marketplace_project/Screens/LoginScreen/loginscreen.dart';
import 'package:http/http.dart'as http;


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstnamecontroller=TextEditingController();
   TextEditingController lastnamecontroller=TextEditingController();
    TextEditingController emailcontroller=TextEditingController();
     TextEditingController phonecontroller=TextEditingController();
      TextEditingController passwordcontroller=TextEditingController();

      final _formKey = GlobalKey<FormState>();
Future<void>registerHomemadeCraft(

String firstname,String lastname,String email,String phone,String password) async {
  const url = 'http://campus.sicsglobal.co.in/Project/homemade_crafts/API/registration.php';

  Map<String, String> body = {
  
    'firstname':firstname,
    'lastname': lastname,
    'email': email,
    'phone': phone,
    'password': password,
  
  };

 try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
       var jsonData=json.decode(response.body);

      if (response.statusCode == 200) {
      if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(

         SnackBar(
          backgroundColor:colors,
          content: const Text('Register Successful!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=>const LoginPage()));
      print(body);
      print("Response body${response.body}");
    
      print('Registration successful');
      }
      else{
        jsonData['status']==false;
         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor:colors ,
          content: const Text('User Already Exists !',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                    "SIGN UP",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                 
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: firstnamecontroller,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "First Name",
                        prefixIcon: Icon(Icons.person_outline,color: colors,),
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
                          if(value!.isEmpty){
                            return 'Please enter your first name';
                          }
                        },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: lastnamecontroller,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        prefixIcon: Icon(Icons.person_outline,color: colors,),
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
                          if(value!.isEmpty){
                            return 'Please enter your last name';
                          }
                        },
                    ),
                  ),
                     const SizedBox(
                    height: 15,
                  ),
                   Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
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
                          if(value!.isEmpty){
                            return 'Please enter your email';
                          }
                        },
                    ),
                  ),
                     const SizedBox(
                    height: 15,
                  ),
                   Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                     keyboardType: TextInputType.phone,
                     controller: phonecontroller,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined,color: colors,),
                        hintText: "Phone Number",
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
                          if(value!.isEmpty){
                            return 'Please enter your phone';
                          }
                        },
                    ),
                  ),
                     const SizedBox(
                    height: 15,
                  ),
                   Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_outline,color: colors,),
                        hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                        filled: true,
                        fillColor: const Color(0xff161d27).withOpacity(0.9),
                           errorStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: colors)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: colors)),
                      ),
                       validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter your password';
                          }
                        },
                    ),
                  ),
                
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: ElevatedButton(
                      
                      onPressed: ()async{
                         if (_formKey.currentState!.validate()) {
                          registerHomemadeCraft(
                            firstnamecontroller.text.toString(),
                            lastnamecontroller.text.toString(),
                            emailcontroller.text.toString(),
                            phonecontroller.text.toString(),
                            passwordcontroller.text.toString()

                            
                          );
                        }
                       
                      },
                    
                      style: ElevatedButton.styleFrom(backgroundColor: colors,  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),),
                      
                
                    
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
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