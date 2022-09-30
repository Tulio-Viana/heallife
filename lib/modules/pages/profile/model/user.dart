import 'dart:convert';

class UserProf {
  String imagePathProf;
  String nameProf;
  String emailProf;
  String sobreProf;
  String numeroCllProf;
  String estadoProf;
  String cidadeProf;

  UserProf({
    required this.imagePathProf,
    required this.nameProf,
    required this.emailProf,
    required this.sobreProf,
    required this.numeroCllProf,
    required this.estadoProf,
    required this.cidadeProf,
  });
}

class UserPaciente {
  String imagePathPaciente;
  String namePaciente;
  String emailPaciente;
  String observacoesPaciente;
  String numeroCllPaciente;
  String estadoPaciente;
  String cidadePaciente;

  UserPaciente(
      {required this.imagePathPaciente,
      required this.namePaciente,
      required this.emailPaciente,
      required this.observacoesPaciente,
      required this.numeroCllPaciente,
      required this.estadoPaciente,
      required this.cidadePaciente});
}
