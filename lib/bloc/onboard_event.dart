part of 'onboard_bloc.dart';

abstract class OnboardingEvent {}

class NextOnboardingEvent extends OnboardingEvent {}

class PreviousOnboardingEvent extends OnboardingEvent {}
