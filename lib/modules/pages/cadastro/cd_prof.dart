import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/pages/cadastro/cadastroServices.dart';
import 'package:mask/mask/mask.dart';
import '../../../Functions/Login.functions.dart';
import '../login/login.dart';
import 'package:flutter/services.dart';
import 'package:search_cep/search_cep.dart';

class Cd_Prof_Page extends StatefulWidget {
  const Cd_Prof_Page({Key? key}) : super(key: key);

  @override
  State<Cd_Prof_Page> createState() => _CdProfPageState();
}

class _CdProfPageState extends State<Cd_Prof_Page> {
  GlobalKey<FormState> _fromState = GlobalKey<FormState>();
  final TextEditingController _controllerEmailProfissional =
      TextEditingController();
  final TextEditingController _controllerSenhaProfissional =
      TextEditingController();
  final TextEditingController _controllerUsuarioProfissional =
      TextEditingController();
  final TextEditingController _controllerCelularProfissional =
      TextEditingController();
  final TextEditingController _controllerCPFProfissional =
      TextEditingController();
  final TextEditingController _controllerCORENProfissional =
      TextEditingController();
  final TextEditingController _controllerCepProfissional =
      TextEditingController();
  final TextEditingController _controllerCidadeProfissional =
      TextEditingController();
  final TextEditingController _controllerEstadoProfissional =
      TextEditingController();

  void main() async {
    final viaCepSearchCep = ViaCepSearchCep();
    final infoCepJSON = await viaCepSearchCep.searchInfoByCep(
        cep: _controllerCepProfissional.text);
    print(infoCepJSON);
    infoCepJSON.toString().split(",");
    print(infoCepJSON.toString().split(",")[4].split(":")[1]);
    _controllerCidadeProfissional.text =
        infoCepJSON.toString().split(",")[4].split(":")[1];
    _controllerEstadoProfissional.text =
        infoCepJSON.toString().split(",")[5].split(":")[1];
    print(_controllerEstadoProfissional.text);
  }

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
                      controller: _controllerUsuarioProfissional,
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
                      ],
                      controller: _controllerCPFProfissional,
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
                      controller: _controllerCORENProfissional,
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
                      onChanged: (value) => main(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                      ],
                      keyboardType: TextInputType.number,
                      controller: _controllerCepProfissional,
                      validator: (value) => LoginFunctions().validarCEP(value!),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(),
                        hintText: "CEP",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.location_on),
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
                      controller: _controllerCelularProfissional,
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
                      controller: _controllerEmailProfissional,
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
                      controller: _controllerSenhaProfissional,
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
                        criarUsuario(_controllerEmailProfissional.text,
                            _controllerSenhaProfissional.text);
                        print(_controllerUsuarioProfissional.text.trim());
                        print(_controllerEmailProfissional.text.trim());
                        print(_controllerSenhaProfissional.text.trim());
                        print(_controllerCelularProfissional.text.trim());
                        print(_controllerCPFProfissional.text.trim());
                        print(_controllerCORENProfissional.text.trim());
                        print(_controllerCepProfissional.text.trim());
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
