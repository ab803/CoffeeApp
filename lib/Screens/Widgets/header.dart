import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: BoxDecoration(
        color: Color(0xff313131),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location",
                style: TextStyle(
                  color: Color(0xffEDD6C8),
                  fontSize: 13,
                ),
              ),
              CircleAvatar(
                radius: 15, // Half of width & height
                backgroundImage: AssetImage("assets/images/1726837197476.jpg"),
              ),
            ],
          ),

          SizedBox(height: 5), // Spacing

          // City Name Row
          Row(
            children: [
              Text(
                "Cairo, Egypt",
                style: TextStyle(color: Color(0xffF9F2ED)),
              ),
              SizedBox(width: 5), // Spacing
              Image.asset(
                "assets/images/down-arrow.png",
                width: 20,
                height: 15,
                color: Color(0xffF9F2ED),
              ),
            ],
          ),

          SizedBox(height: 15), // Spacing

          // Search Bar with Icon
          Row(
            children: [
              Expanded( // Expands TextField properly
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search coffee",
                    hintStyle: TextStyle(color: Color(0xffEDD6C8)),
                    prefixIcon: Icon(Icons.search, color: Color(0xffF9F2ED)),
                    filled: true,
                    fillColor: Color(0xFF3D3D3D), // Slightly different background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 20), // Add spacing between TextField and Icon
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: (){
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Image.asset(
                        "assets/images/page_info_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.png",
                        width:20,
                        height: 20,
                      ),
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }

}