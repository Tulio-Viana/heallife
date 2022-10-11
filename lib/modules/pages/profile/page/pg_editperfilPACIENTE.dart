import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idosos/modules/pages/profile/page/pg_perfilPACIENTE.dart';
import 'package:idosos/modules/pages/profile/utils/user_preferences.dart';
import 'package:idosos/modules/pages/profile/widget/profile_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask/mask/mask.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:search_cep/search_cep.dart';
import '../../../../Functions/Login.functions.dart';
import '../model/user.dart';
import '../widget/textfield_widget.dart';
import 'userServices.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

class EditProfilePagePaciente extends StatefulWidget {
  const EditProfilePagePaciente({Key? key}) : super(key: key);

  @override
  State<EditProfilePagePaciente> createState() =>
      _EditProfilePagePacienteState();
}

class _EditProfilePagePacienteState extends State<EditProfilePagePaciente> {
  Map<String, dynamic> infos = {};
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController _controllerCepPacientePerfil = TextEditingController();
  TextEditingController _controllerCidadePacientePerfil =
      TextEditingController();
  TextEditingController _controllerEstadoPacientePerfil =
      TextEditingController();
  late UserPaciente usuarioPaciente = UserPaciente.fromMap(infos);
  initState() {
    super.initState();
    lerDados();
  }

  lerDados() async {
    User? usuario = await _firebaseAuth.currentUser;
    String id = usuario!.uid;
    final docRef = await db.collection("paciente").doc(id);
    docRef.snapshots().listen(
          (event) => usuarioPaciente.namePaciente = event
              .data()
              .toString()
              .split("namePaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.idadePaciente = event
              .data()
              .toString()
              .split("idadePaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.emailPaciente = event
              .data()
              .toString()
              .split("emailPaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.numeroCllPaciente = event
              .data()
              .toString()
              .split("numeroCllPaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.estadoPaciente = event
              .data()
              .toString()
              .split("estadoPaciente")[1]
              .split(":")[1]
              .split("}")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.cidadePaciente = event
              .data()
              .toString()
              .split("cidadePaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    docRef.snapshots().listen(
          (event) => usuarioPaciente.CepPaciente = event
              .data()
              .toString()
              .split("CepPaciente")[1]
              .split(":")[1]
              .split(",")[0],
          onError: (error) => print("Listen failed: $error"),
        );
    setState(() {
      usuarioPaciente;
    });
    setState(() {
      controller.text = usuarioPaciente.numeroCllPaciente!;
      controller1.text = usuarioPaciente.CepPaciente!;
      controller2.text = usuarioPaciente.observacoesPaciente!;
      controller3.text = usuarioPaciente.idadePaciente!;
    });
  }

  String ErroCep = '';
  bool isloading = false;

  main() async {
    try {
      setState(() {
        isloading = true;
      });
      final viaCepSearchCep = ViaCepSearchCep();
      final infoCepJSON = await viaCepSearchCep.searchInfoByCep(
          cep: _controllerCepPacientePerfil.text);
      print(infoCepJSON);
      if (infoCepJSON.toString().contains("error")) {
        throw Exception("CEP inexistente");
      } else {
        infoCepJSON.toString().split(",");
        print(infoCepJSON.toString().split(",")[4].split(":")[1]);
        _controllerCidadePacientePerfil.text =
            infoCepJSON.toString().split(",")[4].split(":")[1];
        _controllerEstadoPacientePerfil.text =
            infoCepJSON.toString().split(",")[5].split(":")[1];

        print(_controllerEstadoPacientePerfil.text);
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
                imagePath: usuarioPaciente.imagePathPaciente ??
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
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
              label: 'Idade',
              text: usuarioPaciente.idadePaciente ?? '',
              controller: controller3,
              Inputformatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Celular para contato',
              text: usuarioPaciente.numeroCllPaciente ?? '',
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
                  text: usuarioPaciente.CepPaciente ?? '',
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
              label: 'Observações',
              text: usuarioPaciente.observacoesPaciente ?? '',
              controller: controller2,
              maxLines: 5,
            ),
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
                    if (ErroCep.isEmpty) {
                      Navigator.of(context).pop();
                    }
                  },
                ))
          ],
        ));
  }
}
