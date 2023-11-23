import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<bool> loginWithEmail(String email, password) async {
    try {
      final credetial = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credetial);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginWithAnonymous() async {
    try {
      final credential = await _firebaseAuth.signInAnonymously();
      print(
          "Signed in with temporary account ${credential.user!.displayName ?? "no display"}");
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
      return false;
    }
  }
}
