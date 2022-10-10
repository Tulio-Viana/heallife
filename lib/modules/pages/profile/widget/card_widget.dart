import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/medicamento.dart';

class CardWidget extends StatefulWidget {
  CardWidget();
  //construtor

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late Medicamento medicamento =
      Medicamento(NomeMed: 'Viagra', HorarioMed: '23:13', QuantMeed: '2');
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(medicamento.NomeMed),
        subtitle: Text(
            'Horário: ${medicamento.HorarioMed} - Quantidade: ${medicamento.QuantMeed}'),
      ),
    );
  }
}
