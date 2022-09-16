import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/cadastro/cd_prof.dart';
import 'package:idosos/modules/pages/login/login.dart';
import 'cd_paciente.dart';

class Select_Cd_Page extends StatefulWidget {
  const Select_Cd_Page({Key? key}) : super(key: key);

  @override
  State<Select_Cd_Page> createState() => _SelectCdPageState();
}

class _SelectCdPageState extends State<Select_Cd_Page> {
  GlobalKey<FormState> _fromState = GlobalKey<FormState>();
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    final double altura = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/titlehead.png',
                height: 70,
                width: 70,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    margin: EdgeInsets.all(20),
                    child: Form(
                      key: _fromState,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 30),
                            child: Text(
                              'Deseja se cadastrar como:',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 27,
                            child: Text(
                              "Para não profissionais:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            width: largura / 1.4,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 52, 95, 212),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                )),
                            child: TextButton(
                              child: Text(
                                'Paciente',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Cd_Resp_Page()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 27,
                            child: Text(
                              "Para cuidadores:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            width: largura / 1.4,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 52, 95, 212),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: TextButton(
                              child: Text(
                                'Profissional',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Cd_Prof_Page()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          SizedBox(
                            height: 27,
                            child: Text(
                              "Já possui conta?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                              width: largura / 1.4,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 182, 228, 236),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: TextButton(
                                child: Text(
                                  'Voltar',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                              ))
                        ],
                      ),
                    ))),
          )),
    );
  }
}
