import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idosos/modules/pages/bottomnavigator/homepagePROF.dart';
import 'package:idosos/modules/pages/bottomnavigator/pg_principal.dart';
import 'package:idosos/modules/pages/profile/page/pg_perfilPROF.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import 'package:idosos/modules/pages/profile/widget/profile_widget.dart';
import '../model/user.dart';
import '../widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

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
              imagePath: user.imagePath, isEdit: true, onClicked: () async {}),
          SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 44,
          ),
          TextFieldWidget(
            label: 'Sobre',
            text: user.about,
            maxLines: 5,
            onChanged: (about) {},
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => PaginaPrincipal()));
                },
              ))
        ],
      ),
    );
  }
}
