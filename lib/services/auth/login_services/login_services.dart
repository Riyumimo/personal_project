import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class LoginServices {
  final _firebaseAuth = FirebaseAuth.instance;
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get getStatusAuthenticated async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 1));
    String? status = preferences.getString("auth");
    print(status);
    if (status == AuthenticationStatus.authenticated.name) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<void> loginWithEmail(String email, password) async {
    try {
      final credetial = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credetial);
      await Future.delayed(const Duration(milliseconds: 300), () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("auth", AuthenticationStatus.authenticated.name);
        _controller.add(AuthenticationStatus.authenticated);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginWithAnonymous() async {
    try {
      final credential = await _firebaseAuth.signInAnonymously();
      print(
          "Signed in with temporary account ${credential.user!.displayName ?? "no display"}");
      await Future.delayed(const Duration(milliseconds: 300), () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("auth", AuthenticationStatus.authenticated.name);
        _controller.add(AuthenticationStatus.authenticated);
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  void logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("auth");
    await _firebaseAuth.signOut();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
}
