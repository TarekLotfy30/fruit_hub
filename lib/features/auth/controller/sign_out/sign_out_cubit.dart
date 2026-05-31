import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../data/repo/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(SignOutInitial());

  final AuthRepo _authRepo;

  Future<void> signOutFromFirebase() async {
    emit(SignOutLoading());
    await _authRepo.signOut().then((value) {
      value.fold(
        (failure) => emit(SignOutFailure(failure: failure)),
        (_) => emit(SignOutSuccess()),
      );
    });
  }
}
