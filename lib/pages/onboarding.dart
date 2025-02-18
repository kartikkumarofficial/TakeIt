import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(59,145,242,1.0),
      body:Container(
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
            Row(
              children: [
                Text('TakeIt'.tr,style: GoogleFonts.Inter(
                  color: Colors.orange,fontSize:Get.width*0.2
                ),),
                Image.asset('assets/images/onboardingscreen/suitcase.png')
              ],
            ),
            
            Positioned(
              top: 100,
                right: 200,
                width: 100,
                height: 100,
                child: Image.asset('assets/images/onboardingscreen/box.png'))
          ],
        ),
      ),

    );
  }
}
