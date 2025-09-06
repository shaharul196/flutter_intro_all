import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/screens/bottom_nav_holder_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  late Widget screen;

  if(settings.name == SplashScreen.name){
    screen = SplashScreen();
  }else if(settings.name == SignInScreen.name){
    screen = SignInScreen();
  }else if(settings.name == SignUpScreen.name){
    screen = SignUpScreen();
  }else if(settings.name == VerifyOtpScreen.name){
    screen = VerifyOtpScreen();
  }else if(settings.name == BottomNavHolderScreen.name){
    screen = BottomNavHolderScreen();
  }

  return MaterialPageRoute(builder: (ctx) => screen);
}