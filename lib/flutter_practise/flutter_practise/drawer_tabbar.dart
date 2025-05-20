import 'package:flutter/material.dart';

class drawrtabn extends StatefulWidget {
  const drawrtabn({super.key});

  @override
  State<drawrtabn> createState() => _drawrtabnState();
}

class _drawrtabnState extends State<drawrtabn> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Drawer TabBar app'),
          backgroundColor: Colors.orange,
          centerTitle: true,

          bottom: TabBar(
              tabs: [
               Tab(
                 icon: Icon(Icons.home),
                 child: Text('Home'),
               ),
                Tab(
                  icon: Icon(Icons.star),
                  child: Text('Fevorite'),
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  child: Text('Setting'),
                )
              ]
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     CircleAvatar(
                       maxRadius:70,
                       backgroundImage: AssetImage('asset/man profile.jpeg',),
                     ),
                     Text('Md.Shaharul Islam'),
                     Text('sazurana6@gmail.com'),
                   ],
                 ),
               ),
              ),


              ListTile(
                title: Text('Home'),
              ),
              Divider(
                thickness: 3,
                color: Colors.red.shade200,
              ),
              ListTile(
                title: Text('Signin'),
              ),
              Divider(
                thickness: 3,
                color: Colors.red.shade200,
              ),
              ListTile(
                title: Text('Signup'),
              ),
              Divider(
                thickness: 3,
                color: Colors.red.shade200,
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // Center(child: Text('This is home Bar')),
            Center(child: Icon(Icons.home,size: 80,)),
            Icon(Icons.star,size: 80,),
            Image.asset('asset/images (5).jpeg'),
          ],
        ),
      ),
    );
  }
}
