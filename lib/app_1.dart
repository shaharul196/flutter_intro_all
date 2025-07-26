import 'package:flutter/material.dart';
import 'module_19_getx/getx_with-counter_app/home_screen.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Conter app with getx',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}
