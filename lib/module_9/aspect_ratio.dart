import 'package:flutter/material.dart';

class Aspectall extends StatefulWidget {
  const Aspectall({super.key});

  @override
  State<Aspectall> createState() => _AspectallState();
}

class _AspectallState extends State<Aspectall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aspect Ratio'),
        backgroundColor: Colors.cyan,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
                aspectRatio:16/9 ,
                child: Container(
                color: Colors.orange,
            ),
            ),
        
            AspectRatio(
              aspectRatio:9/16,
              child: Container(
                color: Colors.red,
              ),
            ),

            AspectRatio(
              aspectRatio:16/10 ,
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
