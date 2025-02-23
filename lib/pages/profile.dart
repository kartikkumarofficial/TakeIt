import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                SizedBox(height: 8),
                Text(
                  "PREMIUM",
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length + 1, // +1 for "My Activity" section
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
    );
  }
}
