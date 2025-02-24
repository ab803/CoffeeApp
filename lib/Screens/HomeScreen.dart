import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/Screens/Widgets/CustomOfferImages.dart';
import 'package:task2/Screens/Widgets/header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ["All Coffee", "Macchiato", "Latte", "Espresso", "Americano"];
  int selectedIndex = 0; // To track selected category index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              header(),
              CustomeOfferImages(),
            ],
          ),
          SizedBox(height: 80),

          // Horizontal Category List
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index; // Check if category is selected

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selected index
                      });
                    },
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: isSelected ? Color(0xFFC67C4E) : Color(0xffF9F2ED),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black, // Simplified color
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
        ],
      ),
    );
  }
}
