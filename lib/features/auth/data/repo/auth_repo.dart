import '../model/user.dart';

abstract class AuthRepo {
  Future<UserModel> createUserWithEmailAndPassword(
    String email,
    String password,
  );
}
