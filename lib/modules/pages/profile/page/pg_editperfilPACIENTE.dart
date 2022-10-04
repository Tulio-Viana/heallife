import 'dart:io';
import 'package:flutter/material.dart';
import 'package:idosos/modules/pages/profile/page/pg_perfilPACIENTE.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/profile_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../model/user.dart';
import '../widget/textfield_widget.dart';

class EditProfilePagePaciente extends StatefulWidget {
  const EditProfilePagePaciente({Key? key}) : super(key: key);

  @override
  State<EditProfilePagePaciente> createState() =>
      _EditProfilePagePacienteState();
}

class _EditProfilePagePacienteState extends State<EditProfilePagePaciente> {
  late UserPaciente usuarioPaciente = UserPaciente(
      imagePathPaciente:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
      namePaciente: "Tulio",
      emailPaciente: "test@test.com",
      observacoesPaciente: 'Suas informações (Clique na foto para editar)',
      numeroCllPaciente: "(37)99999-9999",
      estadoPaciente: "MG",
      cidadePaciente: "Divinópolis",
      CepPaciente: '35500021');
  var userPrefPac = UserPreferencesPaciente();

  @override
  Widget build(BuildContext context) {
    final double largura = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
                imagePath: usuarioPaciente.imagePathPaciente,
                isEdit: true,
                onClicked: () async {
                  final image =
                      await ImagePicker().getImage(source: ImageSource.gallery);

                  if (image == null) return;

                  final directory = await getApplicationDocumentsDirectory();
                  final name = basename(image.path);
                  final imageFile = File('${directory.path}/$name');
                  final newImage = await File(image.path).copy(imageFile.path);
                  // setState(() => usuarioPaciente = usuarioPaciente.copy(imagePathPaciente: newImage.path));
                  // Aqui era onde pegava a imagem
                }),
            const SizedBox(
              height: 24,
            ),
            buildNamePaciente(usuarioPaciente),
            const SizedBox(
              height: 44,
            ),
            TextFieldWidget(
                label: 'Celular para contato',
                text: usuarioPaciente.numeroCllPaciente,
                onChanged: (cll) {}),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
                label: 'CEP',
                text: usuarioPaciente.CepPaciente,
                onChanged: (cep) {}),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
                label: 'Observações',
                text: usuarioPaciente.observacoesPaciente,
                maxLines: 5,
                onChanged: (obs) {}),
            const SizedBox(
              height: 40,
            ),
            Container(
                width: largura / 1.4,
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TextButton(
                  child: const Text(
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
        ));
  }
}
