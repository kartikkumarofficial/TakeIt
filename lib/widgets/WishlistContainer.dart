import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';





class WishlistContainer extends StatelessWidget {
  final List<Map<String, dynamic>> wishlist;
  WishlistContainer({required this.wishlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(245, 245, 245, 1),
                  boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
                ),
                child: Row(
                  children: [
                    Container(
                      height: Get.width*0.2,width:Get.width*0.2,
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(4)
                      ) ,
                      child: Image.asset('assets/images/cart1.png',fit: BoxFit.contain,),
                    ),


                    Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:3),
                            child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: Get.width*0.18
                                ),
                                child: Text(wishlist[index]['title'], style: GoogleFonts.poppins(fontSize: Get.width*0.04, fontWeight: FontWeight.w500 ),overflow: TextOverflow.ellipsis,)),
                          ),
                          Text("\$${wishlist[index]['price']}", style: GoogleFonts.poppins(fontSize: Get.width*0.04,fontWeight: FontWeight.w500, color: Colors.black)),
                          SizedBox(height: 5),
                          SizedBox(
                              height: Get.width*0.07,
                              width: Get.width*0.2,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:  Color.fromRGBO(255, 179, 0, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                                ),
                                onPressed: () {},
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Shop Now",
                                        style: GoogleFonts.poppins(
                                          fontSize: Get.width * 0.037,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )

                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}



