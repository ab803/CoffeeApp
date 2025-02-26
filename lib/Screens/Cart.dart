import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/Screens/Widgets/ItemCart.dart';
import 'Widgets/BottomNavigationBar.dart';

class Cart extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  Cart({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double get totalItems => widget.cartItems.fold(0, (sum, item) => sum + item['quantity']);
  double get totalPrice => widget.cartItems.fold(0, (sum, item) => sum + (double.parse(item['price']) * item['quantity']));

  void updateQuantity(int index, int change) {
    setState(() {
      widget.cartItems[index]['quantity'] += change;
      if (widget.cartItems[index]['quantity'] <= 0) {
        widget.cartItems.removeAt(index);
      }
    });
  }

  void removeFromCart(String title) {
    setState(() {
      widget.cartItems.removeWhere((item) => item['title'] == title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDD6C8),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart ($totalItems)", style: TextStyle(color: Color(0xff313131))),
        backgroundColor: Color(0xFFC67C4E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff313131)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                var item = widget.cartItems[index];
                return ItemCart(
                  Imhpath: item["imgPath"],
                  title: item["title"],
                  subtitle: item["subtitle"],
                  Price: item["price"],
                  Itemcount: item["quantity"],
                  onIncrease: () => updateQuantity(index, 1),
                  onDecrease: () => updateQuantity(index, -1),
                  onDelete: () => removeFromCart(item["title"]), // ✅ Fix applied here
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xffE3E3E3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  buildSummaryRow("Total:", "\$${totalPrice.toStringAsFixed(2)}"),
                  buildSummaryRow("Delivery:", "\$2.00"),
                  Divider(color: Color(0xff313131), thickness: 1),
                  buildSummaryRow("Sub Total:", "\$${(totalPrice + 2).toStringAsFixed(2)}"),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC67C4E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              minimumSize: Size(300, 50),
            ),
            onPressed: () {}, // Handle checkout logic here
            child: Text("Check out", style: TextStyle(color: Color(0xff313131))),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
