import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/medicamento.dart';

class CardWidget extends StatefulWidget {
  String titulo;
  String subtitle;
  CardWidget(
    this.subtitle,
    this.titulo,
  );
  //construtor

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue.shade50,
        child: ListTile(
          title: Text(widget.titulo),
          subtitle: Text(widget.subtitle),
        ));
  }
}
