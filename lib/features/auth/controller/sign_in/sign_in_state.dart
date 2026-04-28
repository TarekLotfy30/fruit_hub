part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  const SignInSuccess({required this.userModel});
  final UserModel? userModel;

  @override
  List<Object?> get props => [userModel];
}

final class SignInFailure extends SignInState {
  const SignInFailure({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
