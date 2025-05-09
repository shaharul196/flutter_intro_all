import 'package:flutter/material.dart';

class queryall extends StatefulWidget {
  const queryall({super.key});

  @override
  State<queryall> createState() => _queryallState();
}

class _queryallState extends State<queryall> {
  @override
  Widget build(BuildContext context) {
    // print('hello');
   Size screenSize = MediaQuery.of(context).size;
   //double screenWidth = MediaQuery.of(context).size;
   double FontSize = screenSize.width >600 ? 32 : 18;
   double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: screenSize.width*0.5,
            height: screenSize.height*0.3,
            color: Colors.red,
          ),
        ),

      Text('This is Media Query text',style: TextStyle(
        fontSize: FontSize,
      ),),
      Text('Pixel Ratio: $pixelRatio'),

       // Wrap(
       //   spacing: 8.0,
       //   runSpacing: 4.0,
       //   children: List.generate(10, (index){
       //     return Chip(label:Text('Item $index' ));
       //   }),
       // )

        Wrap(
          spacing: 8.0,
          runSpacing: 7.0,
          children: List.generate(25, (index){
            return Container(
            color: Colors.red,
            height: 50,
            width: 50,

            );
        }
        ),
        )



      ],
    ),
    );
  }


}
