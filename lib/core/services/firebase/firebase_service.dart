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
}
