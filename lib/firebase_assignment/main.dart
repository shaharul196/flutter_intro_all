import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ostad_flutter_sazu/firebase_assignment/app.dart';
import 'package:ostad_flutter_sazu/firebase_assignment/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LiveScoreApp());
}

