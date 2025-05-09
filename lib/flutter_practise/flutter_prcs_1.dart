import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'This is app',
      home: Home(),


    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),


    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            InkWell(
              onTap: (){
                print('click here');
              },
                onDoubleTap: (){
                print('Double click here');
                },
                child: Icon(Icons.add,size: 70,color: Colors.red,)),

            IconButton(onPressed:(){
              print('Delete button pressed');
            } , icon: Icon(Icons.delete,size: 70,color: Colors.red,)),

            TextButton(onPressed:(){
              print('Click me pressed');
            } , child: Text('Click me',style: TextStyle(
              fontSize: 60,
              backgroundColor: Colors.green,
              color: Colors.white,
              fontWeight: FontWeight.bold,




            ),)),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

            Text('This is text body',style: TextStyle(
              fontSize:35,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,

            ),),

          ],
        ),
      ),
    ),



     // body: SingleChildScrollView(
     //   scrollDirection: Axis.horizontal,
     //   child: Row(
     //   crossAxisAlignment: CrossAxisAlignment.center,
     //     children: [
     //
     //       Text('This is row',style: TextStyle(
     //         fontSize: 35,
     //         color: Colors.indigoAccent,
     //         fontWeight: FontWeight.w500,
     //       ),),
     //
     //       SizedBox(
     //         width: 25,
     //       ),
     //
     //       Text('This is row',style: TextStyle(
     //         fontSize: 35,
     //         color: Colors.indigoAccent,
     //         fontWeight: FontWeight.w500,
     //       ),),
     //
     //       Text('This is row',style: TextStyle(
     //         fontSize: 35,
     //         color: Colors.indigoAccent,
     //         fontWeight: FontWeight.w500,
     //       ),),
     //
     //       Text('This is row',style: TextStyle(
     //         fontSize: 35,
     //         color: Colors.indigoAccent,
     //         fontWeight: FontWeight.w500,
     //       ),),
     //
     //       Text('This is row',style: TextStyle(
     //         fontSize: 35,
     //         color: Colors.indigoAccent,
     //         fontWeight: FontWeight.w500,
     //       ),),
     //
     //       Text('This is row',style: TextStyle(
     //         fontSize: 35,
     //         color: Colors.indigoAccent,
     //         fontWeight: FontWeight.w500,
     //       ),),
     //
     //
     //
     //     ],
     //   ),
     // ),

    );

  }
}
