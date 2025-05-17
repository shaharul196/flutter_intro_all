import 'package:flutter/material.dart';

class gridein extends StatefulWidget {
  const gridein({super.key});

  @override
  State<gridein> createState() => _grideinState();
}

class _grideinState extends State<gridein> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview and gridview'),
        backgroundColor: Colors.purpleAccent,
      ),

      // body:GridView.count(
      //   // padding: EdgeInsets.all(10),
      //     crossAxisCount: 2,
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   children: List.generate(30,(index){
      //     return Card(
      //     child: ListTile(
      //     title: Text('Shaharul'),
      //     leading: Icon(Icons.phone,),
      //     trailing: Icon(Icons.delete),
      //     subtitle: Text('01738389674 $index'),
      //     ),
      //     );
      //     }
      // ),
      //     ),

      body: GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,

          ) ,
          itemCount: 20,
          itemBuilder:(context,index){
            return Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone,color: Colors.blue,),
                    SizedBox(height: 10,),
                    Text('Send money',style: TextStyle(
                      color: Colors.black,
                    ),),
                  ],
                  
                ),
              ),
            );
          }
          
    ),
    );
  }
}
