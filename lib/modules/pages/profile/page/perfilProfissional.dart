import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idosos/modules/pages/login/login_services.dart';

class PerfilProfissional extends StatefulWidget {
  const PerfilProfissional({Key? key}) : super(key: key);

  @override
  State<PerfilProfissional> createState() => _PerfilProfissionalState();
}

class _PerfilProfissionalState extends State<PerfilProfissional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste logout"),
      ),
      body: ListView(
        children: [
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
                onPressed: () {
                  deslogar(context);
                },
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
    );
  }
}
