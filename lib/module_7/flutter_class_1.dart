import 'package:flutter/material.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Home page'),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                InkWell(
                    onTap: (){
                      print('click here');

                    },
                    onDoubleTap: (){

                    },
                    onLongPress: (){

                    },
                    child: Icon(Icons.add,size: 50,color: Colors.blue,)),

                IconButton(onPressed: (){
                  print('Item deleted');
                } , icon: Icon(Icons.delete)),

                TextButton(onPressed: (){
                  print('Clicked me from text button');
                }, child: Text('Click me',style: TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),)),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

                Text('This is column',style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),),

              ],
            )
        )

      //  body: SingleChildScrollView(
      //      scrollDirection: Axis.horizontal,
      //      child: Row(
      //    children: [
      //     Text('This is column',style: TextStyle(
      //       fontSize: 30,
      //       color: Colors.red,
      //     ),),
      //      SizedBox(
      //        width: 20,
      //      ),
      //
      //      Text('This is column',style: TextStyle(
      //        fontSize: 30,
      //        color: Colors.red,
      //      ),),
      //
      //      SizedBox(
      //        width: 30,
      //      ),
      //      Text('This is column',style: TextStyle(
      //        fontSize: 30,
      //        color: Colors.red,
      //      ),),
      //      SizedBox(
      //        width: 30,
      //      ),
      //
      //      Text('This is column',style: TextStyle(
      //        fontSize: 30,
      //        color: Colors.red,
      //      ),),
      //
      //      Text('This is column',style: TextStyle(
      //        fontSize: 30,
      //        color: Colors.red,
      //      ),),
      //
      //      Text('This is column',style: TextStyle(
      //        fontSize: 30,
      //        color: Colors.red,
      //      ),),
      //
      //      Text('This is column',style: TextStyle(
      //        fontSize: 30,
      //        color: Colors.red,
      //      ),),
      //
      //      Text('This is column',style: TextStyle(
      //        fontSize: 30,
      //        color: Colors.red,
      //      ),),
      //
      //  ],
      //  )

    );

  }
}

