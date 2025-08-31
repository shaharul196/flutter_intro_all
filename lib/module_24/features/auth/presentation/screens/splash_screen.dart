import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/extensions/localization_extension.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/language_change_switch.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.localization.hello),
            LanguageChangeSwitch(),
          ],
        ),

      ),
    );
  }
}
