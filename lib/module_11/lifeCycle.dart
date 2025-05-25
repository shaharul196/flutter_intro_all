import 'package:flutter/material.dart';

import 'lifecyTest.dart';

class Lifecycleall extends StatefulWidget {
  const Lifecycleall({super.key});

  @override
  State<Lifecycleall> createState() => _LifecycleallState();
}

class _LifecycleallState extends State<Lifecycleall> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('From initState');
  }
  
 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Dispose called');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Cycle'),
        backgroundColor: Colors.pink,
      ),
      
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>lifetestall()));
        },style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ), child: Text('Next Page')),
      ),
    );
  }
}
