import 'package:TakeIt/pages/auth/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/CartItem.dart';
import '../widgets/WishlistContainer.dart';
import 'editprofile.dart';



class CartScreen extends StatefulWidget {

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String username = 'k';
  String email = '';
  String phoneNumber = '';
  String image = '';


  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

          setState(() {

            username = userData['username'];
            phoneNumber = userData['phoneNumber'] ?? 'Not Available';
            email = userData['email'] ?? 'Email not found';
            image = userData['profileImage'] ?? '';
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }
  final List<Map<String, dynamic>> wishlist = [
    {"title": "Slipper", "price": 450, "image": "assets/slipper.png"},
    {"title": "Pant", "price": 370, "image": "assets/pant.png"},
    {"title": "Watch", "price": 650, "image": "assets/watch.png"},
    {"title": "Jacket", "price": 1000, "image": "assets/jacket.png"},
  ];

  List<Map<String, dynamic>> products = [
    {
      'name': 'Nicke Alpha Bloober Men Shoe ',
      'price': 1999,
      'image': Icons.image,
      'quantity': 1,
      'inStock': true,
    },
    {
      'name': 'Adidas Running Shoes',
      'price': 1499,
      'image': Icons.image,
      'quantity': 2,
      'inStock': false,
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Text("Cart",style:GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.w500) ,),
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
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.keyboard_voice_rounded,color: Colors.white,size: Get.width*0.075,),
            onPressed: () {},
          ),

        ],
      ),

      key: _scaffoldKey,

      drawer: Container(
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
                  backgroundImage: image.isNotEmpty
                      ? NetworkImage("$image?t=${DateTime.now().millisecondsSinceEpoch}") as ImageProvider
                      : AssetImage('assets/images/defprofile.png') as ImageProvider,
                  child: image.isEmpty
                      ? Icon(Icons.person, size: 40, color: Colors.white)
                      : null,


                ),
                title: Text(username,style: GoogleFonts.poppins(
                    fontSize: Get.width*0.045
                ),),
                subtitle: phoneNumber != null && phoneNumber != "Not Available" ? Text(phoneNumber,
                  style: GoogleFonts.poppins( color: Colors.grey, fontSize: Get.width * 0.033),
                ) : null,

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
                onTap: (){
                  Get.to(EditProfileScreen(currentUsername: username,currentEmail: email,));
                },
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
                          FirebaseAuth.instance.signOut();
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
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.black54),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text("12 Ram Bhavan, 36 Street Road, Mullana...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(fontSize: 16,color: Colors.black.withOpacity(0.7))),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.0,top: 8),
                      child: Text("Wishlist", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 10),
                    if (wishlist.isNotEmpty) WishlistContainer(wishlist: wishlist),
                    SizedBox(height: 20),
                    Text("In Cart", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return CartItem(product: products[index]);
                      },
                    ),


                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: Get.width*0.01,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 179, 0, 1),
                  borderRadius: BorderRadius.circular(22)
                ),
                padding: EdgeInsets.all(16),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Proceed to Buy (1 item)", style: GoogleFonts.inter(fontSize: 16,
                        fontWeight: FontWeight.w500)),
                    Text("\$1000", style: GoogleFonts.inter(fontSize: 18,
                        fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



