import 'package:flutter/material.dart';
import 'dart:math';

class Rotated3DContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("3D Rotated Container")),
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective effect
            ..rotateX(189.5), // Rotate along Y-axis
          child: PhysicalModel(
            color: Colors.white,
            elevation: 20 , // Adds shadow/elevation
            shadowColor: Colors.black54,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              // child: Text(
              //   "3D Box",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
class MyAppr extends StatelessWidget {
  const MyAppr({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.shade300,
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/jacket_image.png',  // Place your image in the assets folder
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyAppr(),
  ));
}
