import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/assignment_on_firebase/ui/home_screen.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
