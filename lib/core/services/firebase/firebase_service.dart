import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseService() {
    log('FirebaseService initialized', name: 'FirebaseService');
  }

  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String fullname,
  }) async {
    // Implementation for signing in with email and password
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    // Implementation for signing in with email and password
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Future<void> sendEmailVerification() async {
  //   final user = _auth.currentUser;
  //   if (user == null) {
  //     log('No user is signed in', name: 'FirebaseService');
  //     return;
  //   }

  //   if (user.emailVerified) {
  //     log(
  //       '✅ Email already verified for ${user.email}',
  //       name: 'FirebaseService',
  //     );
  //     return;
  //   }

  //   await user.sendEmailVerification();
  // }

  // Future<bool> isEmailVerified() async {
  //   final user = _auth.currentUser;
  //   if (user == null) {
  //     return false;
  //   }

  //   await user.reload(); // refresh
  //   return user.emailVerified;
  // }
}
