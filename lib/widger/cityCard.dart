import 'package:flutter/material.dart';

class cityCard extends StatelessWidget {
  const cityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(10),
      padding:EdgeInsets.all(10) ,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.orangeAccent,
              offset: Offset(8, 8),
              blurRadius: 13,
            )
          ]
      ),

      width: 320,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 50,),
          Image.asset(
              "asset/facebook-76536_1280.png"),
          Text('This is pic',style: TextStyle(
            fontSize: 30,
            color: Colors.deepPurple,
          ),),
        ],
      ),
    );
  }
}