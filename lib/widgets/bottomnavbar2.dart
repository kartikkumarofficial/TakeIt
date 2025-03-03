import 'package:TakeIt/pages/cart.dart';
import 'package:TakeIt/pages/dashboard.dart';
import 'package:TakeIt/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/categories.dart';
import '../pages/notifications.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      DashboardScreen(),
      CategoriesScreen(),
      CartScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];

    var srcheight = MediaQuery.of(context).size.height;
    var srcwidth = MediaQuery.of(context).size.width;
    var smallscreen = srcwidth <= 640;
    var bigscreen = srcwidth > 640;

    return Scaffold(
      bottomNavigationBar: smallscreen
          ? Container(
        // height: srcheight * 0.1,
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController?.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            });
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: GoogleFonts.poppins(fontSize: Get.width * 0.028),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: Get.width * 0.028),
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.menu, size: 30), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, size: 30), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined, size: 30), label: "Notifications"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined, size: 30), label: "Account"),
          ],
        ),
      )
          : null,
      body: Row(
        children: [
          if (bigscreen)
            NavigationRail(
              selectedIndex: _selectedIndex,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home, color: Colors.blue),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.menu),
                  selectedIcon: Icon(Icons.menu, color: Colors.blue),
                  label: Text("Categories"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart_outlined),
                  selectedIcon: Icon(Icons.shopping_cart, color: Colors.blue),
                  label: Text("Cart"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.notifications_outlined),
                  selectedIcon: Icon(Icons.notifications, color: Colors.blue),
                  label: Text("Notifications"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle_outlined),
                  selectedIcon: Icon(Icons.account_circle, color: Colors.blue),
                  label: Text("Account"),
                ),
              ],
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: widgetList,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedItem(int index, IconData icon) {
    bool isSelected = _selectedIndex == index;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Icon(
        icon,
        size: 30,
        color:  Colors.white70,
      ),
    );
  }
}
