import 'package:cloud_firestore/cloud_firestore.dart';

class paciente {
  final String? nome;
  final String? idade;
  final String? cpf;
  final String? celular;
  final String? email;
  final String? senha;

  paciente(
      {this.nome, this.idade, this.cpf, this.celular, this.email, this.senha});

  factory paciente.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return paciente(
      nome: data?['nome'],
      idade: data?['idade'],
      cpf: data?['cpf'],
      celular: data?['celular'],
      email: data?['email'],
      senha: data?['senha'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nome != null) "nome": nome,
      if (idade != null) "idade": idade,
      if (cpf != null) "cpf": cpf,
      if (celular != null) "celular": celular,
      if (email != null) "email": email,
      if (senha != null) "senha": senha,
    };
  }
}
