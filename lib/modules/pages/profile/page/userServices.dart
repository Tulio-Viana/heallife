import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

Future<Map<String, dynamic>?> lerdadosPaciente() async {
  User? usuario = await _firebaseAuth.currentUser;
  String id = usuario!.uid;
  final pacienteref = db.collection("paciente").doc(id);
  var docsref = await pacienteref.get();
  return docsref.data();
}
