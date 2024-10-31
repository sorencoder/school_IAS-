import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  void login(String email, String password) async {
    try {
      UserCredential userCredential = auth.signInWithEmailAndPassword(
          email: email, password: password) as UserCredential;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      notifyListeners();
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential userCredential = auth.createUserWithEmailAndPassword(
          email: email, password: password) as UserCredential;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
