part of 'home_header_cubit.dart';

sealed class HomeHeaderState extends Equatable {
  const HomeHeaderState();

  @override
  List<Object> get props => [];
}

final class HomeHeaderInitial extends HomeHeaderState {}

final class HomeHeaderLoading extends HomeHeaderState {}

final class HomeHeaderSuccess extends HomeHeaderState {
  const HomeHeaderSuccess({this.fullName = '', this.firstLetter = ''});

  final String fullName;
  final String firstLetter;

  HomeHeaderSuccess copyWith({String? fullName, String? firstLetter}) =>
      HomeHeaderSuccess(
        fullName: fullName ?? this.fullName,
        firstLetter: firstLetter ?? this.firstLetter,
      );

  @override
  List<Object> get props => [fullName, firstLetter];
}

final class HomeHeaderError extends HomeHeaderState {
  final String errorMessage;

  const HomeHeaderError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
