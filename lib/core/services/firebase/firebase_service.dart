import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/auth/data/model/user_model.dart';
import 'firebase_collection.dart';

class FirebaseService {
  FirebaseService() {
    log('FirebaseService initialized', name: 'FirebaseService');
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _getKeyString(FirebaseCollection key) {
    final keyString = key.toString().split('.').last;
    return keyString;
  }

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) {
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

  Future<void> signOut() async {
    await _auth.signOut();
  }

  bool checkIfUserIsSignedIn() {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      log(firebaseUser.toString(), name: 'firebaseUser');
      return true;
    } else {
      log('No user is signed in', name: 'FirebaseService');
      return false;
    }
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

  //----------------------------- Firestore ------------------------------------
  Future<void> addUserToFirestore(UserModel user) async {
    final collectionName = _getKeyString(FirebaseCollection.users);
    await _firestore
        .collection(collectionName)
        .doc(user.uid)
        .set(user.toMap(), SetOptions(merge: true));
  }
}
