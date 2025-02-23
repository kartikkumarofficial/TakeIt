import 'package:TakeIt/pages/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboarddrawer{
  DashboardDrawer(){
    Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8),bottomLeft: Radius.zero,bottomRight: Radius.circular(8)),
        ),
        height: Get.height * 1,
        width: Get.width * 0.65,
        // color: Colors.white,
        alignment: Alignment.topLeft,
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  // clipBehavior: Clip.,
                  child: Image.asset('assets/images/profileman.jpeg' ),
                ),
              ),
              title: Text('Carter Sam',style: GoogleFonts.poppins(
                  fontSize: Get.width*0.045
              ),),
              subtitle: Text('+91 9876543211',style: GoogleFonts.poppins(color: Colors.grey,fontSize: Get.width*0.033),),
            ),
            Padding(
              padding: EdgeInsets.only(right: Get.width*0.18,left: Get.width*0.05),
              child: Divider(
                thickness: 1.2  ,

              ),
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Edit Profile',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Refer and Earn',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Coupons',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('My Orders',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Wishlist',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Wallet',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Reviews',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Questions and Answers',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
              ),
              onTap: (){},
            ),
            Padding(
              padding:  EdgeInsets.only(
                top: Get.width*0.4,
                left: Get.width*0.033,
                right: Get.width*0.033,

              ),
              child: Container(
                width: Get.width*0.8,
                height: Get.width*0.091,
                child: Hero(tag: 'google',
                  child: ElevatedButton(

                      onPressed: (){
                        Get.to(SignUpScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shadowColor: Colors.black,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          )

                      ),

                      child:Text('Log Out'.tr,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.width*0.045,
                          color: Colors.white
                      ),) ),
                ),
              ),
            )


          ],
        )
    );
  }
}