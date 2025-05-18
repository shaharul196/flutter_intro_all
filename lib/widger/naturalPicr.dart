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
          color: Colors.white,
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

            Stack(
                children: [
                  Image.asset(image),
                 Positioned(
                  bottom: 10,
                  left: 14,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    color: Colors.white,
                    child: Text('4.5',style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),),

                  )

                ),

                 Positioned(
                    bottom: 10,
                    right: 14,
                    child: Container(
                    padding: EdgeInsets.all(3),
                    color: Colors.orange,
                    child: Text(city,style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),

                  )

              ),
              SizedBox(height: 200,),
              Icon(Icons.star,size: 40,color: Colors.orange,),

            ]
            ),

            Text(city,style: TextStyle(
              fontSize: 32,
              color: Colors.blue,
            ),),
          ],
        ),
      ),




    );
  }
}
