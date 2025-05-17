import 'package:flutter/material.dart';

class counterin extends StatefulWidget {
  const counterin({super.key});

  @override
  State<counterin> createState() => _counterinState();
}

class _counterinState extends State<counterin> {
  int Counter = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter app'),
        backgroundColor: Colors.purpleAccent,
      ),

      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to Counter App',style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),),
                Text(Counter.toString(),style: TextStyle(
                  fontSize: 70,
                  color: Colors.red,
                ),),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   ElevatedButton(onPressed: (){
                      setState(() {
                        Counter++;
                      });
                      print('Counter: $Counter');

                    },style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.blue,

                     ), child: Text('+',style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),)),
                    SizedBox(width: 15,),

                    ElevatedButton(onPressed: (){
                      setState(() {
                       Counter--;
                      });
                     print('Counter:$Counter');
                    },style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,),
                        child: Text('-',style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),)),
                  ],
                ),
              ],
            ),

        ),

    );
  }
}
