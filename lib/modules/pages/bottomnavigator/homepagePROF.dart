import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageProf extends StatefulWidget {
  const HomePageProf({Key? key}) : super(key: key);

  @override
  State<HomePageProf> createState() => _HomePageProfState();
}

class _HomePageProfState extends State<HomePageProf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('Cuidador')],
      ),
    );
  }
}
