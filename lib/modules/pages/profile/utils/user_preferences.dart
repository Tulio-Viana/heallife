import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class UserPreferencesProf {
  static late SharedPreferences _preferencesProf;

  static const _keyUser = 'userProf';
  static const myUser = UserProf(
    imagePathProf:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
    nameProf: 'Túlio Viana',
    emailProf: 't.viana2@icloud.com',
    sobreProf: 'Suas informações (Clique na foto para editar)',
  );

  static Future init() async =>
      _preferencesProf = await SharedPreferences.getInstance();

  static Future setUser(UserProf user) async {
    final json = jsonEncode(user.toJson());

    await _preferencesProf.setString(_keyUser, json);
  }

  static UserProf getUser() {
    final json = _preferencesProf.getString(_keyUser);

    return json == null ? myUser : UserProf.fromJson(jsonDecode(json));
  }
}

class UserPreferencesPaciente {
  static late SharedPreferences _preferencesPaciente;

  static const _keyUser = 'userPaciente';
  static const myUser = UserPaciente(
    imagePathPaciente:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1200px-User-avatar.svg.png',
    namePaciente: 'Andre Caralho',
    emailPaciente: 'a@gmail.com',
    observacoesPaciente:
        'Observações sobre o tratamento (clique na foto para editar)',
  );

  static Future init() async =>
      _preferencesPaciente = await SharedPreferences.getInstance();

  static Future setUser(UserPaciente user) async {
    final json = jsonEncode(user.toJson());

    await _preferencesPaciente.setString(_keyUser, json);
  }

  static UserPaciente getUser() {
    final json = _preferencesPaciente.getString(_keyUser);

    return json == null ? myUser : UserPaciente.fromJson(jsonDecode(json));
  }
}
