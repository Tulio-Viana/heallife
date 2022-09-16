import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homepagePaciente extends StatefulWidget {
  const homepagePaciente({Key? key}) : super(key: key);

  @override
  State<homepagePaciente> createState() => _homepagePacienteState();
}

class _homepagePacienteState extends State<homepagePaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('Paciente')],
      ),
    );
  }
}
