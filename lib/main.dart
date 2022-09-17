import 'package:flutter/material.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'Core/App.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserPreferences.init();
  runApp(const MyApp());
}
