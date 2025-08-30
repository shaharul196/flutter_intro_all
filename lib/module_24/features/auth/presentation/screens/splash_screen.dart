import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/extentions/localization_extention.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.localization.hello),
      ),
    );
  }
}
