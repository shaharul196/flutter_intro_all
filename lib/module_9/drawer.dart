import 'package:flutter/material.dart';

class Drawerall extends StatefulWidget {
  const Drawerall({super.key});

  @override
  State<Drawerall> createState() => _DrawerallState();
}

class _DrawerallState extends State<Drawerall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 9 extra class'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius:40,
                      backgroundImage: AssetImage(
                        'asset/facebook-76536_1280.png',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Shaharul Islam Sazu',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                
                    Text('rana@gmail.com', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),

            ListTile(
                title: Text('Home'), onTap: () {}),

            Divider(
              thickness: 3,
              color: Colors.red.shade200,
            ),
            ListTile(title: Text('Singup'), onTap: () {}),

            Divider(
              thickness: 3,
              color: Colors.red.shade600,
            ),
            ListTile(title: Text('Login'), onTap: () {}),

            Divider(
              thickness: 3,
              color: Colors.red.shade200,
            ),

            ListTile(title: Text('Logout'), onTap: () {}),

            Divider(
              thickness: 3,
              color: Colors.red.shade200,
            ),

            ListTile(title: Text('profile'), onTap: () {}),

            Divider(
              thickness: 3,
              color: Colors.red.shade200,
            ),




          ],
        ),
      ),
    );
  }
}
