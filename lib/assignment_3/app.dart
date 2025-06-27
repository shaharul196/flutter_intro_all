import 'package:flutter/material.dart';
import 'api_Crud.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'batch 10',
      home: Crudapi(),
    );
  }
}
