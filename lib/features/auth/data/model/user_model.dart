import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.uid,
    required this.fullname,
    required this.email,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      fullname: user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'fullname': fullname, 'email': email};
  }

  final String uid;
  final String fullname;
  final String email;

  @override
  List<Object?> get props => [uid, fullname, email];
}
