import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idosos/shared/routes.dart';

import '../bottomnavigator/pg_principal.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

ObterPerfil() {
  _firebaseAuth.authStateChanges().listen((User? user) {
    if (user != null) {
      print(user.uid);
    }
  });
}

login(String email, String password, context) async {
  try {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PaginaPrincipal()));
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Usuário não encontrado"),
          backgroundColor: Colors.redAccent));
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Senha Incorreta"), backgroundColor: Colors.redAccent));
    } else {
      print(e.message);
    }
  }
}
