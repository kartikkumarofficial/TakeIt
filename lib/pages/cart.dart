import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cart", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
