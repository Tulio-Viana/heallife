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
import 'package:idosos/modules/pages/profile/widget/card_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:search_cep/search_cep.dart';
import '../model/medicamento.dart';
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
  bool existemed = false;

  @override
  void initState() {
    super.initState();
    existemed = true;
    lerDados();
  }

  lerDados() async {
    User? usuario = await _firebaseAuth.currentUser;
    String id = usuario!.uid;
    final docRef = await db.collection("paciente").doc(id);
    docRef.snapshots().listen(
          (event) => print("current data: ${event.data()}"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.namePaciente = event
              .data()
              .toString()
              .split("namePaciente")[1]
              .split(":")[1]
              .split("}")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.idadePaciente = event
              .data()
              .toString()
              .split("idadePaciente")[1]
              .split(":")[1]
              .split(",")[0],
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

  late Medicamento medicamento =
      Medicamento(NomeMed: 'Dipirona', HorarioMed: '23:13', QuantMeed: '2');

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
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: ExpansionTile(
                                  childrenPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                  title: Text('Medicamentos Cadastrados: '),
                                  children: existemed
                                      ? [
                                          CardWidget('${medicamento.NomeMed}',
                                              'Hor??rio: ${medicamento.HorarioMed} - Quantidade: ${medicamento.QuantMeed}')
                                        ]
                                      : [])),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: ExpansionTile(
                              title: const Text(
                                  'Clique aqui para cadastrar seu medicamento!'),
                              children: [
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
                                        hintText: 'Hor??rio de ingest??o (00:00)',
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
                                        setState(() {
                                          existemed = true;
                                        });
                                        if (_txtNomeMedController
                                                .text.isEmpty ||
                                            _txtQuantidadeMedController
                                                .text.isEmpty ||
                                            _txtTimeController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              content: Text(
                                                'Preencha todos os campos!',
                                                textAlign: TextAlign.center,
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        } else {
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
                                            }
                                          }
                                        }
                                      },
                                      child: const Text('Cadastrar rem??dio')),
                                )
                              ],
                            ),
                          ),
                        ]))),
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
          '${usuarioPaciente.namePaciente} - ${usuarioPaciente.idadePaciente?.trim()} anos',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    'Celular: ${usuarioPaciente.numeroCllPaciente}',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Cidade: ${usuarioPaciente.cidadePaciente} - ${usuarioPaciente.estadoPaciente?.trim()}',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
            const Text('Observa????es',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 16,
            ),
            Text(
              usuarioPaciente.observacoesPaciente ??
                  'Observa????es sobre o tratamento (clique na foto para editar).',
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
