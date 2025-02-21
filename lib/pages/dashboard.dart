import 'dart:ui';

import 'package:TakeIt/pages/onboarding.dart';
import 'package:TakeIt/widgets/RotatedContainer.dart';
import 'package:TakeIt/widgets/SlidingImageCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottomnavigationbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late AnimationController _controller;
  late Animation<double> _animation;
  String location = '12 Ram Bhavan,36 Street road ,Mullana,';
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Hero(
          tag: 'takeit',
          flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Text(
                  "TakeIt",
                  style: GoogleFonts.poppins(
                    fontSize: lerpDouble(Get.width * 0.1, Get.width * 0.08, animation.value),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
            );
          },
          child: Text(
            "TakeIt",
            style: GoogleFonts.poppins(
              fontSize: Get.width * 0.08, // Original size
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mic),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.location_on),
                Text('12 Ram Bhavan,36 Street road ,Mullana,',style: GoogleFonts.inter(color: Colors.grey),overflow: TextOverflow.ellipsis,),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_sharp))
            ],),
            // SlidingImageCard(),
            Stack(
              children: [
                ClipRRect(
                  // borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/homescreen/samsung.jpeg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: Get.width*0.1,
                    left: Get.width*0.045,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(' FROM \$2___  ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400
                          ),),
                      ),)),

              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem('Male', 'male.png'),
                  categoryItem('Female', 'female.png'),
                  categoryItem('Kids', 'kids.png'),
                  categoryItem('Electronics', 'electronics.png'),
                  categoryItem('Home', 'electronics.png'),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(OnboardingScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: Get.width*0.035),
                      child: Container(
                        height: Get.width*0.346,
                        width: Get.width*0.3,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(216, 235, 252, 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // color: Colors.red,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2,top: 15),
                                child: ClipRRect(
                                  child: Image.asset('assets/images/homescreen/tv.png',fit: BoxFit.fitWidth,
                                    width: Get.width*0.3,
                                    height: Get.width*0.2,),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                ),
                                color: Colors.white,
                              ),
                              width: double.infinity,
                              child: Column(
                                children: [
                                Text('Tv & Laptop',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                  fontSize: Get.width*0.035,fontWeight: FontWeight.w400

                                ),),
                                Text('From \$100/M',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                  fontSize: Get.width*0.04,
                                      fontWeight: FontWeight.w500
                                ),),
                              ]
                                ,)
                              ,)

                          ],

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.023),
                    child: Container(
                      height: Get.width*0.346,
                      width: Get.width*0.3,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(216, 235, 252, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // left: Get.width*0.01,
                            // right: 1,
                            bottom: -Get.width*0.1,
                            child: Image.asset('assets/images/homescreen/phone.png',
                              fit: BoxFit.fitWidth,
                              width: Get.width*0.32,),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2,top: 15),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text('Latest Mobile',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                        fontSize: Get.width*0.035,fontWeight: FontWeight.w400

                                    ),),
                                    Text('From \$60/M',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          fontSize: Get.width*0.04,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ]
                                  ,)
                                ,)

                            ],

                          ),



                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.023),
                    child: Container(
                      height: Get.width*0.346,
                      width: Get.width*0.28,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(216, 235, 252, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: Get.width*0.01,
                            // right: 1,
                            top: 0,
                            bottom: Get.width*0.012,
                            child: Image.asset('assets/images/homescreen/vaseline.png',
                              fit: BoxFit.fitWidth,
                              // height: Get.width*0.005,
                              width: Get.width*0.292,),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2,top: 15),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 2),
                                      child: Text('Beauty Products',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                          fontSize: Get.width*0.035,fontWeight: FontWeight.w400

                                      ),),
                                    ),
                                    Text('Take it at\$9/M',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          fontSize: Get.width*0.038,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ]
                                  ,)
                                ,)

                            ],

                          ),



                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.023),
                    child: Container(
                      height: Get.width*0.351,
                      width: Get.width*0.3,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(216, 235, 252, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // left: Get.width*0.01,
                            // right: 1,
                            bottom: -Get.width*0.1,
                            child: Image.asset('assets/images/homescreen/phone.png',
                              fit: BoxFit.fitWidth,
                              width: Get.width*0.32,),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2,top: 15),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text('Latest Mobile',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                      fontSize: Get.width*0.04,

                                    ),),
                                    Text('From \$60/M',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          fontSize: Get.width*0.04,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ]
                                  ,)
                                ,)

                            ],

                          ),



                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.023),
                    child: Container(
                      height: Get.width*0.351,
                      width: Get.width*0.28,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(216, 235, 252, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: Get.width*0.01,
                            // right: 1,
                            top: 0,
                            bottom: Get.width*0.012,
                            child: Image.asset('assets/images/homescreen/vaseline.png',
                              fit: BoxFit.fitWidth,
                              // height: Get.width*0.1,
                              width: Get.width*0.292,),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2,top: 15),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text('Beauty Products',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                      fontSize: Get.width*0.04,

                                    ),),
                                    Text('From \$9/M',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          fontSize: Get.width*0.04,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ]
                                  ,)
                                ,)

                            ],

                          ),



                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.023),
                    child: Container(
                      height: Get.width*0.351,
                      width: Get.width*0.3,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(216, 235, 252, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            // left: Get.width*0.01,
                            // right: 1,
                            bottom: -Get.width*0.1,
                            child: Image.asset('assets/images/homescreen/phone.png',
                              fit: BoxFit.fitWidth,
                              width: Get.width*0.32,),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2,top: 15),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text('Latest Mobile',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                      fontSize: Get.width*0.04,

                                    ),),
                                    Text('From \$60/M',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          fontSize: Get.width*0.04,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ]
                                  ,)
                                ,)

                            ],

                          ),



                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.023),
                    child: Container(
                      height: Get.width*0.351,
                      width: Get.width*0.28,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(216, 235, 252, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: Get.width*0.01,
                            // right: 1,
                            top: 0,
                            bottom: Get.width*0.012,
                            child: Image.asset('assets/images/homescreen/vaseline.png',
                              fit: BoxFit.fitWidth,
                              // height: Get.width*0.1,
                              width: Get.width*0.292,),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2,top: 15),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text('Beauty Products',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                      fontSize: Get.width*0.04,

                                    ),),
                                    Text('From \$9/M',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          fontSize: Get.width*0.04,
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ]
                                  ,)
                                ,)

                            ],

                          ),



                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width*0.03,)



                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Recently Viewed Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            SizedBox(
              // height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  children: [



                    Padding(
                      padding: EdgeInsets.only(left: Get.width*0.034),
                      child: Container(

                        height: Get.width*0.35,
                        width: Get.width*0.27,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0.1,
                            blurRadius: 2,

                          ),],
                            color: Color.fromRGBO(245, 245, 245, 1),

                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -Get.width*0.015,
                              // right: 0.02,
                              top: 0,
                              bottom: -Get.width*0.08,
                              child: Image.asset('assets/images/homescreen/kids.png',
                                // fit: BoxFit.fill,
                                width: Get.width*0.32,),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 2,top: 15),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        topRight: Radius.circular(2),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(bottom: 5.0),
                                        child: Text('Kids Clothing',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Get.width*0.03,

                                        ),),
                                      ),

                                    ]
                                    ,)
                                  ,)

                              ],

                            ),



                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Get.width*0.034),
                      child: Container(

                        height: Get.width*0.35,
                        width: Get.width*0.27,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 2,

                              ),],
                            color: Color.fromRGBO(245, 245, 245, 1),

                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -Get.width*0.001,
                              // right: 0.02,
                              // top: 0,
                              bottom: -Get.width*0.07,
                              child: Image.asset('assets/images/gifts.png',
                                // fit: BoxFit.fill,
                                width: Get.width*0.3,),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 2,top: 15),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        topRight: Radius.circular(2),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(bottom: 5.0),
                                        child: Text('Gifts',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Get.width*0.03,

                                        ),),
                                      ),

                                    ]
                                    ,)
                                  ,)

                              ],

                            ),



                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Get.width*0.034),
                      child: Container(

                        height: Get.width*0.35,
                        width: Get.width*0.27,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 2,

                              ),],
                            color: Color.fromRGBO(245, 245, 245, 1),

                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -Get.width*0.001,
                              // right: 0.02,
                              // top: 0,
                              bottom: -Get.width*0.07,
                              child: Image.asset('assets/images/watch.png',
                                // fit: BoxFit.fill,
                                width: Get.width*0.27,),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 2,top: 15),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        topRight: Radius.circular(2),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(bottom: 5.0),
                                        child: Text('Men\'s Watches',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Get.width*0.03,

                                        ),),
                                      ),

                                    ]
                                    ,)
                                  ,)

                              ],

                            ),



                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Get.width*0.034),
                      child: Container(

                        height: Get.width*0.35,
                        width: Get.width*0.27,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 2,

                              ),],
                            color: Color.fromRGBO(245, 245, 245, 1),

                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: -Get.width*0.001,
                              // right: 0.02,
                              // top: 0,
                              bottom: -Get.width*0.08,
                              child: Image.asset('assets/images/homescreen/vaseline.png',
                                // fit: BoxFit.fill,
                                width: Get.width*0.3,),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 2,top: 15),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        topRight: Radius.circular(2),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(bottom: 5.0),
                                        child: Text('Body Lotion',overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Get.width*0.03,

                                        ),),
                                      ),

                                    ]
                                    ,)
                                  ,)

                              ],

                            ),



                          ],
                        ),
                      ),
                    ),













                  ],
                ) ,
              ),
            ),
            SizedBox(
              height: 50,
            )

          ],
        ),
      ),
    );
  }

  Widget categoryItem(String title, String imagePath) {
    return InkWell(
      onTap:(){ Get.to(Rotated3DContainer());},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [

            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/homescreen/$imagePath'),
            ),
            SizedBox(height: 5),
            Text(title, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget productItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/homescreen/$imagePath'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
