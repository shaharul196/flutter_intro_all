import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'batch 10' ,
      home: Gridviewr(),
    );
  }
}

class Gridviewr extends StatelessWidget {
  const Gridviewr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),

      // body: GridView.count(
      //
      //     crossAxisCount: 2,
      //   padding: EdgeInsets.all(10),
      //   crossAxisSpacing: 20,
      //   mainAxisSpacing: 10,
      //   children: List.generate(10, (index){
      // return Card(
      // elevation: 5,
      // child: ListTile(
      // leading: Icon(Icons.phone,color: Colors.blue,),
      // trailing: Icon(Icons.delete,color: Colors.red,),
      //   title: Text('Shaharul'),
      // subtitle: Text('01734345678 $index'),
      // ));
      // }
      // ),
      // ),

     body: GridView.builder(
         gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount:3,
           crossAxisSpacing: 20,
           mainAxisSpacing: 20,
         ),
       itemCount: 20,
       itemBuilder: (context,index){
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.orange,
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Icon(Icons.phone,color: Colors.white,),
                 const SizedBox(height: 10,),
                 const Text('Send money',style: TextStyle(
                   color: Colors.white,
                 ), ),
               ],
             ),
           ),
         );
       }

     ),
    );
  }
}
