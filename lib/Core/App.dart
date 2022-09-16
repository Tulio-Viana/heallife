import 'package:flutter/material.dart';

import '../modules/pages/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealLife',
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
        backgroundColor: Colors.white,
      ),
      home: const LoginPage(),
    );
  }
}
