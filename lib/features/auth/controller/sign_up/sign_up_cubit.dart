import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(SignUpInitial());

  final AuthRepo _authRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required String fullname,
  }) async {
    emit(SignUpLoading());
    await _authRepo.signUp(email, password, fullname).then((value) {
      value.fold(
        (failure) => emit(SignUpFailure(failure: failure)),
        (user) => emit(SignUpSuccess(userModel: user)),
      );
    });
  }

  void toggleTermsAccepted({required bool value}) {
    emit(ToggleTermsAndConditions(isAccepted: value));
  }
}
