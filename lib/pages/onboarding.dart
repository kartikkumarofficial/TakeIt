import 'package:TakeIt/pages/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? selectedLanguage;
  List<String> arrlanguages= ['English','Hindi'];
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
            top: Get.width*0.25,
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
            top: Get.width*0.75,
            left: -28,
            width: 70,
            height: 70,
            child:Transform.rotate(
                angle: 0.3,
                child:
                Image.asset('assets/images/onboardingscreen/headphones.png')
            ),
          ),
          Positioned(
            top: Get.width*0.5,
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
          Positioned(
            top: Get.height*0.405,
            left: Get.width*0.67,
            child: Transform.rotate(
              angle: 6.2,
              child: Image.asset('assets/images/onboardingscreen/suitcase.png',
                height: Get.width*0.22,),
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
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(254,179,1,1.0),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
                        ),
                        
                        height: Get.height*0.03,
                        width: Get.width*0.3,
                      // child: DropdownMenu(label: Text('Language'), dropdownMenuEntries: [],),
                      child: PopupMenuButton<String>(

                      onSelected: (String value){},
            itemBuilder: (context) => arrlanguages.map((item) {
              return PopupMenuItem<String>(
                value: item,
                child: Text('Languages',style: GoogleFonts.poppins(color: Colors.black),)
              );
            }).toList(),
            child: Padding(
              padding: EdgeInsets.all(10),
              // child: Text(
              //   'Languages'.tr,
              //   style: GoogleFonts.poppins(
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
          ),

                    )],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:Get.height*0.3 ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: Get.width*0.18),
                        child: Hero(
                          tag: 'takeit',
                          child: Text('TakeIt'.tr,style:GoogleFonts.inter(
                            color: Colors.orange,fontSize:Get.width*0.15,fontStyle:FontStyle.italic,fontWeight: FontWeight.bold
                          )),
                        ),
                      ),

                    ],
                  ),
                ),
                Text('Shop Smarter, Live Better',style: GoogleFonts.poppins(color: Colors.white,fontSize: Get.width*0.05),),
                Padding(
                  padding:  EdgeInsets.only(top: Get.width*0.55),
                  child: Column(
                    children: [
                      Text('Quality,affordability, and convenience'.tr,style: GoogleFonts.poppins(color: Colors.white,fontSize: Get.width*0.04),),
                      Text('in every click.'.tr,style: GoogleFonts.poppins(color: Colors.white,fontSize: Get.width*0.04),),
                      Padding(
                        padding: EdgeInsets.only(top: Get.width*0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: Get.width*0.018,
                                width: Get.width*0.12,
                                decoration: BoxDecoration(
                                  color: Color(0xFF333333),
                                  borderRadius: BorderRadius.circular(030)
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              height: Get.width*0.018,
                              width: Get.width*0.07,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(030)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: Get.width*0.03),
                        child: Container(
                          width: Get.width*0.8,
                          height: Get.width*0.13,
                          child: Hero(tag: 'google',
                            child: ElevatedButton(

                                onPressed: (){
                                  Get.to(SignUpScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(255, 179, 0, 1),
                                  shadowColor: Colors.black,
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )

                                ),

                                child:Text('GET STARTED'.tr,style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: Get.width*0.065,color: Colors.black),) ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),


              ],
            ),
          ),
        ],
      ),

    );
  }
}
