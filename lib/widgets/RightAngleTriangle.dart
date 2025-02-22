import 'package:flutter/material.dart';




class RightAngleTopRightTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromRGBO(255, 179, 0, 1) // Orange color
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width, 0); // Top-right corner (Right angle)
    path.lineTo(40, 0); // Top-left corner
    path.lineTo(size.width, 99.7); // Bottom-right corner
    path.close(); // Complete the triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
