import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final String subtitle;
  final String price;
  final String rate;

  const ItemCard({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200, // 🔹 Increased height for better spacing
      decoration: BoxDecoration(
        color: Color(0xffF9F2ED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Stack(
              children:[ ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imgPath,
                  width: 140,
                  height: 120, // 🔹 Adjusted height
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print("Image not found: $imgPath");
                    return Image.asset(
                      "assets/images/Gemini_Generated_Image_2tbj642tbj642tbj.jpeg", // 🔹 Use a valid fallback image
                      width: 140,
                      height: 120,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff313131).withOpacity(.5),
                      borderRadius: BorderRadius.circular(12),
                      
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [ Icon(Icons.star,color: Color(0xFFC67C4E),size: 15,), Text(rate,style: TextStyle(color: Color(0xffF9F2ED)),)],
                      ),
                    ),
                  )
              )
              ]
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff313131),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              subtitle,
              style: TextStyle(
                color: Color(0xffEDD6C8),
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "\$$price",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff313131),
                ),
              ),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    print("Added $title to cart!");
                  },
                  icon: Icon(Icons.add, size: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
