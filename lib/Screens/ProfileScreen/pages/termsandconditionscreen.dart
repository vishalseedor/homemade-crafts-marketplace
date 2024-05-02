import 'package:flutter/material.dart';
import 'package:homemade_marketplace_project/Helpers/colors.dart';



class TermsandConditions extends StatefulWidget {
  const TermsandConditions({super.key});

  @override
  State<TermsandConditions> createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConditions> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors,
        title: const Text('Terms & Conditions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1 .Product Listings: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
              const Text('Sellers should accurately describe their products, including materials used, dimensions, and care instructions. Prohibited items should be clearly outlined, and the marketplace should reserve the right to remove listings that violate these guidelines.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
              SizedBox(height: size.height*0.02),
                const Text('2 .Orders and Payments: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Buyers agree to purchase products at the listed price, and sellers are responsible for fulfilling orders promptly and accurately. Use of third-party payment processors should be mentioned, and users should agree to abide by their terms and conditions.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
               SizedBox(height: size.height*0.02),
              const Text('3 .Shipping and Delivery:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                const Text(' Sellers are responsible for shipping products in a timely manner and accurately estimating shipping costs and delivery times.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: size.height*0.02),
                 const Text('4 .Returns and Refunds :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Sellers should clearly outline their return and refund policies, and buyers may be entitled to refunds or replacements for defective or misrepresented products. Sellers should issue refunds promptly according to their stated policies.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                    SizedBox(height: size.height*0.02),
                 const Text('5 .Intellectual Property :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('Sellers retain all rights to the intellectual property associated with their products, and buyers agree not to reproduce or distribute sellers intellectual property without permission.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                     SizedBox(height: size.height*0.02),
                 const Text('6 Dispute Resolution: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('The marketplace may provide mediation services for disputes between buyers and sellers, and users should attempt to resolve disputes in good faith before seeking third-party arbitration or legal action.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                 SizedBox(height: size.height*0.02),
                 const Text('7 Governing Law :',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 13),),
                 const Text('The terms and conditions should be governed by the laws of the jurisdiction where the marketplace operates, and any disputes should be resolved in the courts of that jurisdiction.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
   
            
            ]
            ,
          ),
        ),
      ),
    );
  }
}