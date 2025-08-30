import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      fullname: user.displayName ?? '',
      email: user.email ?? '',
      password: '',
    );
  }

  final String id;
  final String fullname;
  final String email;
  final String password;

  @override
  List<Object?> get props => [id, fullname, email, password];
}
