import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/Perfis_e_Classes/paciente.dart';
import 'package:idosos/modules/pages/bottomnavigator/pg_principal.dart';
import 'package:idosos/modules/pages/cadastro/cadastroServices.dart';
import 'package:idosos/modules/pages/login/chegagemPage.dart';
import 'package:idosos/modules/pages/login/login_services.dart';
import 'package:mask/mask/mask.dart';
import '../../../Functions/Login.functions.dart';
import '../login/login.dart';
import '../../Perfis_e_Classes/paciente.dart';
import 'package:search_cep/search_cep.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
  final TextEditingController _controllerCepPaciente = TextEditingController();
  final TextEditingController _controllerCidadePaciente =
      TextEditingController();
  final TextEditingController _controllerEstadoPaciente =
      TextEditingController();
  String ErroCep = '';
  bool isloading = false;
  void main() async {
    final viaCepSearchCep = ViaCepSearchCep();
    final infoCepJSON =
        await viaCepSearchCep.searchInfoByCep(cep: _controllerCepPaciente.text);
    print(infoCepJSON);
    infoCepJSON.toString().split(",");
    print(infoCepJSON.toString().split(",")[4].split(":")[1]);
    _controllerCidadePaciente.text =
        infoCepJSON.toString().split(",")[4].split(":")[1];
    _controllerEstadoPaciente.text =
        infoCepJSON.toString().split(",")[5].split(":")[1];
    print(_controllerEstadoPaciente.text);
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                      ],
                      keyboardType: TextInputType.number,
                      controller: _controllerCepPaciente,
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
                      main();
                      if (_fromState.currentState!.validate() &&
                          ErroCep.isEmpty) {
                        if (await criarUsuario(_controllerEmailPaciente.text,
                            _controllerSenhaPaciente.text, context)) {
                          Map<String, String> dados = Map<String, String>();

                          dados["nome"] = _controllerUsuarioPaciente.text;
                          dados["celular"] = _controllerCelularPaciente.text;
                          dados["cpf"] = _controllerCPFPaciente.text;
                          dados["cep"] = _controllerCepPaciente.text;
                          dados["cidade"] = _controllerCidadePaciente.text;
                          dados["estado"] = _controllerEstadoPaciente.text;
                          dados["Idade"] = _controllerIdadePaciente.text;
                          dados["Email"] = _controllerEmailPaciente.text;

                          print('Informacoes: \n$dados');

                          PegarUsuario() async {
                            User? usuario = await _firebaseAuth.currentUser;
                            String id;
                            print('passo 1');
                            if (usuario != null) {
                              print('passo 2');
                              id = usuario.uid;
                              if (id != null) {
                                print('passo 3');
                                SalvarInfosUsers(id, dados, "paciente");
                              }
                            }
                            User? teste = await _firebaseAuth.currentUser;
                            String idi = teste!.uid;
                            print("Id do mano: $idi");

                            final pacienteref =
                                db.collection("paciente").doc(idi);
                            var docsref = pacienteref;
                            print("Infos do mano: $docsref");
                          }

                          login(
                              _controllerEmailPaciente.text,
                              _controllerSenhaPaciente.text,
                              context,
                              isloading);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => checagemPage()));
                          PegarUsuario();
                        }
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
