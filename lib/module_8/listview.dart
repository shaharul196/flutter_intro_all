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
      home: Lister(),
    );
  }
}


class Lister extends StatelessWidget{
  const Lister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context,index){

          // return Text('Item $index',
          // style: TextStyle(
          //     fontSize: 20,
          //   color: Colors.red,
          // ),
          // );
          
          return Card(
            child: ListTile(
            leading: Icon(Icons.phone),
            trailing: Icon(Icons.delete),
            title: Text('Shaharul'), 
              subtitle: Text('01734345678 $index'),
            ));
        },


      ),
    );


  }
}
