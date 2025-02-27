import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, String>> categories = [];
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('categories').get();

      List<Map<String, String>> fetchedCategories = snapshot.docs.map((doc) {
        var data = doc.data();
        return {
          'name': data.containsKey('name') ? data['name'] as String : 'Unknown',
          'imageUrl': data.containsKey('imageUrl') ? data['imageUrl'] as String? ?? '' : '',
        };
      }).toList();

      if (fetchedCategories.isNotEmpty) {
        if (mounted) {
          setState(() {
            categories = fetchedCategories;
            selectedCategory = categories.first['name'] ?? '';
          });
        }
      } else {
        print("No categories found in Firestore.");
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  Stream<List<Map<String, dynamic>>> fetchProducts() {
    if (selectedCategory.isEmpty) return Stream.value([]);
    return FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: selectedCategory)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        title: Text("All Categories", style: GoogleFonts.inter(color: Colors.white)),
      ),
      key: _scaffoldKey,
      body: Row(
        children: [
          // Category List
          SizedBox(
            width: Get.width * 0.25,
            height: Get.height,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) =>
              // index==0?Container(
              //   // color: selectedCategory!=categories[0]?Colors.grey.withOpacity(0.2): Colors.white,
              //   height: Get.width*0.22,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(Icons.shopping_bag,color: Color.fromRGBO(255, 179, 0, 1),),
              //       Text('For You',style: GoogleFonts.poppins(
              //           color: Color.fromRGBO(255, 179, 0, 1)),
              //           textAlign: TextAlign.center)
              //     ],
              //   ),
              // ) :
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = categories[index]['name']!;
                  });
                },
                child: Container(
                  height: Get.width * 0.22,
                  padding: EdgeInsets.all(10),
                  color: selectedCategory == categories[index]['name']? Colors.white : Colors.grey.withOpacity(0.2),
                  child: Column(
                    children: [
                      categories[index]['imageUrl']!.isNotEmpty ?
                      Image.network(categories[index]['imageUrl']!,
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.image_not_supported),
                      )
                          : Icon(Icons.image_not_supported),
                      SizedBox(height: 5),
                      Text(categories[index]['name']!, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Product Grid
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No products found."));
                }

                var products = snapshot.data!;
                return GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Column(
                      children: [
                        product["imageUrl"] != null
                            ? Image.network(product["imageUrl"], height: 80, fit: BoxFit.cover)
                            : Icon(Icons.image_not_supported),
                        Text(product["name"] ?? "No Name"),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
