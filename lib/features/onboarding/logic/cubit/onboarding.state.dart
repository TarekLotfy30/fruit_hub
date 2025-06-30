import 'package:equatable/equatable.dart';


sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

final class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

final class OnboardingChanged extends OnboardingState {
  const OnboardingChanged({required this.pageIndex, required this.isLastPage});
  final int pageIndex;
  final bool isLastPage;

  @override
  List<Object> get props => [pageIndex, isLastPage];
}

final class OnboardingSkipped extends OnboardingState {}
