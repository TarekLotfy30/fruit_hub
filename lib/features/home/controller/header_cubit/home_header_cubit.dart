import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/helpers/extensions/string_extension.dart';
import '../../data/repo/home_repo.dart';

part 'home_header_state.dart';

class HomeHeaderCubit extends Cubit<HomeHeaderState> {
  HomeHeaderCubit({required HomeRepo homeRepo})
    : _homeRepo = homeRepo,
      super(HomeHeaderInitial());

  final HomeRepo _homeRepo;

  void fetchHeaderData() {
    emit(HomeHeaderLoading());

    _homeRepo.getUserName().fold(
      (failure) => emit(HomeHeaderError(errorMessage: failure.errorMessage)),
      (fullName) {
        final capitalized = fullName.capitalizeFirstLetter();
        final firstLetter = fullName.isNotEmpty
            ? fullName[0].toUpperCase()
            : '';
        emit(
          HomeHeaderSuccess(fullName: capitalized, firstLetter: firstLetter),
        );
      },
    );
  }
}
