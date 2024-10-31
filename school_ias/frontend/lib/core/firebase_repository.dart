import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/data/model/user_model.dart';

class FirebaseRepository {
  final auth = FirebaseAuth.instance;
  Future<UserModel> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = auth.createUserWithEmailAndPassword(
          email: email, password: password) as UserCredential;
      return UserModel();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = auth.signInWithEmailAndPassword(
          email: email, password: password) as UserCredential;
      return UserModel();
    } catch (e) {
      rethrow;
    }
  }
}
