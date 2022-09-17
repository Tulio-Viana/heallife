import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/Perfis_e_Classes/paciente.dart';
import 'package:idosos/modules/pages/login/login_services.dart';
import 'package:mask/mask/mask.dart';
import '../../../Functions/Login.functions.dart';
import '../login/login.dart';
import '../../Perfis_e_Classes/paciente.dart';

class Cd_Resp_Page extends StatefulWidget {
  const Cd_Resp_Page({Key? key}) : super(key: key);

  @override
  State<Cd_Resp_Page> createState() => _CdRespPageState();
}

class _CdRespPageState extends State<Cd_Resp_Page> {
  var bd = FirebaseFirestore.instance;
  GlobalKey<FormState> _fromState = GlobalKey<FormState>();
  final TextEditingController _controllerUsuarioPaciente =
      TextEditingController();
  final TextEditingController _controllerIdadePaciente =
      TextEditingController();
  final TextEditingController _controllerCPFPaciente = TextEditingController();
  final TextEditingController _controllerCelularPaciente =
      TextEditingController();
  final TextEditingController _controllerEmailPaciente =
      TextEditingController();
  final TextEditingController _controllerSenhaPaciente =
      TextEditingController();

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
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              child: Form(
                key: _fromState,
                child: Column(
                  children: [
                    TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(75)],
                      keyboardType: TextInputType.name,
                      controller: _controllerUsuarioPaciente,
                      validator: (value) =>
                          LoginFunctions().validarUsuario(value!),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(),
                        hintText: "Nome e Sobrenome",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          LoginFunctions().validarIdade(value!),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      controller: _controllerIdadePaciente,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(),
                          hintText: "Idade",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          prefixIcon: Icon(Icons.calendar_month_sharp)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) => Mask.validations.cpf(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                        Mask.cpf()
                      ],
                      controller: _controllerCPFPaciente,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(),
                        hintText: "CPF",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.numbers),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) => Mask.validations.phone(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      controller: _controllerCelularPaciente,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(),
                        hintText: "Celular para contato",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(75),
                      ],
                      keyboardType: TextInputType.emailAddress,
                      controller: _controllerEmailPaciente,
                      validator: (value) =>
                          LoginFunctions().validarEmail(value!),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(fontSize: 15),
                        hintText: "exemplo@email.com",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      controller: _controllerSenhaPaciente,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(12),
                      ],
                      validator: (value) =>
                          LoginFunctions().validarSenha(value!),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(),
                        hintText: "Senha",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.key),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
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
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_fromState.currentState!.validate()) {
                        print(_controllerUsuarioPaciente.text.trim());
                        print(_controllerEmailPaciente.text.trim());
                        print(_controllerSenhaPaciente.text.trim());
                        print(_controllerCelularPaciente.text.trim());
                        print(_controllerCPFPaciente.text.trim());
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 27,
                  child: Text(
                    "Já possui conta?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
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
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
