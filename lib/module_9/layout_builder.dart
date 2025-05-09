import 'package:flutter/material.dart';

class Layoutall extends StatefulWidget {
  const Layoutall({super.key});

  @override
  State<Layoutall> createState() => _LayoutallState();
}

class _LayoutallState extends State<Layoutall> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Layout builder'),
          backgroundColor: Colors.green,
        ),

        body: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.grey,

              child: LayoutBuilder(
                  builder: (context,sazu){
                if(sazu.maxWidth >600){
                 return GridView.count(crossAxisCount: 5);
                  }else{
              return GridView.count(crossAxisCount: 1);
                  }
                  }
              ),
            ),
          ],
        ),

      );

  }
}
