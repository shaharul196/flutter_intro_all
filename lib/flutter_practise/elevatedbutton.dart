import 'package:flutter/material.dart';

class buttonall extends StatefulWidget {
  const buttonall({super.key});
  
  @override
  State<buttonall> createState() => _buttonallState();
}

class _buttonallState extends State<buttonall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElevatedButton'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,

          ), child: Text('Submit')),
          SizedBox(height: 15,),
          Image.asset('asset/download (2).jpeg'),
          SizedBox(height: 14,),
          Image.asset('asset/images (6).jpeg'),
          SizedBox(height: 25,),
          Image.network('https://images.unsplash.com/photo-1662070479020-73f77887c87c?q=80&w=2054&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        ],
      ),
    );
  }
}
