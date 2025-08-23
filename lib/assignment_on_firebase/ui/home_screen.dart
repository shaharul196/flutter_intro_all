import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/assignment_on_firebase/ui/team1_screen.dart';
import 'package:ostad_flutter_sazu/assignment_on_firebase/ui/team2_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match List'),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Argentina vs Africa',style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                Spacer(),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ArgentinaVSAfrica()));

                }, icon: Icon(Icons.arrow_forward_outlined,size: 27,))
              ]
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Italy vs Spain',style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                Spacer(),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItalyVSSpain();
                  }));
                }, icon: Icon(Icons.arrow_forward_outlined,size: 27,)),
              ],
            ),
          )
        ],
      ),
    );
  }

//   void team1Page(){
//     Navigator.push(context, MaterialPageRoute(builder: (context) => ArgentinaVSAfrica()));
//   }
}
