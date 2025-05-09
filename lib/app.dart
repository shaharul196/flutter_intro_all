import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/flutter_practise/stack_icon.dart';

import 'module_8/custom_widget.dart';
import 'module_8/stateful_class.dart';
import 'module_9/aspect_ratio.dart';
import 'module_9/expanded.dart';
import 'module_9/layout_builder.dart';
import 'module_9/mediaquery.dart';
import 'module_9/todo_app project.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'batch 10',
      home: Expandedall(),
    );
  }
}
