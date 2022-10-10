import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
              'Selecione os dias disponíveis para atendimento',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              indent: 10,
              endIndent: 10,
              thickness: 2,
              height: 3,
              color: Colors.black,
            ),
          ),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarStyle: const CalendarStyle(outsideDaysVisible: false),
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            availableCalendarFormats: const {
              CalendarFormat.month: "Semana",
              CalendarFormat.week: "Mês",
            },
            locale: 'pt_BR',
          )
        ],
      ),
    );
  }
}
