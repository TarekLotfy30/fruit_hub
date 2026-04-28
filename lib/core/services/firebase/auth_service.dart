import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/auth/data/model/user_model.dart';

class AuthService {
  AuthService() {
    log('FirebaseAuthService initialized', name: 'FirebaseAuthService');
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  Future<UserCredential> signUp({
    required UserModel user,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  Future<UserCredential> signIn({
    required UserModel user,
  }) async {
    // Implementation for signing in with email and password
    return _auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    _googleSignIn.initialize(
      serverClientId:
          '604693325993-v4r83k57cuo2fpbj2t8qak2bc428u6f1.apps.googleusercontent.com',
    );

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
      scopeHint: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    );
    log(
      'googleUser: Email: ${googleUser.email}, ID: ${googleUser.id}, DisplayName: ${googleUser.displayName}',
      name: 'FirebaseService',
    );

    log(googleUser.authentication.toString());

    // Obtain the auth details from the request
    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleUser.authentication.idToken,
    );

    // Once signed in, return the UserCredential
    return _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    if (_user != null) {
      final isGoogleUser = _user.providerData.any(
        (provider) => provider.providerId == 'google.com',
      );
      if (isGoogleUser) {
        log(
          '📡 Sending sign-out request to Google...',
          name: 'FirebaseService',
        );
        await _googleSignIn.signOut();
        log('✅ Google sign-out completed', name: 'FirebaseService');
      }

      if (!isGoogleUser) {
        log(
          '📡 Sending sign-out request to Firebase...',
          name: 'FirebaseService',
        );
        await _auth.signOut();
        log('✅ Firebase sign-out completed', name: 'FirebaseService');
      }
    }
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
}
