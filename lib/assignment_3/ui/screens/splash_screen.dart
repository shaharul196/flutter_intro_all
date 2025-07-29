import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_flutter_sazu/assignment_3/ui/controllers/auth_controller.dart';
import 'package:ostad_flutter_sazu/assignment_3/ui/screens/main_navigation_bar_screen.dart';
import 'package:ostad_flutter_sazu/assignment_3/ui/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/assignment_3/ui/widget/screen_background.dart';
import '../utils/asset_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    bool isloggedIn = await AuthController.isUserloggedIn();
    if (isloggedIn) {
      Navigator.pushReplacementNamed(context, MainNavigationBarScreen.name);
    } else {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
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
