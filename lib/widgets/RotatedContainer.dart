import 'package:flutter/material.dart';
import 'dart:math';

class RotatedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhysicalModel(
          color: Colors.yellowAccent, // Background color
          elevation: 10, // Elevation for shadow effect
          shadowColor: Colors.black, // Shadow color
          borderRadius: BorderRadius.circular(10),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective effect
              ..rotateY(-pi / 6), // Rotating in the negative Y direction

            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Rotated Box",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
