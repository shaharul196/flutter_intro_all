import 'package:flutter/material.dart';

class Customwid extends StatefulWidget {
  const Customwid({super.key});

  @override
  State<Customwid> createState() => _CustomwidState();
}

class _CustomwidState extends State<Customwid> {
  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Class'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),


         body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                cityCard(),
                SizedBox(width:10,),
                cityCard(),
                SizedBox(width:10,),
                cityCard(),
                SizedBox(width:10,),
              ],
            ),
          ),
             ),




    );
  }
}

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


