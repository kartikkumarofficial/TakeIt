import 'dart:ffi';

import 'package:TakeIt/pages/editprofile.dart';
import 'package:TakeIt/widgets/Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../services/backend.dart';
import 'auth/signup.dart';


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.send, "title": "Refer And Earn"},
    {"icon": Icons.card_giftcard, "title": "Coupons"},
    {"icon": Icons.shopping_cart, "title": "My Orders"},
    {"icon": Icons.favorite, "title": "Wishlist"},
    {"icon": Icons.account_balance_wallet, "title": "Wallet"},
  ];

  final List<Map<String, dynamic>> activityItems = [
    {"icon": Icons.reviews, "title": "Reviews"},
    {"icon": Icons.question_answer, "title": "Questions & Answers"},
  ];
  // Future<void> getUserData() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     DocumentSnapshot snapshot = await DatabaseService().getUser(user.uid);
  //     setState(() {
  //       name = snapshot['name'];
  //       email = snapshot['email'];
  //     });
  //   }
  // }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String username = '';
  String email = '';
  String phoneNumber = '';
  String image = '';



  Future<void> fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        username = userDoc['username']?? 'User';
        phoneNumber = userDoc['phoneNumber']?? 'Add Number';
        email = userDoc['email']?? 'Email';
        image = userDoc['profileImage']?? null;
      });
    }
  }
  @override
  void initState() {
    fetchUserData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text("Profile",style:GoogleFonts.inter(color: Colors.white) ,),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white,size: Get.width*0.07,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.keyboard_voice_rounded,color: Colors.white,size: Get.width*0.075,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),


      drawer: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(8)),
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
                title: Text(username,style: GoogleFonts.poppins(
                    fontSize: Get.width*0.045
                ),),
                subtitle: Text('+91 9876543211',style: GoogleFonts.poppins(color: Colors.grey,fontSize: Get.width*0.033),),
              ),
              Padding(
                padding: EdgeInsets.only(right: Get.width*0.18,left: Get.width*0.05),
                child: Divider(
                  thickness: 1.2 ,

                ),
              ),


              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Refer and Earn',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: () {

                },

              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Coupons',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){

                },
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
      ),


      body: RefreshIndicator(
        onRefresh:() => fetchUserData(),

        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ListView.builder(
                  itemCount: menuItems.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [

                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16.0),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        radius: 40,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: image,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => Icon(Icons.error, size: 40),
                                          ),

                                        )
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      username,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      phoneNumber,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      email,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    // SizedBox(height: 8),
                                    Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              Positioned(
                                  left: Get.width*0.055,
                                  top: Get.width*0.077,

                                  child:Container(
                                    decoration: BoxDecoration(


                                    ),
                                    child: Text('PREMIUM'.tr,
                                      style: GoogleFonts.poppins(
                                          shadows: [BoxShadow(
                                              color: Colors.grey,
                                              // spreadRadius: 5,
                                              blurRadius: 1,
                                              offset: Offset(0,0.5)
                                          )],
                                          color: Color.fromRGBO(255, 179, 0, 1),
                                          fontSize: Get.width*0.04
                                      ),),
                                  ) ),
                              Positioned(
                                  right: Get.width*0.06,
                                  top: Get.width*0.05,

                                  child:Container(
                                      decoration: BoxDecoration(


                                      ),
                                      child:IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.account_balance_wallet,
                                            color:Color.fromRGBO(255, 179, 0, 1) ,
                                            size: Get.width*0.07,

                                          ))
                                  ) ),
                            ],
                          ),
                          Material(
                            color:Colors.transparent,
                            child: InkWell(
                              onTap:(){
                                Get.to(() => EditProfileScreen(
                                  currentUsername: username,
                                  currentEmail: email,
                                  currentPhone: phoneNumber,
                                ));
                              },
                              child: Row(children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: Get.width*0.035,),
                                  child: Icon(Icons.person_outline,),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 17.0),
                                  child: Text('Edit Profile',style: GoogleFonts.poppins(fontSize: Get.width*0.045
                                  ),),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: Get.width*0.5),
                                  child: Icon(Icons.edit,color: Colors.black,),
                                )


                              ],),
                            ),
                          ),
                          Divider(
                            thickness: 6,
                            color: Color.fromRGBO(233, 232, 232, 0.75),
                          ),



                          ListTile(
                            leading: Icon(menuItems[index]["icon"]),
                            title: Text(menuItems[index]["title"]),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: Get.width * 0.05,
                            ),
                            onTap: () {},
                          ),
                        ],
                      );
                    } else if (index == menuItems.length) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            thickness: 6,
                            color: Color.fromRGBO(233, 232, 232, 0.75),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "My Activity",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: activityItems.length,
                            itemBuilder: (context, subIndex) {
                              return ListTile(
                                leading: Icon(activityItems[subIndex]["icon"]),
                                title: Text(activityItems[subIndex]["title"]),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey,
                                  size: Get.width * 0.05,
                                ),
                                onTap: () {},
                              );
                            },
                          ),
                        ],
                      );
                    }

                    return ListTile(
                      leading: Icon(menuItems[index]["icon"]),
                      title: Text(menuItems[index]["title"]),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: Get.width * 0.05,
                      ),
                      onTap: () {},
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
