import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/screens/product_details_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/screens/product_list_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/data/models/add_review_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/data/models/category_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/screens/bottom_nav_holder_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/review/presentation/screens/add_review.screen.dart';
import '../features/review/presentation/screens/review_screen.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  late Widget screen;

  if(settings.name == SplashScreen.name){
    screen = SplashScreen();
  }else if(settings.name == SignInScreen.name){
    screen = SignInScreen();
  }else if(settings.name == SignUpScreen.name){
    screen = SignUpScreen();
  }else if(settings.name == VerifyOtpScreen.name){
    final String email = settings.arguments as String;
    screen = VerifyOtpScreen(email: email,);
  }else if(settings.name == BottomNavHolderScreen.name){
    screen = BottomNavHolderScreen();
  }else if(settings.name == ProductListScreen.name){
    final CategoryModel category = settings.arguments as CategoryModel;
    // screen = ProductListScreen(categoryName: category);
    screen = ProductListScreen(category: category,);
  }else if(settings.name == ProductDetailsScreen.name){
    final  String productId = settings.arguments as String;
    screen = ProductDetailsScreen(productId: productId,);
  }else if(settings.name == AddReviewScreen.name){
    screen = AddReviewScreen();
  }else if(settings.name == ReviewScreen.name){
    screen = ReviewScreen();
  }

  return MaterialPageRoute(builder: (ctx) => screen);
}