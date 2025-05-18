import 'package:flutter/material.dart';

import '../../widger/naturalPicr.dart';


class customwidgin extends StatefulWidget {
  const customwidgin({super.key});

  @override
  State<customwidgin> createState() => _customwidginState();
}

class _customwidginState extends State<customwidgin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widget'),
        backgroundColor: Colors.pink,
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(

          children: [
            naturalpicr(image: 'asset/images (6).jpeg',city:'Rajshahi'),
            
            SizedBox(width:15,),
            naturalpicr(image:'asset/download (2).jpeg',city:'Dhaka'),
            
            SizedBox(width:15,),
            naturalpicr(image:'asset/images.jpeg',city:'Rangpur'),
            
            SizedBox(width:15,),
            naturalpicr(image:'asset/images (5).jpeg',city:'Nilphamary'),
            


          ],
        ),
      ),

    );
  }
}

// class naturalpicr extends StatelessWidget {
//   final String image,city;
//   const naturalpicr ({
//
//     super.key, required this.image, required this.city,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(6),
//       // padding: EdgeInsets.all(20),
//       height: 300,
//       width: 300,
//       decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(25),
//        color: Colors.grey,
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(8, 8),
//             color: Colors.blue,
//             blurRadius: 12,
//           )
//         ]
//       ),
//
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: 15,),
//           Image.asset(image),
//           Text(city,style: TextStyle(
//             fontSize: 25,
//             color: Colors.white,
//           ),),
//         ],
//       ),
//
//
//
//
//     );
//   }
// }

