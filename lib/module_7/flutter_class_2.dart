import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Owner my app',
        home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      backgroundColor: Colors.grey.withOpacity(0.9),
      appBar: AppBar(
        title: Text('class-2'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                print('button presed');
              },
              child: Text('Button'),
            ),




            SizedBox(
              height: 50,
              // width: double.infinity,
              width: 300,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  print('button presed');
                },
                child: Text('Button'),
              ),
            ),

            OutlinedButton(onPressed: () {}, child: Text('OutLine Button')),

            GestureDetector(
              onTap: () {
                print('text pressed');
              },
              child: Text('This is text'),
            ),

            Text(
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant'),

            Container(
              alignment: Alignment.bottomLeft,
              // margin: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(20),

              width: 190,
              height: 200,

              // color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 4,
                    color: Colors.orange,

                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(4, 40),
                      blurRadius: 13,
                    )


                  ]
              ),

              child: Center(
                child: Column(

                  children: [
                    Text('This is text',style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),

                    Text('This is text',style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                    Text('This is text',style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                    Text('This is text',style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),

                  ],
                ),
              ),
            )


          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        print('floating action button pressed');
      },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),

      ),



    );
  }
}
