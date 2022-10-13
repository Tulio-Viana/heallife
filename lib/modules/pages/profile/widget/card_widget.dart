import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/medicamento.dart';

class CardWidget extends StatefulWidget {
  String titulo;
  String subtitle;
  CardWidget(
    this.titulo,
    this.subtitle,
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
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(
            Icons.medication_rounded,
            size: 35,
          ),
          title: Text(
            widget.titulo,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          subtitle: Text(
            widget.subtitle,
            style: TextStyle(fontSize: 15),
          ),
        ));
  }
}
