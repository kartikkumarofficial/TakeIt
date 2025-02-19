import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0,113,220,1.0,),
        title: Text("TakeIt",
          style: GoogleFonts.poppins(
            fontSize: Get.width*0.1,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0,113,220,1.0,),
            fontStyle: FontStyle.italic,
          ),),
        

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Account"),
        ], ),
    );
  }
}
