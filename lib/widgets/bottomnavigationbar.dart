
import 'package:TakeIt/pages/dashboard.dart';
import 'package:TakeIt/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen(),
    DashboardScreen(),
    ProfileScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.poppins(fontSize: Get.width * 0.028),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: Get.width * 0.028),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu, size: 30), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, size: 30), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined, size: 30), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined, size: 30), label: "Account"),
        ],
      ),
    );
  }
}
