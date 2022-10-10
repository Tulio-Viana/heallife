// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProf {
  String? imagePathProf;
  String nameProf;
  String emailProf;
  String sobreProf;
  String numeroCllProf;
  String estadoProf;
  String cidadeProf;
  String CepProf;

  UserProf({
    this.imagePathProf,
    required this.nameProf,
    required this.emailProf,
    required this.sobreProf,
    required this.numeroCllProf,
    required this.estadoProf,
    required this.cidadeProf,
    required this.CepProf,
  });

  UserProf copyWith({
    String? imagePathProf,
    String? nameProf,
    String? emailProf,
    String? sobreProf,
    String? numeroCllProf,
    String? estadoProf,
    String? cidadeProf,
    String? CepProf,
  }) {
    return UserProf(
      imagePathProf: imagePathProf ?? this.imagePathProf,
      nameProf: nameProf ?? this.nameProf,
      emailProf: emailProf ?? this.emailProf,
      sobreProf: sobreProf ?? this.sobreProf,
      numeroCllProf: numeroCllProf ?? this.numeroCllProf,
      estadoProf: estadoProf ?? this.estadoProf,
      cidadeProf: cidadeProf ?? this.cidadeProf,
      CepProf: CepProf ?? this.CepProf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePathProf': imagePathProf,
      'nameProf': nameProf,
      'emailProf': emailProf,
      'sobreProf': sobreProf,
      'numeroCllProf': numeroCllProf,
      'estadoProf': estadoProf,
      'cidadeProf': cidadeProf,
      'CepProf': CepProf,
    };
  }

  factory UserProf.fromMap(Map<String, dynamic> map) {
    return UserProf(
      imagePathProf:
          map['imagePathProf'] != null ? map['imagePathProf'] as String : null,
      nameProf: map['nameProf'] as String,
      emailProf: map['emailProf'] as String,
      sobreProf: map['sobreProf'] as String,
      numeroCllProf: map['numeroCllProf'] as String,
      estadoProf: map['estadoProf'] as String,
      cidadeProf: map['cidadeProf'] as String,
      CepProf: map['CepProf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProf.fromJson(String source) =>
      UserProf.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProf(imagePathProf: $imagePathProf, nameProf: $nameProf, emailProf: $emailProf, sobreProf: $sobreProf, numeroCllProf: $numeroCllProf, estadoProf: $estadoProf, cidadeProf: $cidadeProf, CepProf: $CepProf)';
  }

  @override
  bool operator ==(covariant UserProf other) {
    if (identical(this, other)) return true;

    return other.imagePathProf == imagePathProf &&
        other.nameProf == nameProf &&
        other.emailProf == emailProf &&
        other.sobreProf == sobreProf &&
        other.numeroCllProf == numeroCllProf &&
        other.estadoProf == estadoProf &&
        other.cidadeProf == cidadeProf &&
        other.CepProf == CepProf;
  }

  @override
  int get hashCode {
    return imagePathProf.hashCode ^
        nameProf.hashCode ^
        emailProf.hashCode ^
        sobreProf.hashCode ^
        numeroCllProf.hashCode ^
        estadoProf.hashCode ^
        cidadeProf.hashCode ^
        CepProf.hashCode;
  }
}

class UserPaciente {
  String? imagePathPaciente;
  String? namePaciente;
  String? emailPaciente;
  String? observacoesPaciente;
  String? numeroCllPaciente;
  String? estadoPaciente;
  String? cidadePaciente;
  String? CepPaciente;
  String? idadePaciente;

  UserPaciente({
    this.imagePathPaciente,
    this.namePaciente,
    this.emailPaciente,
    this.observacoesPaciente,
    this.numeroCllPaciente,
    this.estadoPaciente,
    this.cidadePaciente,
    this.CepPaciente,
    this.idadePaciente,
  });

  UserPaciente copyWith({
    String? imagePathPaciente,
    String? namePaciente,
    String? emailPaciente,
    String? observacoesPaciente,
    String? numeroCllPaciente,
    String? estadoPaciente,
    String? cidadePaciente,
    String? CepPaciente,
    String? idadePaciente,
  }) {
    return UserPaciente(
      imagePathPaciente: imagePathPaciente ?? this.imagePathPaciente,
      namePaciente: namePaciente ?? this.namePaciente,
      emailPaciente: emailPaciente ?? this.emailPaciente,
      observacoesPaciente: observacoesPaciente ?? this.observacoesPaciente,
      numeroCllPaciente: numeroCllPaciente ?? this.numeroCllPaciente,
      estadoPaciente: estadoPaciente ?? this.estadoPaciente,
      cidadePaciente: cidadePaciente ?? this.cidadePaciente,
      CepPaciente: CepPaciente ?? this.CepPaciente,
      idadePaciente: idadePaciente ?? this.idadePaciente,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePathPaciente': imagePathPaciente,
      'namePaciente': namePaciente,
      'emailPaciente': emailPaciente,
      'observacoesPaciente': observacoesPaciente,
      'numeroCllPaciente': numeroCllPaciente,
      'estadoPaciente': estadoPaciente,
      'cidadePaciente': cidadePaciente,
      'CepPaciente': CepPaciente,
      'idadePaciente': idadePaciente,
    };
  }

  factory UserPaciente.fromMap(Map<String, dynamic> map) {
    return UserPaciente(
      imagePathPaciente: map['imagePathPaciente'] != null
          ? map['imagePathPaciente'] as String
          : null,
      namePaciente:
          map['namePaciente'] != null ? map['namePaciente'] as String : null,
      emailPaciente:
          map['emailPaciente'] != null ? map['emailPaciente'] as String : null,
      observacoesPaciente: map['observacoesPaciente'] != null
          ? map['observacoesPaciente'] as String
          : null,
      numeroCllPaciente: map['numeroCllPaciente'] != null
          ? map['numeroCllPaciente'] as String
          : null,
      estadoPaciente: map['estadoPaciente'] != null
          ? map['estadoPaciente'] as String
          : null,
      cidadePaciente: map['cidadePaciente'] != null
          ? map['cidadePaciente'] as String
          : null,
      CepPaciente:
          map['CepPaciente'] != null ? map['CepPaciente'] as String : null,
      idadePaciente:
          map['idadePaciente'] != null ? map['idadePaciente'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPaciente.fromJson(String source) =>
      UserPaciente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserPaciente(imagePathPaciente: $imagePathPaciente, namePaciente: $namePaciente, emailPaciente: $emailPaciente, observacoesPaciente: $observacoesPaciente, numeroCllPaciente: $numeroCllPaciente, estadoPaciente: $estadoPaciente, cidadePaciente: $cidadePaciente, CepPaciente: $CepPaciente, idadePaciente: $idadePaciente)';
  }

  @override
  bool operator ==(covariant UserPaciente other) {
    if (identical(this, other)) return true;

    return other.imagePathPaciente == imagePathPaciente &&
        other.namePaciente == namePaciente &&
        other.emailPaciente == emailPaciente &&
        other.observacoesPaciente == observacoesPaciente &&
        other.numeroCllPaciente == numeroCllPaciente &&
        other.estadoPaciente == estadoPaciente &&
        other.cidadePaciente == cidadePaciente &&
        other.CepPaciente == CepPaciente &&
        other.idadePaciente == idadePaciente;
  }

  @override
  int get hashCode {
    return imagePathPaciente.hashCode ^
        namePaciente.hashCode ^
        emailPaciente.hashCode ^
        observacoesPaciente.hashCode ^
        numeroCllPaciente.hashCode ^
        estadoPaciente.hashCode ^
        cidadePaciente.hashCode ^
        CepPaciente.hashCode ^
        idadePaciente.hashCode;
  }
}
