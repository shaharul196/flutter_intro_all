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

  void winnerVote() {
    int max = 0;
    String? winner = 'no one';
    // for(int i = 0; i<options.length; i++){
    //   if(max < options[selectedOptions]){
    //     max = options[selectedOptions];
    //     winner = options[i];
    //   }
    // }
    options.forEach((key, value) {
      if (value > max) {
        max = value;
        winner = key;
      }
    });
    // print(max);
    // print(winner);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Winner is $winner with $max votes'),
        duration: Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            // TODO Map chalate gele three dot(...) dite hobe
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
            // TODO entries = key,value akare nibe
            ...options.entries.map((x) {
              return Text('${x.key} : ${x.value}');
            }),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  winnerVote();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                ),
                child: Text('Result'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Polling app'),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 40)),
      ],
    );
  }
}
