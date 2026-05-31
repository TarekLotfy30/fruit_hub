import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(SignInInitial());

  final AuthRepo _authRepo;

  Future<void> signIn({required UserModel user}) async {
    emit(SignInLoading());
    await _authRepo.signIn(user).then((value) {
      value.fold(
        (failure) => emit(SignInFailure(failure: failure)),
        (user) => emit(SignInSuccess(userModel: user)),
      );
    });
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    await _authRepo.signInWithGoogle().then((value) {
      value.fold(
        (failure) => emit(SignInFailure(failure: failure)),
        (user) => emit(SignInSuccess(userModel: user)),
      );
    });
  }
}
