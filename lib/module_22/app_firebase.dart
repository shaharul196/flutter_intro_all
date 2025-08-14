import 'package:flutter/material.dart';

import 'firebase_livescore.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenFirebase(),
    );
  }
}
