import 'package:flutter/material.dart';

class imageall extends StatelessWidget {
  const imageall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image all'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("asset/istockphoto-1126841725-612x612.jpg"),
            // Image.network("https://st2.depositphotos.com/2853475/5623/i/600/depositphotos_56233335-stock-photo-grass.jpg"),
            SizedBox(
              height: 15,
            ),

            ElevatedButton(onPressed: (){},style:ElevatedButton.styleFrom(
              // foregroundColor: Colors.red,
              backgroundColor: Colors.blue,
            ), child: Text('Submit',style: TextStyle(
             color: Colors.white,


            ),)),

            SizedBox(height: 15,),
            Image.asset('asset/download (2).jpeg'),
            Image.network('https://logolook.net/wp-content/uploads/2021/06/Facebook-Log%D0%BE.png'),
          ],
        ),
      ),
    );
  }
}
