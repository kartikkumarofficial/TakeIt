import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatefulWidget {
  final Map<String, dynamic> product;

  CartItem({required this.product});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    quantity = widget.product['quantity'] ?? 1;
  }

  void updateQuantity(int change) {
    setState(() {
      quantity = (quantity + change).clamp(1, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          padding: EdgeInsets.all(Get.width * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: Get.width * 0.2,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(widget.product['image'], size: Get.width * 0.1, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(width: Get.width * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 10,),
                    Text(
                      widget.product['name'],
                      style: GoogleFonts.poppins(
                        fontSize: Get.width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "\$${widget.product['price']}",
                      style: GoogleFonts.poppins(
                        fontSize: Get.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      "FREE SHIPPING",
                      style: GoogleFonts.poppins(
                        fontSize: Get.width * 0.035,
                        color: Colors.grey.withOpacity(0.9),
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      widget.product['inStock'] ? "In Stock" : "Out of Stock",
                      style: TextStyle(
                        fontSize: Get.width * 0.03,
                        fontWeight: FontWeight.w500,
                        color: widget.product['inStock'] ? Colors.green : Colors.red,
                      ),
                    ),

                    Row(



                      children: [
                        Text(
                          "Qty: ",
                          style: GoogleFonts.poppins(fontSize: Get.width * 0.035, color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () => updateQuantity(-1),
                          icon: Icon(Icons.remove, color: Colors.black, size: Get.width * 0.05),
                        ),
                        Text(
                          "$quantity",
                          style: GoogleFonts.poppins(fontSize: Get.width * 0.035, color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () => updateQuantity(1),
                          icon: Icon(Icons.add, color: Colors.black, size: Get.width * 0.05),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: Get.width*0.01,
          left: Get.width*0.034,
          // right: 0,
          child: Container(
            height: Get.width*0.045,
            width: Get.width*0.143,
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
                color: Color.fromRGBO(241, 249, 242, 1),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 1),
                    spreadRadius: 1
                  )
                ]
            ),
            child: Text(
              "Hot Deal",
              style: GoogleFonts.poppins(
                fontSize: Get.width * 0.03,
                color: Colors.green,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
