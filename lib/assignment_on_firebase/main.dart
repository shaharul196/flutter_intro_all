import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ostad_flutter_sazu/assignment_on_firebase/app.dart';
import 'package:ostad_flutter_sazu/module_22/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LiveScoreApp());
}