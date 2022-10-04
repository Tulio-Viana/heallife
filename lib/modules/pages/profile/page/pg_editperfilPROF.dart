import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idosos/modules/pages/bottomnavigator/homepagePROF.dart';
import 'package:idosos/modules/pages/bottomnavigator/pg_principal.dart';
import 'package:idosos/modules/pages/profile/page/pg_perfilPROF.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import 'package:idosos/modules/pages/profile/widget/profile_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../model/user.dart';
import '../widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
          TextFieldWidget(
              label: 'Celular para contato',
              text: usuarioProfissional.numeroCllProf,
              onChanged: (cll) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: 'CEP',
              text: usuarioProfissional.CepProf,
              onChanged: (cep) {}),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 44,
          ),
          TextFieldWidget(
            label: 'Sobre',
            text: usuarioProfissional.sobreProf,
            maxLines: 5,
            onChanged: (sobre) {},
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
                  Navigator.of(context).pop();
                },
              ))
        ],
      ),
    );
  }
}
