class UserProf {
  final String imagePathProf;
  final String nameProf;
  final String emailProf;
  final String sobreProf;

  const UserProf(
      {required this.imagePathProf,
      required this.nameProf,
      required this.emailProf,
      required this.sobreProf});

  UserProf copy({
    String? imagePathProf,
    String? nameProf,
    String? emailProf,
    String? sobreProf,
  }) =>
      UserProf(
          imagePathProf: imagePathProf ?? this.imagePathProf,
          nameProf: nameProf ?? this.nameProf,
          emailProf: emailProf ?? this.emailProf,
          sobreProf: sobreProf ?? this.sobreProf);

  static UserProf fromJson(Map<String, dynamic> json) => UserProf(
      imagePathProf: json['imagePathProf'],
      nameProf: json['nameProf'],
      emailProf: json['emailProf'],
      sobreProf: json['sobreProf']);

  Map<String, dynamic> toJson() => {
        'imagePathProf': imagePathProf,
        'nameProf': nameProf,
        'emailProf': emailProf,
        'sobreProf': sobreProf,
      };
}

class UserPaciente {
  final String imagePathPaciente;
  final String namePaciente;
  final String emailPaciente;
  final String observacoesPaciente;

  const UserPaciente(
      {required this.imagePathPaciente,
      required this.namePaciente,
      required this.emailPaciente,
      required this.observacoesPaciente});

  UserPaciente copy({
    String? imagePathPaciente,
    String? namePaciente,
    String? emailPaciente,
    String? observacoesPaciente,
  }) =>
      UserPaciente(
          imagePathPaciente: imagePathPaciente ?? this.imagePathPaciente,
          namePaciente: namePaciente ?? this.namePaciente,
          emailPaciente: emailPaciente ?? this.emailPaciente,
          observacoesPaciente: observacoesPaciente ?? this.observacoesPaciente);

  static UserPaciente fromJson(Map<String, dynamic> json) => UserPaciente(
      imagePathPaciente: json['imagePathPaciente'],
      namePaciente: json['namePaciente'],
      emailPaciente: json['emailPaciente'],
      observacoesPaciente: json['observacoesPaciente']);

  Map<String, dynamic> toJson() => {
        'imagePathPaciente': imagePathPaciente,
        'namePaciente': namePaciente,
        'emailPaciente': emailPaciente,
        'sobrePaciente': observacoesPaciente,
      };
}
