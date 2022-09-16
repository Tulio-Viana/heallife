import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/profile/page/pg_editperfilPROF.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/appbar_widget.dart';
import '../model/user.dart';
import '../widget/profile_widget.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
          ),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 30,
          ),
          buildAbout(user),
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

Widget buildAbout(User user) => Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text('Sobre',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 16,
            ),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      ),
    );