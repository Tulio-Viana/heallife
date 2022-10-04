import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/login/login_services.dart';
import 'package:idosos/modules/pages/profile/page/pg_editperfilPROF.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import '../model/user.dart';
import '../widget/profile_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late UserProf usuarioProfissional = UserProf(
      imagePathProf:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
      nameProf: "Andre",
      emailProf: "test@test.com",
      sobreProf: 'Suas informações (Clique na foto para editar)',
      numeroCllProf: "(37)99999-9999",
      estadoProf: "GO",
      cidadeProf: "Goiânia",
      CepProf: '42567893');
  var userPrefPac = UserPreferencesPaciente();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: usuarioProfissional.imagePathProf,
              onClicked: () async {
                await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
                setState(() {});
              },
            ),
            const SizedBox(
              height: 24,
            ),
            buildNameProf(usuarioProfissional),
            buildCllCidade(usuarioProfissional),
            buildAbout(usuarioProfissional),
          ],
        ));
  }

  Widget buildNameProf(UserProf usuarioProfissional) => Column(
        children: [
          Text(
            usuarioProfissional.nameProf,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            usuarioProfissional.emailProf,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildCllCidade(UserProf usuarioProfissional) => Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                'Celular: ${usuarioProfissional.numeroCllProf}      Cidade: ${usuarioProfissional.cidadeProf} - ${usuarioProfissional.estadoProf}',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );

  Widget buildAbout(UserProf usuarioProfissional) => Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text('Sobre',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 16,
              ),
              Text(
                usuarioProfissional.sobreProf,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
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
                    onPressed: () {},
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
          ),
        ),
      );
}
