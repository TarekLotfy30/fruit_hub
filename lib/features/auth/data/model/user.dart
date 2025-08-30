import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.password,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      fullname: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  final String id;
  final String fullname;
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': fullname, 'email': email, 'password': password};
  }

  @override
  List<Object?> get props => [id, fullname, email, password];
}
