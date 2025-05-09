import 'package:flutter/material.dart';

import 'module_9/aspect_ratio.dart';
import 'module_9/expanded.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'batch 10',
      home: Aspectall(),
    );
  }
}
