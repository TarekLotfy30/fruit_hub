part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState(this.mode);
  final ThemeMode mode;

  @override
  List<Object> get props => [mode];
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(ThemeMode.system);
}

final class ThemeUpdate extends ThemeState {
  const ThemeUpdate(super.mode);
}
