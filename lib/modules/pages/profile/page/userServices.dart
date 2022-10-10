import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

// Future<Map<String, dynamic>?> lerdadosPaciente() async {
//   User? usuario = await _firebaseAuth.currentUser;
//   String id = usuario!.uid;
//   final pacienteref = db.collection("paciente").doc(id);
//   var docsref = await pacienteref.get();
//   return docsref.data();
// }

lerProfissional() async {
  User? usuario = await _firebaseAuth.currentUser;
  String id = usuario!.uid;
  final docRef = await db.collection("profissional").doc(id);
  docRef.snapshots().listen(
        (event) => print("current data: ${event.data()}"),
        onError: (error) => print("Listen failed: $error"),
      );
  return docRef;
}

lerPaciente() async {
  User? usuario = await _firebaseAuth.currentUser;
  String id = usuario!.uid;
  final docRef = await db.collection("paciente").doc(id);
  return docRef;
}
