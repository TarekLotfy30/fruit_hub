part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingChanged extends OnboardingState {}

final class OnboardingSkipped extends OnboardingState {}
