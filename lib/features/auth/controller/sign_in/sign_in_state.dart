part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInError extends SignInState {
  const SignInError({required this.message});

  final String message;
}
