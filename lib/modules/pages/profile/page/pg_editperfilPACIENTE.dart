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

class EditProfilePagePaciente extends StatefulWidget {
  const EditProfilePagePaciente({Key? key}) : super(key: key);

  @override
  State<EditProfilePagePaciente> createState() =>
      _EditProfilePagePacienteState();
}

class _EditProfilePagePacienteState extends State<EditProfilePagePaciente> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
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
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                final image =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imagePath: newImage.path));
              }),
          SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 44,
          ),
          TextFieldWidget(
            label: 'Observações (tratamentos ou necessidades específicas)',
            text: user.about,
            maxLines: 5,
            onChanged: (about) => user = user.copy(about: about),
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
                  UserPreferences.setUser(user);
                  Navigator.of(context).pop();
                },
              ))
        ],
      ),
    );
  }
}
