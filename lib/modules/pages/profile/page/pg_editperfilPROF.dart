import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/pages/bottomnavigator/homepagePROF.dart';
import 'package:idosos/modules/pages/bottomnavigator/pg_principal.dart';
import 'package:idosos/modules/pages/profile/page/pg_perfilPROF.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import 'package:idosos/modules/pages/profile/widget/profile_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask/mask/mask.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:search_cep/search_cep.dart';
import '../model/user.dart';
import '../widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController _controllerCepProfissionalPerfil =
      TextEditingController();
  TextEditingController _controllerCidadeProfissionalPerfil =
      TextEditingController();
  TextEditingController _controllerEstadoProfissionalPerfil =
      TextEditingController();
  String ErroCep = '';
  bool isloading = false;

  main() async {
    try {
      setState(() {
        isloading = true;
      });
      final viaCepSearchCep = ViaCepSearchCep();
      final infoCepJSON = await viaCepSearchCep.searchInfoByCep(
          cep: _controllerCepProfissionalPerfil.text);
      print(infoCepJSON);
      if (infoCepJSON.toString().contains("error")) {
        throw Exception("CEP inexistente");
      } else {
        infoCepJSON.toString().split(",");
        print(infoCepJSON.toString().split(",")[4].split(":")[1]);
        _controllerCidadeProfissionalPerfil.text =
            infoCepJSON.toString().split(",")[4].split(":")[1];
        _controllerEstadoProfissionalPerfil.text =
            infoCepJSON.toString().split(",")[5].split(":")[1];

        print(_controllerEstadoProfissionalPerfil.text);
      }
      setState(() {
        isloading = false;
      });
    } on Exception catch (erro) {
      print(erro.toString());
      ErroCep = erro.toString().replaceAll("Exception: ", "");
      setState(() {});
    }
    ;
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
              imagePath: usuarioProfissional.imagePathProf,
              isEdit: true,
              onClicked: () async {
                final image =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);
                // setState(() => usuarioProfissional = usuarioProfissional.copy(imagePathProf: newImage.path));
                // Aqui era onde pegava a imagem
              }),
          SizedBox(
            height: 24,
          ),
          buildNameProf(usuarioProfissional),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Celular para contato',
            text: usuarioProfissional.numeroCllProf,
            controller: controller,
            validator: (value) => Mask.validations.phone(value),
            Inputformatter: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                onChanged: (val) async {
                  ErroCep = "";
                  setState(() {});
                  if (val.length >= 8) {
                    await main();
                  }
                },
                label: 'CEP',
                text: usuarioProfissional.CepProf,
                controller: controller1,
                Inputformatter: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(8),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              ErroCep.isNotEmpty
                  ? Text(
                      ErroCep,
                      style: TextStyle(color: Colors.red),
                    )
                  : Container()
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Sobre',
            text: usuarioProfissional.sobreProf,
            maxLines: 5,
            controller: controller2,
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              width: largura / 1.4,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextButton(
                child: Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (ErroCep.isEmpty) {
                    Navigator.of(context).pop();
                  }
                },
              ))
        ],
      ),
    );
  }
}
