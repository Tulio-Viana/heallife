import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/bottomnavigator/homepagePACIENTE.dart';
import 'package:idosos/modules/pages/bottomnavigator/homepagePROF.dart';
import 'package:idosos/modules/pages/bottomnavigator/notificacoesPaciente.dart';
import 'package:idosos/modules/pages/bottomnavigator/notificacoesProfissional.dart';
import 'package:idosos/modules/pages/profile/page/pg_perfilPACIENTE.dart';
import 'package:idosos/modules/pages/profile/page/pg_perfilPROF.dart';
import 'package:idosos/modules/pages/bottomnavigator/pg_ranking.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore bd = FirebaseFirestore.instance;

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  bool Cuidador = true;
  late List<Widget> _widgetOptions;

  lertipo() async {
    User? usuario = await _firebaseAuth.currentUser;
    String id = usuario!.uid;
    String tipoUsuario = "";
    final docRef = await bd.collection("profissional").doc(id);
    if (docRef != null) {
      Cuidador = true;
    } else
      Cuidador = false;
    return Cuidador;
  }

  @override
  void initState() {
    lertipo();
    super.initState();
    _widgetOptions = <Widget>[
      Cuidador ? const HomePageProf() : const homepagePaciente(),
      const Ranking(),
      Cuidador
          ? const notificacoesProfissional()
          : const notificacoesPaciente(),
      Cuidador ? const Perfil() : const PerfilPaciente()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    final double altura = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.leaderboard_rounded,
              ),
              label: 'Ranking',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_sharp,
              ),
              label: 'Notificações',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ));
  }
}
