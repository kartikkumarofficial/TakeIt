import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:TakeIt/pages/cart.dart';
import 'package:TakeIt/pages/editprofile.dart';
import 'package:TakeIt/widgets/Drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
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

  // Future<String> fetchPhoneNumber() async {
  //   User? user = _auth.currentUser;
  //   if (user != null) {
  //     DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
  //     return userDoc['phoneNumber'] ?? 'Add Number';
  //   }
  //   return 'Add Number';
  // }
  final FirebaseAuth _auth = FirebaseAuth.instance;
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


  @override
  void initState() {

    super.initState();
    fetchUserData();
  }
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  bool _isUploading = false;

  Future<void> _pickAndUploadImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        print("No image selected.");
        return;
      }

      setState(() {
        _selectedImage = File(image.path);
        _isUploading = true;
      });

      String imageUrl = await _uploadToCloudinary(_selectedImage!);

      if (imageUrl.isNotEmpty) {
        await _saveToFirestore(imageUrl);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile image updated successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload image")),
        );
      }
    } catch (e) {
      print("Error selecting or uploading image: $e");
    } finally {
      setState(() => _isUploading = false);
    }
  }


  // uploading image to cloudinary
  Future<String> _uploadToCloudinary(File imageFile) async {
    try {
      String cloudinaryUrl = "https://api.cloudinary.com/v1_1/dwfowhzwn/image/upload";
      String uploadPreset = "my_preset";

      var request = http.MultipartRequest("POST", Uri.parse(cloudinaryUrl))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);

      if (response.statusCode == 200) {
        return jsonResponse["secure_url"];
      } else {
        print("Upload failed: ${jsonResponse['error']['message']}");
        return "";
      }
    } catch (e) {
      print("Cloudinary Error: $e");
      return "";
    }
  }

  //storing imageurl to users collection in firestore
  Future<void> _saveToFirestore(String imageUrl) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'profileImage': imageUrl,
        });
        print("Profile image updated in Firestore.");
      }
    } catch (e) {
      print("Error updating Firestore: $e");
    }
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
                      ? CachedNetworkImageProvider("$image?t=${DateTime.now().millisecondsSinceEpoch}") as ImageProvider
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
                                    GestureDetector(
                                      onTap: _pickAndUploadImage,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: image.isNotEmpty
                                            ? CachedNetworkImageProvider("$image?t=${DateTime.now().millisecondsSinceEpoch}")
                                            : AssetImage('assets/images/defprofile.png') as ImageProvider,
                                        child: image.isEmpty
                                            ? Icon(Icons.person, size: 40, color: Colors.white)
                                            : null,
                                      ),
                                    ),

                                    SizedBox(height: 8),
                                    FutureBuilder<DocumentSnapshot>(
                                      future: _firestore.collection('users').doc(_auth.currentUser!.uid).get(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        }
                                        if (!snapshot.hasData || snapshot.data == null) {
                                          return Text("No User Data");
                                        }

                                        var userData = snapshot.data!;
                                        String? tempUsername;
                                        try {
                                          tempUsername = userData['username'];
                                        } catch (e) {
                                          tempUsername = null;
                                        }
                                        return Text(
                                          tempUsername ?? 'User',
                                          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                                        );
                                      },
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
