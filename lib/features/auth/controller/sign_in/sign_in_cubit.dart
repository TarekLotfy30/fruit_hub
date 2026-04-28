import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/local/app_shared_keys.dart';
import '../../../../core/services/local/local_helper.dart';
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
      value.fold((failure) => emit(SignInFailure(failure: failure)), (
        user,
      ) async {
        await saveDataLocally(user);
        emit(SignInSuccess(userModel: user));
      });
    });
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    await _authRepo.signInWithGoogle().then((value) {
      value.fold((failure) => emit(SignInFailure(failure: failure)), (
        user,
      ) async {
        await saveDataLocally(user);
        emit(SignInSuccess(userModel: user));
      });
    });
  }

  Future<void> saveDataLocally(UserModel user) async {
    final localHelper = getIt.get<LocalHelper>();
    await Future.wait([
      localHelper.setValue(key: AppSharedKey.isLoggedIn, value: true),
      localHelper.setValue(key: AppSharedKey.userId, value: user.uid),
      localHelper.setValue(key: AppSharedKey.userEmail, value: user.email),
      localHelper.setValue(
        key: AppSharedKey.userName,
        value: user.fullname.split(' ').first,
      ),
    ]);
  }
}
