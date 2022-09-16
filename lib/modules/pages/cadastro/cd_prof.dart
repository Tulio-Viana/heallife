import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask/mask/mask.dart';
import '../../../Functions/Login.functions.dart';
import '../login/login.dart';
import 'package:flutter/services.dart';

class Cd_Prof_Page extends StatefulWidget {
  const Cd_Prof_Page({Key? key}) : super(key: key);

  @override
  State<Cd_Prof_Page> createState() => _CdProfPageState();
}

class _CdProfPageState extends State<Cd_Prof_Page> {
  GlobalKey<FormState> _fromState = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerUsuario = TextEditingController();
  TextEditingController _controllerCelular = TextEditingController();
  TextEditingController _controllerCPF = TextEditingController();
  TextEditingController _controllerCOREN = TextEditingController();

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
                      controller: _controllerUsuario,
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
                      validator: (value) => Mask.validations.cpf(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                        Mask.cpf()
                      ],
                      controller: _controllerCPF,
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
                      validator: (value) =>
                          LoginFunctions().validarCOREN(value!),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      controller: _controllerCOREN,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(),
                        hintText: "Número COREN",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.local_hospital),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) => Mask.validations.phone(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      controller: _controllerCelular,
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
                      controller: _controllerEmail,
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(12),
                      ],
                      controller: _controllerSenha,
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
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
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
                    onPressed: () {
                      if (_fromState.currentState!.validate()) {
                        print(_controllerUsuario.text.trim());
                        print(_controllerEmail.text.trim());
                        print(_controllerSenha.text.trim());
                        print(_controllerCelular.text.trim());
                        print(_controllerCPF.text.trim());
                        print(_controllerCOREN.text.trim());
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
                ),
                SizedBox(
                  height: 17,
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
