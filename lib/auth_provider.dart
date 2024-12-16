import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  bool get isSignedIn => currentUser != null;

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    notifyListeners();
  }
// Future<void> signUp(
//     String email, String password, String name, String imageUrl) async {
//   // Crée un utilisateur avec Firebase Authentication en utilisant email et mot de passe
//   UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: email, password: password);
//
//   // Télécharge l'image de profil et obtient l'URL publique
//   final imageurl = await _uploadImage(_image!);
//
//   // Enregistre les informations de l'utilisateur dans Firestore
//   await _firestore.collection('users') // Accède à la collection 'users'
//       .doc(userCredential.user!.uid) // Identifie le document par l'UID utilisateur
//       .set({
//     'uid': userCredential.user!.uid, // Stocke l'UID de l'utilisateur
//     'name': name, // Stocke le nom de l'utilisateur
//     'email': email, // Stocke l'email de l'utilisateur
//     'imageUrl': imageurl, // Stocke l'URL de l'image de l'utilisateur
//   });
//
//   // Notifie les listeners que les données ont été mises à jour
//   notifyListeners();
// }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
