import 'package:flutter/material.dart';

class naturalpicr extends StatelessWidget {
  final String image,city;

  const naturalpicr({
    super.key, required this.image, required this.city,
  });

  @override
  Widget build(BuildContext context) {
    // Image.asset(image);
    // Text(city);
    return Container(
      margin: EdgeInsets.all(6),
      // padding: EdgeInsets.all(20),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              offset: Offset(8, 8),
              color: Colors.blue,
              blurRadius: 12,
            )
          ]
      ),

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Image.asset(image),
            Text(city,style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),),
          ],
        ),
      ),




    );
  }
}
