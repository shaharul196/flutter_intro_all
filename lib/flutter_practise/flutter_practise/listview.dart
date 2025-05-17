import 'package:flutter/material.dart';

class listgridall extends StatefulWidget {
  const listgridall({super.key});

  @override
  State<listgridall> createState() => _listgridallState();
}

class _listgridallState extends State<listgridall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview and gridview'),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder:(context,index){
            return Card(
              child: ListTile(
                title: Text('Shaharul'),
                leading: Icon(Icons.phone,),
                trailing: Icon(Icons.delete),
                subtitle: Text('01738389674 $index'),
              ),
            );
          }
          ),



    );
  }
}
