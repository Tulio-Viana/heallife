import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/pages/profile/page/pg_editperfilPACIENTE.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../model/user.dart';
import '../widget/profile_widget.dart';

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
    emailPaciente: "test@test.com",
    observacoesPaciente: 'Suas informações (Clique na foto para editar)',
    numeroCllPaciente: "(37)99999-9999",
    estadoPaciente: "MG",
    cidadePaciente: "Divinópolis",
  );
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
            buildCllCidade(usuarioPaciente),
            buildTratamentos(_txtTimeController, _txtNomeMedController,
                _txtQuantidadeMedController, context),
            buildObservacoes(usuarioPaciente)
          ],
        ));
  }
}

Widget buildNamePaciente(UserPaciente usuarioPaciente) => Column(
      children: [
        Text(
          usuarioPaciente.namePaciente,
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

Widget buildTratamentos(
        TextEditingController _txtTimeController,
        TextEditingController _txtNomeMedController,
        TextEditingController _txtQuantidadeMedController,
        BuildContext context) =>
    Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 24,
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
                  title:
                      const Text('Clique aqui para cadastrar seu medicamento!'),
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
                            hintStyle: TextStyle(color: Colors.black)),
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
                            hintStyle: TextStyle(color: Colors.black)),
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
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                          onPressed: () {
                            _txtNomeMedController.text = "";
                            _txtQuantidadeMedController.text = "";
                            _txtTimeController.text = "";

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(milliseconds: 1500),
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
            ])));

Widget buildCllCidade(UserPaciente usuarioPaciente) => Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 62),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Celular para contato:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )
          ],
        ),
      ),
    );

Widget buildObservacoes(UserPaciente usuarioPaciente) => Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
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
            Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ))),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 2, 40, 2),
                    child: Text(
                      "Sair",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
