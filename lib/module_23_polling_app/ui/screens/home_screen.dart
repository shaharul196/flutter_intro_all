import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedOptions;

  Map<String, dynamic> options = {'flutter': 0, 'java': 0, 'C': 0, 'mern': 0};
  
  void calculateVote() {
    options[selectedOptions!]++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polling app'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 40)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            ...options.keys.map((index) {
              return RadioListTile(
                title: Text(index),
                value: index,
                groupValue: selectedOptions,
                onChanged: (x) {
                  /// x holo jeta select korteci
                  selectedOptions = x;
                  calculateVote();
                  setState(() {});
                },
              );
            }),

            ...options.entries.map((x){
              return Text('${x.key} : ${x.value}');
            }),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,

              ), child: Text('Result')),
            ),


          ],
        ),
      ),
    );
  }
}
