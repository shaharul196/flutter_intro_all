import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import '../app_1.dart';
import 'firebase_options.dart';
import 'app_firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LiveScoreApp());
}