import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/user.dart';
import '../../data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required String fullname,
  }) async {
    emit(SignUpLoading());
    await authRepo.signUp(email, password, fullname).then((value) {
      value.fold(
        (failure) => emit(SignUpFailure(failure: failure)),
        (user) => emit(SignUpSuccess(userModel: user)),
      );
    });
  }

  // Future<void> sendEmailVerification() async {
  //   emit(SendEmailVerificationLoading());
  //   await authRepo.sendEmailVerification().then((value) {
  //     value.fold(
  //       (failure) => emit(SendEmailVerificationFailure(failure: failure)),
  //       (success) => emit(SendEmailVerificationSuccess()),
  //     );
  //   });
  // }


  // Future<void> checkEmailVerified() async {
  //   await authRepo.isEmailVerified().then((value) {
  //     value.fold(
  //       (failure) => emit(SignUpFailure(failure: failure)),
  //       (isVerified) {
  //         if (isVerified) {
  //           emit(EmailVerified());
  //         }
  //       },
  //     );
  //   });
  // }

  void toggleTermsAccepted({required bool value}) {
    emit(ToggleTermsAndConditions(isAccepted: value));
  }
}
