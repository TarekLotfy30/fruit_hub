part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
}

final class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}
