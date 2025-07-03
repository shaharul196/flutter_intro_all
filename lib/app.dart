import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_in_screen.dart';
import 'module_16/ui/screens/change_password.dart';
import 'module_16/ui/screens/forgot_password_email_screen.dart';
import 'module_16/ui/screens/pin_varification_screen.dart';
import 'module_16/ui/screens/sign_up_screen.dart';
import 'module_16/ui/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // colorSchemeSeed: Colors.green,
        // primarySwatch: Colors.green,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),

        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
        ),
      ),

      // home: SplashScreen(),
      initialRoute: '/',

      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/sign-in': (context) => SignInScreen(),
      // },
      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        SignInScreen.name: (context) => SignInScreen(),
        SignUpScreen.name: (context) => SignUpScreen(),
        ForgotPasswordEmailScreen.name: (context) => ForgotPasswordEmailScreen(),
        PinVerificationScreen.name: (context) => PinVerificationScreen(),
        ChangePasswordScreen.name: (context) => ChangePasswordScreen(),


      },
    );
  }
}
