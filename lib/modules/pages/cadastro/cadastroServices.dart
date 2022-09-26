import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

criarUsuario(String emailAddress, String password, context) async {
  bool senhaeEmailvalido = false;
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    senhaeEmailvalido = true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Senha fraca"), backgroundColor: Colors.redAccent));
      senhaeEmailvalido = false;
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Email já está em uso"),
          backgroundColor: Colors.redAccent));
      senhaeEmailvalido = false;
    }
  } catch (e) {
    senhaeEmailvalido = false;
  }
  return senhaeEmailvalido;
}

SalvarInfosUsers(String id, Map<String, dynamic> dados, String tipo) {
  final alovelaceDocumentRef =
      db.collection("users").doc(tipo).collection(id).add(dados);
}
