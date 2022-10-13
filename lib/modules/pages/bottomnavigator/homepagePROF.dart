import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/profile/widget/cardPaciente.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HomePageProf extends StatefulWidget {
  const HomePageProf({Key? key}) : super(key: key);

  @override
  State<HomePageProf> createState() => _HomePageProfState();
}

class _HomePageProfState extends State<HomePageProf> {
  var _focusedDay = DateTime.now();
  var _selectedDay = DateTime.now();
  var _calendarFormat = CalendarFormat.month;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Pacientes próximos buscando um cuidador:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: CardProfissionalWidget(
                'Túlio', 'Dia: 07/10 de 8:00 as 18:00', ''),
          ),
        ],
      ),
    );
  }
}
