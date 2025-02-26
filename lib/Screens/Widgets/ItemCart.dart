import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  final String Imhpath;
  final String title;
  final String subtitle;
  final String Price;
  final int Itemcount;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete; // ✅ Add delete function

  const ItemCart({
    super.key,
    required this.Imhpath,
    required this.title,
    required this.subtitle,
    required this.Price,
    required this.Itemcount,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete, // ✅ Required delete function
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xffF9F2ED),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(Imhpath, width: 90, height: 90, fit: BoxFit.cover),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Color(0xff313131), fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(subtitle, style: TextStyle(color: Color(0xffC67C4E), fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(height: 4),
                  Text("\$$Price", style: TextStyle(color: Color(0xff313131), fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    _buildActionButton(Icons.remove, onDecrease),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("$Itemcount", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    _buildActionButton(Icons.add, onIncrease),
                  ],
                ),
                SizedBox(height: 8),
                IconButton(
                  onPressed: onDelete, // ✅ Call delete function
                  icon: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Color(0xFFC67C4E), borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.delete_forever, color: Colors.white, size: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(color: Color(0xFFC67C4E), borderRadius: BorderRadius.circular(10)),
      child: IconButton(icon: Icon(icon, size: 20, color: Color(0xffF9F2ED)), onPressed: onPressed),
    );
  }
}

