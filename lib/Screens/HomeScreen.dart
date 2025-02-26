
import 'package:flutter/material.dart';
import 'Widgets/BottomNavigationBar.dart';
import 'Widgets/ItemCard.dart';
import 'Widgets/header.dart';
import 'Widgets/CustomOfferImages.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["All Coffee", "Macchiato", "Latte", "Espresso", "Americano"];
  int selectedIndex = 0;

  List<Map<String, dynamic>> cart = []; // ✅ Allows numbers, strings, etc.
  // Stores added items

  final List<Map<String, String>> coffeeItems = [
    {"imgPath": "assets/images/Esperso.jpeg", "title": "Espresso", "subtitle": "Strong & Bold", "price": "3.99", "category": "Espresso", "rate": "4.5"},
    {"imgPath": "assets/images/Cappuccino.jpeg", "title": "Cappuccino", "subtitle": "Creamy & Smooth", "price": "4.99", "category": "Latte", "rate": "4.7"},
    {"imgPath": "assets/images/latte.jpeg", "title": "Latte", "subtitle": "Mild & Milky", "price": "4.49", "category": "Latte", "rate": "4.8"},
    {"imgPath": "assets/images/Americano.jpeg", "title": "Americano", "subtitle": "Light & Classic", "price": "3.49", "category": "Americano", "rate": "4.3"},
    {"imgPath": "assets/images/Mocha.jpeg", "title": "Mocha", "subtitle": "Chocolate & Coffee", "price": "5.49", "category": "Latte", "rate": "4.4"},
    {"imgPath": "assets/images/Macchiato.jpeg", "title": "Macchiato", "subtitle": "Espresso & Foam", "price": "4.29", "category": "Macchiato", "rate": "4.8"},
  ];

  List<Map<String, String>> get filteredItems {
    if (selectedIndex == 0) return coffeeItems;
    return coffeeItems.where((item) => item["category"] == categories[selectedIndex]).toList();
  }

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      int index = cart.indexWhere((cartItem) => cartItem['title'] == item['title']);
      if (index != -1) {
        int currentQuantity = int.tryParse(cart[index]['quantity'].toString()) ?? 0;
        cart[index]['quantity'] = (currentQuantity + 1) ;
      } else {
        cart.add({...item, 'quantity': 1}); // Store as int
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          closeIconColor: Color(0xFFC67C4E),
          backgroundColor: Color(0xff313131),
          content: Text("Item added to cart"),
          duration: Duration(seconds: 2), // Controls how long it stays visible
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(cartItems: cart,),
      backgroundColor: Color(0xffEDD6C8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  header(),
                  CustomeOfferImages(),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 80)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index; // Update selected category index
                          });
                        },
                        child: Container(
                          height: 10,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedIndex == index ? Color(0xFFC67C4E) : Color(0xffF9F2ED), // Change color on selection
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: selectedIndex == index ? Color(0xffF9F2ED) : Color(0xff313131),
                                fontWeight: FontWeight.bold// Highlight selected
                              ),
                            ),
                          ),
                        ),
                      )

                    );
                  },
                ),
              ),
            ),


            // Coffee Grid View
            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return ItemCard(
                      imgPath: filteredItems[index]["imgPath"]!,
                      title: filteredItems[index]["title"]!,
                      subtitle: filteredItems[index]["subtitle"]!,
                      price: filteredItems[index]["price"]!,
                      rate: filteredItems[index]["rate"]!,
                      onAdd: () => addToCart(filteredItems[index]), // Pass function
                    );
                  },
                  childCount: filteredItems.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

