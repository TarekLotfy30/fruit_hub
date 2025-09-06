import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/user.dart';
import '../../data/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    await authRepo.signIn(email, password).then((value) {
      value.fold(
        (failure) => emit(SignInFailure(failure: failure)),
        (user) => emit(SignInSuccess(userModel: user)),
      );
    });
  }
}
