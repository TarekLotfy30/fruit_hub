part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  const SignUpSuccess({required this.userModel});
  final UserModel userModel;

  @override
  List<Object> get props => [userModel];
}

final class SignUpFailure extends SignUpState {
  const SignUpFailure({required this.failure});
  final Failure failure;

  @override
  List<Object> get props => [failure];
}
