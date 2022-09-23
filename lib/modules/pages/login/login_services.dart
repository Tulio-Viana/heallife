import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:idosos/modules/pages/login/login.dart';
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

deslogar(context) async {
  await _firebaseAuth.signOut();
}

login(String email, String password, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Senha Incorreta"), backgroundColor: Colors.redAccent));
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Usuário não encontrado"),
          backgroundColor: Colors.redAccent));
    }
  } catch (e) {
    print(e);
  }
}
