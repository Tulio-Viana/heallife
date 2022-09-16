import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/profile/page/pg_editperfilPROF.dart';
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

final MaskTextInputFormatter timeMaskFormatter =
    MaskTextInputFormatter(mask: '!#:*#', filter: {
  "#": RegExp(r'[0-9]'),
  "!": RegExp(r'[0-2]'),
  "*": RegExp(r'[0-5]'),
});

class _PerfilPacienteState extends State<PerfilPaciente> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    TextEditingController _txtTimeController = TextEditingController();
    TextEditingController _txtNomeMedController = TextEditingController();
    TextEditingController _txtQuantidadeMedController = TextEditingController();

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () {}, //para editar a imagem vai ser aqui
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 30,
          ),
          buildTratamentos(user, _txtTimeController, _txtNomeMedController,
              _txtQuantidadeMedController, context),
        ],
      ),
    );
  }
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

Widget buildTratamentos(
        User user,
        TextEditingController _txtTimeController,
        TextEditingController _txtNomeMedController,
        TextEditingController _txtQuantidadeMedController,
        BuildContext context) =>
    Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ExpansionTile(
                      title: Text('Medicamentos Cadastrados:'),
                      children: [
                        Divider(
                          indent: 2,
                          endIndent: 2,
                          height: 5,
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ])),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ExpansionTile(
                  title: Text('Clique aqui para cadastrar seu medicamento!'),
                  children: [
                    Divider(
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
                        decoration: InputDecoration(
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
                          timeMaskFormatter
                        ],
                        decoration: InputDecoration(
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
                        decoration: InputDecoration(
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
                              SnackBar(
                                duration: Duration(milliseconds: 1500),
                                content: const Text(
                                  'Remédio cadastrado com sucesso!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                          child: Text('Cadastrar remédio')),
                    )
                  ],
                ),
              ),
            ])));
