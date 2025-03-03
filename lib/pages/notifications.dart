import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> notifications = [
    {
      'title': 'Order Shipped',
      'message': 'Your order #12345 has been shipped.',
      'time': '2h ago',
      'icon': '🚚'
    },
    {
      'title': 'Limited Time Offer!',
      'message': 'Get 20% off on electronics. Hurry!',
      'time': '5h ago',
      'icon': '🔥'
    },
    {
      'title': 'Order Delivered',
      'message': 'Your order #98765 has been delivered.',
      'time': '1d ago',
      'icon': '📦'
    },
    {
      'title': 'New Collection Arrived',
      'message': 'Check out the latest fashion trends.',
      'time': '2d ago',
      'icon': '🛍️'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text("Notifications",style:GoogleFonts.inter(color: Colors.white) ,),
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
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Text(
              notification['icon']!,
              style: TextStyle(fontSize: 24),
            ),
            title: Text(notification['title']!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(notification['message']!),
            trailing: Text(notification['time']!,
                style: TextStyle(color: Colors.grey)),
            onTap: () {},
          );
        },
      ),
    );
  }
}
