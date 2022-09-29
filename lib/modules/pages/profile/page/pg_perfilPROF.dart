import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/login/login_services.dart';
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
    UserProf user;

    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder<UserProf>(
          future: UserPreferencesProf.getUser(),
          builder: (context, snap) {
            if (snap.data != null) {
              user = snap.data!;
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: user.imagePathProf,
                    onClicked: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProfilePage()));
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  buildNameProf(user),
                  const SizedBox(
                    height: 30,
                  ),
                  buildAbout(user),
                ],
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

Widget buildNameProf(UserProf user) => Column(
      children: [
        Text(
          user.nameProf,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.emailProf,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

Widget buildAbout(UserProf user) => Container(
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
              user.sobreProf,
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
