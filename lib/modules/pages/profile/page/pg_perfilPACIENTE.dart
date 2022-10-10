import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/pages/login/login_services.dart';
import 'package:idosos/modules/pages/profile/model/medicamento.dart';
import 'package:idosos/modules/pages/profile/page/pg_editperfilPACIENTE.dart';
import 'package:idosos/modules/pages/profile/page/userServices.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import 'package:idosos/modules/pages/profile/widget/card_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:search_cep/search_cep.dart';
import '../model/user.dart';
import '../widget/profile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PerfilPaciente extends StatefulWidget {
  const PerfilPaciente({Key? key}) : super(key: key);

  @override
  State<PerfilPaciente> createState() => _PerfilPacienteState();
}

class _PerfilPacienteState extends State<PerfilPaciente> {
  late UserPaciente usuarioPaciente = UserPaciente(
      imagePathPaciente:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
      namePaciente: "Tulio",
      idadePaciente: '',
      emailPaciente: "",
      observacoesPaciente:
          'Observações específicas sobre o tratamento (Clique na foto para editar)',
      numeroCllPaciente: "",
      estadoPaciente: "",
      cidadePaciente: "",
      CepPaciente: '');

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
                imagePath: usuarioPaciente.imagePathPaciente,
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
                                      onPressed: () {
                                        _txtNomeMedController.text = "";
                                        _txtQuantidadeMedController.text = "";
                                        _txtTimeController.text = "";

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            duration:
                                                Duration(milliseconds: 1500),
                                            content: Text(
                                              'Remédio cadastrado com sucesso!',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        );
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
          usuarioPaciente.emailPaciente,
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
              usuarioPaciente.observacoesPaciente,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
