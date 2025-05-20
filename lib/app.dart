import 'package:flutter/material.dart';
import 'flutter_practise/flutter_practise/counter_app.dart';
import 'flutter_practise/flutter_practise/drawer_tabbar.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'batch 10',
      home:drawrtabn(),
    );
  }
}
