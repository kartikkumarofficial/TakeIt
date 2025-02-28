import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'RotatedContainer.dart';

Widget productItem(String title, String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/images/homescreen/$imagePath'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    ),
  );
}
Widget categoryItem(String title, String imagePath, String colorr) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(-170.7),
          child: PhysicalModel(
            elevation: 20,
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
            child: Container(
              width: Get.width * 0.22,
              height: Get.width * 0.2,
              decoration: BoxDecoration(
                color: Color(int.parse(colorr.replaceFirst('#', '0xFF'))),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(int.parse(colorr.replaceFirst('#', '0xFF')))
                        .withOpacity(0.6),
                    offset: Offset(0, 5),
                    blurRadius: 2,
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment: Alignment.center,

            child: Image.asset(
              'assets/images/homescreen/$imagePath',
              fit: BoxFit.fill,
              width: Get.width * 0.18,
            ),
          ),
        ),
      ],
    ),
  );
}