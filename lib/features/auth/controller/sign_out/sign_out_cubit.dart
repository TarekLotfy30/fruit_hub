import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
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
      value.fold((failure) => emit(SignOutFailure(failure: failure)), (
        _,
      ) async {
        await clearSharedPrefs();
        emit(SignOutSuccess());
      });
    });
  }

  Future<void> clearSharedPrefs() async {
    final localHelper = getIt.get<LocalHelper>();
    await Future.wait([
      localHelper.removeValue(key: AppSharedKey.isLoggedIn),
      localHelper.removeValue(key: AppSharedKey.userId),
      localHelper.removeValue(key: AppSharedKey.userEmail),
      localHelper.removeValue(key: AppSharedKey.userName),
    ]);
  }
}
