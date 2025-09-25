import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/controllers/authentication_controller.dart';
import 'package:ostad_flutter_sazu/module_24/app/utils/app_version_service.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/screens/bottom_nav_holder_screen.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    bool isUserLoggedIn = await Get.find<AuthenticationController>().isUserAlreadyLoggedIn();
    if(isUserLoggedIn){
      await Get.find<AuthenticationController>().loadUserData();
    }
    Navigator.pushReplacementNamed(context, BottomNavHolderScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height:12),
              // TODO'${context localization.version}'
              Text('Version ${AppVersionService.currentVersion}'),
            ],
          ),
        ),

      ),
    );
  }
}

