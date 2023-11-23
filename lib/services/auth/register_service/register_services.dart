import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class RegisterServices {
  void registerWithEmailPassword(String email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(credential.user?.displayName ?? "Error");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  Future<Duration> measureExecutionTime(
      [FutureOr<Null> Function()? computation]) async {
    DateTime startTime = DateTime.now();

    // Memanggil fungsi yang ingin diukur waktu eksekusinya
    await computation!();
    DateTime endTime = DateTime.now();
    Duration executionTime = endTime.difference(startTime);
    print('Execution time: ${executionTime.inMilliseconds} milliseconds');
    return executionTime + const Duration(milliseconds: 500);
  }
}
