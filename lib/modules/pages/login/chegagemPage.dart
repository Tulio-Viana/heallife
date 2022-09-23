import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/bottomnavigator/homepagePACIENTE.dart';
import 'package:idosos/modules/pages/bottomnavigator/pg_principal.dart';
import 'package:idosos/modules/pages/login/login.dart';

class checagemPage extends StatefulWidget {
  const checagemPage({Key? key}) : super(key: key);

  @override
  State<checagemPage> createState() => _checagemPageState();
}

class _checagemPageState extends State<checagemPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          print(snap.data == null);

          if (snap.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            if (snap.data == null) {
              return LoginPage();
            } else {
              return PaginaPrincipal();
            }
          }
        });
  }
}
