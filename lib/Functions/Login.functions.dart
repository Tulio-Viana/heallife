import 'package:flutter/cupertino.dart';
import 'package:idosos/main.dart';
import 'package:search_cep/search_cep.dart';

class LoginFunctions {
  String? validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Informe o E-mail";
    } else if (!regExp.hasMatch(value)) {
      return "E-mail inválido";
    } else {
      return null;
    }
  }

  String? validarSenha(String value) {
    if (value.isEmpty) {
      return "Informe sua senha";
    } else {
      return null;
    }
  }

  String? validarCOREN(String value) {
    if (value.isEmpty) {
      return "Insira o COREN:";
    } else {
      return null;
    }
  }

  String? validarUsuario(String value) {
    if (value.isEmpty) {
      return "Insira seu Nome e Sobrenome";
    } else {
      return null;
    }
  }

  String? validarIdade(String value) {
    if (value.isEmpty) {
      return "Informe sua idade";
    } else {
      return null;
    }
  }

  String? validarCEP(String value) {
    final viaCepSearchCep = ViaCepSearchCep();
    final infoCepJSON = viaCepSearchCep.searchInfoByCep(cep: value);

    if (infoCepJSON.toString().contains("error")) {
      return "CEP inexistente";
    } else {
      String pattern = r'[0-9]{5}[0-9]{3}';
      RegExp regExp = new RegExp(pattern);
      if (value.isEmpty) {
        return "Informe o CEP";
      } else if (!regExp.hasMatch(value)) {
        return "CEP inválido";
      } else {
        return null;
      }
    }
  }
}
