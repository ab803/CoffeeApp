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

  final List<Map<String, String>> coffeeItems = [
    {"imgPath": "assets/images/Espresso.jpeg", "title": "Espresso", "subtitle": "Strong & Bold", "price": "3.99", "category": "Espresso","rate" : "4.5"},
    {"imgPath": "assets/images/Cappuccino.jpeg", "title": "Cappuccino", "subtitle": "Creamy & Smooth", "price": "4.99", "category": "Latte","rate" : "4.7"},
    {"imgPath": "assets/images/latte.jpeg", "title": "Latte", "subtitle": "Mild & Milky", "price": "4.49", "category": "Latte","rate" : "4.8"},
    {"imgPath": "assets/images/Americano.jpeg", "title": "Americano", "subtitle": "Light & Classic", "price": "3.49", "category": "Americano","rate" : "4.3"},
    {"imgPath": "assets/images/Mocha.jpeg", "title": "Mocha", "subtitle": "Chocolate & Coffee", "price": "5.49", "category": "Latte","rate" : "4.4"},
    {"imgPath": "assets/images/Macchiato.jpeg", "title": "Macchiato", "subtitle": "Espresso & Foam", "price": "4.29", "category": "Macchiato","rate" : "4.8"},
  ];

  List<Map<String, String>> get filteredItems {
    if (selectedIndex == 0) return coffeeItems;
    return coffeeItems.where((item) => item["title"] == categories[selectedIndex]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
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

            // Category Selector
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: isSelected ? Color(0xFFC67C4E) : Color(0xffF9F2ED),
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: isSelected ? Color(0xffF9F2ED) : Color(0xff313131),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
