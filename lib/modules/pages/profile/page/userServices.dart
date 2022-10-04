import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

lerdadosPaciente() async {
  User? usuario = await _firebaseAuth.currentUser;
  String id = usuario!.uid;
  print("Id do mano: $id");

  final pacienteref = db.collection("paciente").doc(id);
  var docsref = await pacienteref.get();

  print("Teste: ${docsref.data()}");

  return;
}
