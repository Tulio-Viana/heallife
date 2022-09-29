import 'dart:convert';

class UserProf {
  final String imagePathProf;
  final String nameProf;
  final String emailProf;
  final String sobreProf;
  final String numeroCllProf;
  final String estadoProf;
  final String cidadeProf;

  const UserProf({
    required this.imagePathProf,
    required this.nameProf,
    required this.emailProf,
    required this.sobreProf,
    required this.numeroCllProf,
    required this.estadoProf,
    required this.cidadeProf,
  });

  UserProf copy({
    String? imagePathProf,
    String? nameProf,
    String? emailProf,
    String? sobreProf,
    String? numeroCllProf,
    String? estadoProf,
    String? cidadeProf,
  }) =>
      UserProf(
          imagePathProf: imagePathProf ?? this.imagePathProf,
          nameProf: nameProf ?? this.nameProf,
          emailProf: emailProf ?? this.emailProf,
          sobreProf: sobreProf ?? this.sobreProf,
          cidadeProf: cidadeProf ?? this.cidadeProf,
          estadoProf: estadoProf ?? this.estadoProf,
          numeroCllProf: numeroCllProf ?? this.numeroCllProf);

  static UserProf fromJson(Map<String, dynamic> json) => UserProf(
      imagePathProf: json['imagePathProf'],
      nameProf: json['nameProf'],
      emailProf: json['emailProf'],
      sobreProf: json['sobreProf'],
      estadoProf: json['estadoProf'],
      cidadeProf: json['cidadeProf'],
      numeroCllProf: json['numeroCllProf']);

  Map<String, dynamic> toJson() => {
        'imagePathProf': imagePathProf,
        'nameProf': nameProf,
        'emailProf': emailProf,
        'sobreProf': sobreProf,
        'estadoProf': estadoProf,
        'cidadeProf': cidadeProf,
        'numeroCllProf': numeroCllProf
      };
}

class UserPaciente {
  final String imagePathPaciente;
  final String namePaciente;
  final String emailPaciente;
  final String observacoesPaciente;
  final String numeroCllPaciente;
  final String estadoPaciente;
  final String cidadePaciente;

  const UserPaciente(
      {required this.imagePathPaciente,
      required this.namePaciente,
      required this.emailPaciente,
      required this.observacoesPaciente,
      required this.numeroCllPaciente,
      required this.estadoPaciente,
      required this.cidadePaciente});

  UserPaciente copy({
    String? imagePathPaciente,
    String? namePaciente,
    String? emailPaciente,
    String? observacoesPaciente,
    String? numeroCllPaciente,
    String? estadoPaciente,
    String? cidadePaciente,
  }) =>
      UserPaciente(
        imagePathPaciente: imagePathPaciente ?? this.imagePathPaciente,
        namePaciente: namePaciente ?? this.namePaciente,
        emailPaciente: emailPaciente ?? this.emailPaciente,
        observacoesPaciente: observacoesPaciente ?? this.observacoesPaciente,
        numeroCllPaciente: numeroCllPaciente ?? this.numeroCllPaciente,
        estadoPaciente: estadoPaciente ?? this.estadoPaciente,
        cidadePaciente: cidadePaciente ?? this.cidadePaciente,
      );

  static UserPaciente fromJson(Map<String, dynamic> json) => UserPaciente(
      imagePathPaciente: json['imagePathPaciente'],
      namePaciente: json['namePaciente'],
      emailPaciente: json['emailPaciente'],
      observacoesPaciente: json['observacoesPaciente'],
      numeroCllPaciente: json['numeroCllPaciente'],
      estadoPaciente: json['estadoPaciente'],
      cidadePaciente: json['cidadePaciente']);

  Map<String, dynamic> toJson() => {
        'imagePathPaciente': imagePathPaciente,
        'namePaciente': namePaciente,
        'emailPaciente': emailPaciente,
        'observacoesPaciente': observacoesPaciente,
        'numeroCllPaciente': numeroCllPaciente,
        'estadoPaciente': estadoPaciente,
        'cidadePaciente': cidadePaciente,
      };
}
