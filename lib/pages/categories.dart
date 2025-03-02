import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/signup.dart';
import 'cart.dart';
import 'editprofile.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, String>> categories = [];
  String selectedCategory = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchUserData();
    fetchProducts();
  }
  //static
  // final List<String> categories = [
  //   "1","Shoes", "Laptops", "Electronics", "Food", "Kitchen", "Furniture", "Mobile", "Kids"
  // ];

  //products stored in the form of map
  // final Map<String, List<Map<String, String>>> products = {
  //   "Shoes": [
  //     {"name": "Men Suit", "image": "assets/images/cart5.jpeg"},
  //     {"name": "Belt", "image": "assets/images/cart5.jpeg"},
  //     {"name": "Pant", "image": "assets/images/cart5.jpeg"},
  //     {"name": "Casuals", "image": "assets/images/cart5.jpeg"},
  //     {"name": "Sandle", "image": "assets/images/cart5.jpeg"},
  //     {"name": "Slipper", "image": "assets/images/cart5.jpeg"},
  //   ],
  //   "Laptops": [
  //     {"name": "Gaming Laptop", "image": "assets/images/cart5.jpeg"},
  //     {"name": "Ultrabook", "image": "assets/images/cart5.jpeg"},
  //   ],
  //
  // };

  // String selectedCategory = "Shoes";
//   final List<Map<String, dynamic>> menuItems = [
//     {"icon": Icons.send, "title": "Refer And Earn"},
//     {"icon": Icons.card_giftcard, "title": "Coupons"},
//     {"icon": Icons.shopping_cart, "title": "My Orders"},
//     {"icon": Icons.favorite, "title": "Wishlist"},
//     {"icon": Icons.account_balance_wallet, "title": "Wallet"},
//   ];
//
//   final List<Map<String, dynamic>> activityItems = [
//   {"icon": Icons.reviews, "title": "Reviews"},
// {"icon": Icons.question_answer, "title": "Questions & Answers"},
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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


  // Future<void> fetchCategories() async {
  //   try {
  //     var snapshot = await FirebaseFirestore.instance
  //         .collection('categories').orderBy('order', descending: false).get();
  //
  //     List<Map<String, String>> fetchedCategories = snapshot.docs.map((doc) {
  //       var data = doc.data();
  //
  //       return {
  //         'name': data['name']?.toString() ?? 'Unknown',
  //         'imageUrl': data['imageUrl']?.toString() ?? '',
  //       };
  //     }).toList();
  //
  //     if (fetchedCategories.isNotEmpty) {
  //       if (mounted) {
  //         setState(() {
  //           categories = fetchedCategories;
  //           selectedCategory = categories.first['name'] ?? '';
  //         });
  //       }
  //     } else {
  //       print("No categories found in Firestore.");
  //     }
  //   } catch (e) {
  //     print("Error fetching categories: $e");
  //   }
  // }
  Future<void> fetchCategories() async {
    try {
      var snapshot = await _firestore
          .collection('categories')
          .orderBy('order', descending: false)
          .get();

      List<Map<String, String>> fetchedCategories = [];

      for (var doc in snapshot.docs) {
        var data = doc.data();
        fetchedCategories.add({
          'name': data['name']?.toString() ?? 'Unknown',
          'imageUrl': data['imageUrl']?.toString() ?? '',
        });
      }

      if (mounted) {
        setState(() {
          categories = fetchedCategories;
          selectedCategory = categories.isNotEmpty ? categories.first['name']! : '';
        });
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }



  Stream<List<Map<String, dynamic>>> fetchProducts() {
    if (selectedCategory.isEmpty) return Stream.value([]);
    return FirebaseFirestore.instance.collection('products').where('category', isEqualTo: selectedCategory).snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text("All Categories",style:GoogleFonts.inter(color: Colors.white) ,),
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
            onPressed: () {
              Get.to(CartScreen());
            },
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
      body: RefreshIndicator(
      onRefresh: () async {
        await fetchUserData();
        await fetchCategories();
        fetchProducts();
        setState(() {});
        },
        child: Row(
          children: [
            // Category List
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(0.2),
              ),


              width: Get.width * 0.25,
              height: Get.height,
              child: Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) =>
                  // index==0?Container(
                  //   // color: selectedCategory!=categories[0]?Colors.grey.withOpacity(0.2): Colors.white,
                  //   height: Get.width*0.22,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(Icons.shopping_bag,color: Color.fromRGBO(255, 179, 0, 1),),
                  //       Text('For You',style: GoogleFonts.poppins(
                  //           color: Color.fromRGBO(255, 179, 0, 1)),
                  //           textAlign: TextAlign.center)
                  //     ],
                  //   ),
                  // ) :
                          GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index]['name']!;
                      });
                    },
                    child: Container(
                      height: Get.width * 0.22,
                      padding: EdgeInsets.all(10),
                      color: selectedCategory == categories[index]['name']? Colors.white : Colors.grey.withOpacity(0.2),
                      child: Column(
                        children: [
                          categories[index]['imageUrl']!.isNotEmpty ?
                          Image.network(categories[index]['imageUrl']!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.image_not_supported),
                          )
                              : Icon(Icons.image_not_supported),
                          SizedBox(height: 5),
                          Text(categories[index]['name']!, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Product Grid
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No products found."));
                  }

                  var products = snapshot.data!;
                  return GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Column(
                        children: [
                          product["imageUrl"] != null
                              ? Image.network(product["imageUrl"], height: 80, fit: BoxFit.cover,filterQuality: FilterQuality.high,)
                              : Icon(Icons.image_not_supported),
                          Text(product["name"] ?? "No Name",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}