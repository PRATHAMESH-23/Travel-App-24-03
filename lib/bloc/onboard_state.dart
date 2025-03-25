part of 'onboard_bloc.dart';

abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int currentPage;

  OnboardingPageChanged(this.currentPage);
}
