import 'package:flutter/material.dart';

class tabBarall extends StatefulWidget {
  const tabBarall({super.key});

  @override
  State<tabBarall> createState() => _tabBarallState();
}

class _tabBarallState extends State<tabBarall> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Module 9 extra class'),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,

          bottom: TabBar(
              tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorite',
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: 'Setting',
                ),


              ]
          ),
        ),

        body: TabBarView(
          children: [
            Center(child: Icon(Icons.home,size: 100,)),
            Center(child: Icon(Icons.star,size: 100,)),
            Center(child: Image.asset(
                "asset/facebook-76536_1280.png"),),
          ],
             ),


      ),
    );
  }
}
