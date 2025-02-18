import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(59,145,242,1.0),
      body:Stack(
        children: [
          Positioned(
              top: -25,
              right: Get.width*0.47,
              width: 80,
              height: 100,
 child:Transform.rotate(
     angle: 0.7,
     child:
     Image.asset('assets/images/onboardingscreen/box.png')
 ),
          ),
          Positioned(
            top: Get.width*0.3,
            left: -10,
            width: 90,
            height: 90,
            child:Transform.rotate(
                angle: 6.2,
                child:
                Image.asset('assets/images/onboardingscreen/pencil.png')
            ),
          ),
          Positioned(
            top: Get.width*0.7,
            left: -28,
            width: 90,
            height: 90,
            child:Transform.rotate(
                angle: 0.3,
                child:
                Image.asset('assets/images/onboardingscreen/headphones.png')
            ),
          ),
          Positioned(
            top: Get.width*0.6,
            left: Get.width*0.25,
            width: 70,
            height: 65,
            child:Transform.rotate(
                angle: 6.0,
                child:
                Image.asset('assets/images/onboardingscreen/basket.png')
            ),
          ),
          Positioned(
            top: Get.height*0.6,
            left: -50,
            width: 80,
            height: 70,
            child:Transform.rotate(
                angle: 5/13,
                child:
                Image.asset('assets/images/onboardingscreen/apple.png')
            ),
          ),


          Container(
            height: double.infinity,
            width: double.infinity,
            child:Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: Get.width*0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Container(
                      child: DropdownMenu(label: Text('Language'), dropdownMenuEntries: [],),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(254,179,1,1.0),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
                      ),
                      height: Get.height*0.03,
                      width: Get.width*0.3,
                    )],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:Get.height*0.3 ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Get.width*0.23),
                        child: Text('TakeIt'.tr,style:GoogleFonts.inter(
                          color: Colors.orange,fontSize:Get.width*0.15,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width*0.03),
                        child: Image.asset('assets/images/onboardingscreen/suitcase.png',
                        height: 50,),
                      ),
                    ],
                  ),
                ),
                Text('Shop Smarter, Live Better',style: GoogleFonts.poppins(color: Colors.white,fontSize: Get.width*0.04),)


              ],
            ),
          ),
        ],
      ),

    );
  }
}
