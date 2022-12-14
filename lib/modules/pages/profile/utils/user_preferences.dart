import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPreferencesProf {
  static late SharedPreferences _preferencesProf;
  static const _keyUser = 'userProf';
  static var myUser;

  static Future init() async =>
      _preferencesProf = await SharedPreferences.getInstance();

  static Future<UserProf> getUser() async {
    final json = _preferencesProf.getString(_keyUser);
    if (FirebaseAuth.instance.currentUser != null) {
      var pegardobanco = await FirebaseFirestore.instance
          .collection('profissional')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      myUser = UserProf(
        imagePathProf:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
        nameProf: pegardobanco.data()?['nome'],
        emailProf: pegardobanco.data()?['email'],
        sobreProf: 'Suas informações (Clique na foto para editar)',
        numeroCllProf: pegardobanco.data()?['celular'],
        estadoProf: pegardobanco.data()?['estado'],
        cidadeProf: pegardobanco.data()?['cidade'],
        CepProf: pegardobanco.data()?['cep'],
      );
    }
    return myUser;
  }
}

class UserPreferencesPaciente {
  static late SharedPreferences _preferencesPaciente;
  static const _keyUser = 'userPaciente';
  static var myUser;

  static Future init() async =>
      _preferencesPaciente = await SharedPreferences.getInstance();

  Future<UserPaciente> getUser() async {
    final json = _preferencesPaciente.getString(_keyUser);
    var pegardobancopaciente = await FirebaseFirestore.instance
        .collection('paciente')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(pegardobancopaciente.data());
    if (FirebaseAuth.instance.currentUser != null &&
        pegardobancopaciente.data() != null) {
      print(pegardobancopaciente.data());

      // var newUser = UserPaciente(
      //     imagePathPaciente:
      //         'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
      //     namePaciente: pegardobancopaciente.data()!['nome'],
      //     idadePaciente: pegardobancopaciente.data()!['idade'],
      //     emailPaciente: pegardobancopaciente.data()!['email'],
      //     observacoesPaciente: 'Suas informações (Clique na foto para editar)',
      //     numeroCllPaciente: pegardobancopaciente.data()!['celular'],
      //     estadoPaciente: pegardobancopaciente.data()!['estado'],
      //     cidadePaciente: pegardobancopaciente.data()!['cidade'],
      //     CepPaciente: pegardobancopaciente.data()!['cep']);
      // return newUser;
    }

    return myUser;
  }
}
