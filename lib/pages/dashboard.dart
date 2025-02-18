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
    );
  }
}
