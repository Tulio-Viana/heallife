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
  late UserPaciente user;
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
      body: FutureBuilder<UserPaciente>(
          future: userPrefPac.getUser(),
          builder: (context, snap) {
            if (snap.data != null) {
              user = snap.data!;
            }

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                    imagePath: user.imagePathPaciente,
                    isEdit: true,
                    onClicked: () async {
                      final image = await ImagePicker()
                          .getImage(source: ImageSource.gallery);

                      if (image == null) return;

                      final directory =
                          await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${directory.path}/$name');
                      final newImage =
                          await File(image.path).copy(imageFile.path);
                    }),
                const SizedBox(
                  height: 24,
                ),
                buildNamePaciente(user),
                const SizedBox(
                  height: 44,
                ),
                TextFieldWidget(
                    label:
                        'Observações (tratamentos ou necessidades específicas)',
                    text: user.observacoesPaciente,
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
            );
          }),
    );
  }
}
