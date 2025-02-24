import 'package:flutter/cupertino.dart';

class CustomeOfferImages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  Positioned(
      bottom: -70, // Adjust position to match the reference screen
      left: 10,
      right: 10,
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Color(0xFFC67C4E),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage("assets/images/Screenshot_2025-02-23_211658-removebg-preview.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

  }

}