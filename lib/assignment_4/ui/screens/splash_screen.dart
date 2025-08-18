import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/auth_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/screens/main_navigation_bar_screen.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/widget/screen_background.dart';
import '../utils/asset_paths.dart';
import 'package:get/get.dart';

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
    await Future.delayed(Duration(seconds: 2));
    bool isloggedIn = await AuthController.isUserloggedIn();
    if (isloggedIn) {
      Get.offNamed(MainNavigationBarScreen.name);
    } else {
      Get.offNamed(SignInScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(child: SvgPicture.asset(AssetPaths.logoSvg)),
      ),
    );
  }
}
