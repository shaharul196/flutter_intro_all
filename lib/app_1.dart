import 'package:flutter/material.dart';
import 'module_19_getx/getx_with-counter_app/controller_binder.dart';
import 'module_19_getx/getx_with-counter_app/home_screen.dart';
import 'package:get/get.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title:'Counter app with getx',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialBinding: ControllerBinder(),

    );
  }
}
