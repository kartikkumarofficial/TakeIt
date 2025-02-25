import 'package:TakeIt/pages/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> categories = [
    "1","Shoes", "Laptops", "Electronics", "Food", "Kitchen", "Furniture", "Mobile", "Kids"
  ];

  //products stored in the form of map
  final Map<String, List<Map<String, String>>> products = {
    "Shoes": [
      {"name": "Men Suit", "image": "assets/images/cart5.jpeg"},
      {"name": "Belt", "image": "assets/images/cart5.jpeg"},
      {"name": "Pant", "image": "assets/images/cart5.jpeg"},
      {"name": "Casuals", "image": "assets/images/cart5.jpeg"},
      {"name": "Sandle", "image": "assets/images/cart5.jpeg"},
      {"name": "Slipper", "image": "assets/images/cart5.jpeg"},
    ],
    "Laptops": [
      {"name": "Gaming Laptop", "image": "assets/images/cart5.jpeg"},
      {"name": "Ultrabook", "image": "assets/images/cart5.jpeg"},
    ],

  };

  String selectedCategory = "Shoes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text("All Categories",style:GoogleFonts.inter(color: Colors.white) ,),
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
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),


      drawer: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(8)),
          ),
          height: Get.height * 1,
          width: Get.width * 0.65,
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
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [

            SizedBox(
              width: Get.width*0.2,
              height: Get.height,
              child: Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) =>(index==0) ? Container(
                    // color: selectedCategory!=categories[0]?Colors.grey.withOpacity(0.2): Colors.white,
                    height: Get.width*0.22,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag,color: Color.fromRGBO(255, 179, 0, 1),),
                        Text('For You',style: GoogleFonts.poppins(
                            color: Color.fromRGBO(255, 179, 0, 1)),
                            textAlign: TextAlign.center)
                      ],
                    ),
                    )
                      :
                     GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: Container(
                        height: Get.width*0.22,
                        padding: EdgeInsets.all(10),
                        color: selectedCategory == categories[index]
                            ? Colors.white : Colors.grey.withOpacity(0.2),
                        child: Column(
                          children: [
                            Icon(Icons.category),
                            Text(categories[index], textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                ),
              ),
            ),


            //gridd
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: products[selectedCategory]?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[selectedCategory]![index];
                  return Column(
                    children: [
                      Image.asset(product["image"]!, height: 80, fit: BoxFit.cover),
                      Text(product["name"]!),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
