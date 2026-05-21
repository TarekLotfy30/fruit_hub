import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/auth/data/model/user_model.dart';
import 'firebase_collection.dart';

class FirestoreService {
  FirestoreService() {
    log(
      'FirebaseFireStoreService initialized',
      name: 'FirebaseFireStoreService',
    );
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _getKeyString(FirebaseCollection key) =>
      key.toString().split('.').last;

  Future<void> addData(UserModel user) async {
    final collectionName = _getKeyString(FirebaseCollection.users);
    await _firestore
        .collection(collectionName)
        .doc(user.uid)
        .set(user.toMap(), SetOptions(merge: true));
  }
}
