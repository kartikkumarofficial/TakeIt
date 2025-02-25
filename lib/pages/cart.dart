import 'package:TakeIt/pages/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: CartScreen()));
}

class CartScreen extends StatefulWidget {

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> wishlist = [
    {"title": "Slipper", "price": 450, "image": "assets/slipper.png"},
    {"title": "Pant", "price": 370, "image": "assets/pant.png"},
    {"title": "Watch", "price": 650, "image": "assets/watch.png"},
    {"title": "Jacket", "price": 1000, "image": "assets/jacket.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Text("Cart",style:GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.w500) ,),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white,size: Get.width*0.07,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.keyboard_voice_rounded,color: Colors.white,size: Get.width*0.075,),
            onPressed: () {},
          ),

        ],
      ),


      drawer: Container(
        height:double.infinity,
          width: Get.width * 0.65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(8)
            ),
          ),
          // height: Get.height * 1,

          // color: Colors.white,
          alignment: Alignment.topLeft,
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: ClipOval(
                    // clipBehavior: Clip.,
                    child: Image.asset('assets/images/profileman.jpeg' ),
                  ),
                ),
                title: Text('Carter Sam',style: GoogleFonts.poppins(
                    fontSize: Get.width*0.045
                ),),
                subtitle: Text('+91 9876543211',style: GoogleFonts.poppins(color: Colors.grey,fontSize: Get.width*0.033),),
              ),
              Padding(
                padding: EdgeInsets.only(right: Get.width*0.18,left: Get.width*0.05),
                child: Divider(
                  thickness: 1.2 ,

                ),
              ),


              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Refer and Earn',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){},
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Coupons',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){},
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('My Orders',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){},
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Wishlist',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){},
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Wallet',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){},
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Reviews',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){},
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Questions and Answers',style: GoogleFonts.poppins(fontSize: Get.width*0.04),),
                ),
                onTap: (){},
              ),
              Padding(
                padding:  EdgeInsets.only(
                  top: Get.width*0.4,
                  left: Get.width*0.033,
                  right: Get.width*0.033,

                ),
                child: Container(
                  width: Get.width*0.8,
                  height: Get.width*0.091,
                  child: Hero(tag: 'google',
                    child: ElevatedButton(

                        onPressed: (){
                          Get.to(SignUpScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shadowColor: Colors.black,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )

                        ),

                        child:Text('Log Out'.tr,style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: Get.width*0.045,
                            color: Colors.white
                        ),) ),
                  ),
                ),
              )


            ],
          )
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.black54),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text("12 Ram Bhavan, 36 Street Road, Mullana...",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(fontSize: 16)),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    if (wishlist.isNotEmpty) WishlistContainer(wishlist: wishlist),
                    SizedBox(height: 20),
                    Text("In Cart", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    CartItem(),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -Get.width*0.1,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 179, 0, 1),
                  borderRadius: BorderRadius.circular(22)
                ),
                padding: EdgeInsets.all(16),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Proceed to Buy (1 item)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("\$1000", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          Text("Wishlist", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                  borderRadius: BorderRadius.circular(10),
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

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            color: Colors.blue.shade100,
            child: Icon(Icons.image, size: 50, color: Colors.blue),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nike Alpha Bloober Men Shoe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("\$1999", style: TextStyle(fontSize: 14, color: Colors.red)),
                Text("FREE Shipping", style: TextStyle(fontSize: 12, color: Colors.green)),
                Row(
                  children: [
                    Text("Qty: "),
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                    Text("1"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
