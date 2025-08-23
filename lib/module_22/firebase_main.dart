import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ostad_flutter_sazu/module_22/fcm_service.dart';
import '../app_1.dart';
import '../assignment_on_firebase/ui/home_screen.dart';
import 'firebase_options.dart';
import 'app_firebase.dart';

Future<void> main() async {
  final FCMService fcmService = FCMService();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FCMService().initialize();
  // print(await FCMService().getFcmToken());

  await fcmService.initialize();
  print(await fcmService.getFcmToken());
  await fcmService.onTokenRefresh();
  runApp(HomeScreen());
}