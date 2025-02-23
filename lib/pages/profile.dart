import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.edit, "title": "Edit Profile"},
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
          onPressed: () {},
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
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
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
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150'), // Placeholder image
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Carter Sam",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "+001 897387****",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "carter888***@gmail.com",
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
                    left: Get.width*0.1,

                    child:Container(
                      decoration: BoxDecoration(


                      ),
                      child: Text('PREMIUM'.tr,
                        style: GoogleFonts.poppins(
                          shadows: [BoxShadow(
                            color: Colors.grey,
                            // spreadRadius: 5,
                            blurRadius: 1,
                            offset: Offset(0,1)
                          )],
                            color: Color.fromRGBO(255, 179, 0, 1),
                          fontSize: Get.width*0.04
                      ),),
                    ) ),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == menuItems.length) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "My Activity",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                    onTap: () {},
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
