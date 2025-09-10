import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///TODO(tarek):remove the material inside the cubit

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial());

  void toggleTheme() {
    log(state.mode.toString(), name: 'toggleTheme');
    if (state.mode == ThemeMode.dark) {
      emit(const ThemeUpdate(ThemeMode.light));
    } else {
      emit(const ThemeUpdate(ThemeMode.dark));
    }
  }
}


  // Future<void> _onToggleModeTap(BuildContext context) async {
  //   context.themeCubit.toggleTheme();
  // }
  