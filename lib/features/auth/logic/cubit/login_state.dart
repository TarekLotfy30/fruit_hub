sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  LoginError({required this.message});
  final String message;
}

class LoginSuccess extends LoginState {}
