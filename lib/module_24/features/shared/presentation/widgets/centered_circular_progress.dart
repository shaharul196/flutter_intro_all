import 'package:flutter/material.dart';

class CenteredCircularProgress extends StatelessWidget {
  const CenteredCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
