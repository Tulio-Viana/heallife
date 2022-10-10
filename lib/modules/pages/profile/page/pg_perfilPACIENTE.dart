import 'dart:html';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/pages/cadastro/cadastroServices.dart';
import 'package:idosos/modules/pages/login/login_services.dart';
import 'package:idosos/modules/pages/profile/page/pg_editperfilPACIENTE.dart';
import 'package:idosos/modules/pages/profile/page/userServices.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:search_cep/search_cep.dart';
import '../model/user.dart';
import '../widget/profile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

class PerfilPaciente extends StatefulWidget {
  const PerfilPaciente({Key? key}) : super(key: key);

  @override
  State<PerfilPaciente> createState() => _PerfilPacienteState();
}

class _PerfilPacienteState extends State<PerfilPaciente> {
  Map<String, dynamic> infos = {};
  late UserPaciente usuarioPaciente = UserPaciente();
  // imagePathPaciente:
  //     'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',

  @override
  void initState() {
    super.initState();
    lerDados();
  }

  lerDados() async {
    User? usuario = await _firebaseAuth.currentUser;
    String id = usuario!.uid;
    final docRef = await db.collection("paciente").doc(id);
    docRef.snapshots().listen(
          (event) => usuarioPaciente.namePaciente = event
              .data()
              .toString()
              .split("namePaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.idadePaciente =
              event.data().toString().split("idadePaciente")[1].split(":")[1],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.emailPaciente = event
              .data()
              .toString()
              .split("emailPaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.numeroCllPaciente = event
              .data()
              .toString()
              .split("numeroCllPaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.estadoPaciente = event
              .data()
              .toString()
              .split("estadoPaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.cidadePaciente = event
              .data()
              .toString()
              .split("cidadePaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.CepPaciente = event
              .data()
              .toString()
              .split("CepPaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    setState(() {
      usuarioPaciente;
    });
  }

  var userPrefPac = UserPreferencesPaciente();
  final TextEditingController _txtNomeMedController = TextEditingController();
  final TextEditingController _txtTimeController = TextEditingController();
  final TextEditingController _txtQuantidadeMedController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
                imagePath: usuarioPaciente.imagePathPaciente ??
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
                onClicked: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfilePagePaciente()));
                  setState(() {});
                } //para editar a imagem vai ser aqui
                ),
            const SizedBox(
              height: 24,
            ),
            buildNamePaciente(usuarioPaciente),
            buildCidade(usuarioPaciente),
            Container(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: ExpansionTile(
                                  title: Text('Medicamentos Cadastrados: '),
                                  children: [
                                    Divider(
                                      indent: 2,
                                      endIndent: 2,
                                      height: 5,
                                      thickness: 2,
                                      color: Colors.black,
                                    ),
                                  ])),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ExpansionTile(
                              title: const Text(
                                  'Clique aqui para cadastrar seu medicamento!'),
                              children: [
                                const Divider(
                                  indent: 2,
                                  endIndent: 2,
                                  height: 5,
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    controller: _txtNomeMedController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Nome do medicamento',
                                        hintStyle:
                                            TextStyle(color: Colors.black)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    controller: _txtTimeController,
                                    keyboardType: TextInputType.datetime,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      HoraInputFormatter()
                                    ],
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Horário de ingestão (00:00)',
                                        hintStyle:
                                            TextStyle(color: Colors.black)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _txtQuantidadeMedController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Quantidade ingerida',
                                        hintStyle:
                                            TextStyle(color: Colors.black)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        Map<String, String> remedios =
                                            Map<String, String>();
                                        remedios["NomeRemedio"] =
                                            _txtNomeMedController.text;
                                        remedios["QuantidadeRemedio"] =
                                            _txtQuantidadeMedController.text;
                                        remedios["HorarioRemedio"] =
                                            _txtTimeController.text;

                                        User? usuario =
                                            await _firebaseAuth.currentUser;
                                        String id;

                                        if (usuario != null) {
                                          id = usuario.uid;
                                          if (id != null) {
                                            cadastrarRemedios(id, remedios,
                                                "remedios", context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                content: Text(
                                                  'Remédio cadastrado com sucesso!',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: const Text('Cadastrar remédio')),
                                )
                              ],
                            ),
                          ),
                        ]))),
            buildCidade(usuarioPaciente),
            buildObservacoes(usuarioPaciente),
            Align(
              child: Padding(
                padding: EdgeInsets.only(top: 150),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ))),
                  onPressed: () {
                    deslogar(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 2, 40, 2),
                    child: Text(
                      "Sair",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

Widget buildNamePaciente(UserPaciente usuarioPaciente) => Column(
      children: [
        Text(
          '${usuarioPaciente.namePaciente} - ${usuarioPaciente.idadePaciente} anos',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          usuarioPaciente.emailPaciente ?? '',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );

Widget buildCidade(UserPaciente usuarioPaciente) => Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            AutoSizeText(
              'Celular: ${usuarioPaciente.numeroCllPaciente}      Cidade: ${usuarioPaciente.cidadePaciente} - ${usuarioPaciente.estadoPaciente}',
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );

Widget buildObservacoes(UserPaciente usuarioPaciente) => Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text('Observações',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 16,
            ),
            Text(
              usuarioPaciente.observacoesPaciente ?? '',
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
