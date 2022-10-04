import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class notificacoesProfissional extends StatefulWidget {
  const notificacoesProfissional({Key? key}) : super(key: key);

  @override
  State<notificacoesProfissional> createState() =>
      _notificacoesProfissionalState();
}

class _notificacoesProfissionalState extends State<notificacoesProfissional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Image.asset(
              'assets/images/titlehead.png',
              width: 70,
              height: 70,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Center(child: Text('Notificações Profissional'))],
        )));
  }
}
