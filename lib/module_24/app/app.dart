import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ostad_flutter_sazu/module_24/app/controllers/language_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/verify_otp_screen.dart';
import '../../l10n/app_localizations.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'app_theme.dart';


class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  static final LanguageController languageController = LanguageController();

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  //TODO routeObserver analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CraftyBay.languageController,
      builder: (languageController) {
        return MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: languageController.supportedLocales,
          locale: languageController.currentLocale,
          navigatorObservers: [observer],

          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode: ThemeMode.light,

          home: SplashScreen(),
          initialRoute: SplashScreen.name,

          onGenerateRoute: (setting){
            late Widget screen;

            if(setting.name == SplashScreen.name){
              screen = SplashScreen();
            }else if(setting.name == SignInScreen.name){
              screen = SignInScreen();
            }else if(setting.name == SignUpScreen.name){
              screen = SignUpScreen();
            }else if(setting.name == VerifyOtpScreen.name){
              screen = VerifyOtpScreen();
            }


            return MaterialPageRoute(builder: (ctx) => screen);
          },
        );
      }
    );
  }
}


