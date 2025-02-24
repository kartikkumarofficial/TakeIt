import 'package:flutter/material.dart';
import 'dart:math';

class Rotated3DContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("3D Rotated Container")),
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(-170.4),
          child: PhysicalModel(
            color: Colors.white,
            elevation: 20 ,
            shadowColor: Colors.black,
            // shape: BoxShape,
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
