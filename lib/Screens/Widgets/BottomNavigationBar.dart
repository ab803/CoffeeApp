import 'package:flutter/material.dart';
import 'package:task2/Screens/Cart.dart';

class BottomNavBar extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const BottomNavBar({super.key, required this.cartItems});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xffF9F2ED),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xffE3E3E3),
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFFC67C4E), // Brown active color
        unselectedItemColor: Color(0xffE3E3E3), // Gray inactive color
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.home, size: 30),
                if (_selectedIndex == 0)
                  Container(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 30),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart(cartItems: widget.cartItems,)),
                  );                },
                child: Icon(Icons.shopping_bag_outlined, size: 30)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none, size: 30),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}