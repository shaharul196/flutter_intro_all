import 'package:flutter/material.dart';

class StatefulClass extends StatefulWidget {
  const StatefulClass({super.key});

  @override
  State<StatefulClass> createState() => _StatefulClassState();
}

class _StatefulClassState extends State<StatefulClass> {
  int counter = 0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Class'),
         backgroundColor: Colors.deepPurple,
         centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString(),
            style: TextStyle(
              fontSize: 70,
              color: Colors.purple,
            ),
            ),
            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      counter++;
                    });

                    print('Counter: $counter');
                  }, child: Text('+',style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                  ),)),
                ),
                SizedBox(width: 20,),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      counter--;
                    });

                    print('Counter: $counter');
                  }, child: Text('-',style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                  ),)),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
