import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/medicamento.dart';

class CardProfissionalWidget extends StatefulWidget {
  String titulo;
  String subtitle;
  String imageProf;

  CardProfissionalWidget(
    this.titulo,
    this.subtitle,
    this.imageProf,
  );
  //construtor

  @override
  State<CardProfissionalWidget> createState() => _CardProfissionalWidgetState();
}

class _CardProfissionalWidgetState extends State<CardProfissionalWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue.shade50,
        child: ListTile(
          leading: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png'),
          title: Text(widget.titulo),
          subtitle: Text(widget.subtitle),
        ));
  }
}
