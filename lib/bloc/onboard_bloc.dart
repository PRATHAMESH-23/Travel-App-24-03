import 'package:bloc/bloc.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  List<Map<String, String>> onboardingData = [];

  OnboardingBloc({required this.onboardingData}) : super(OnboardingInitial()) {
    on<NextOnboardingEvent>((event, emit) {
      if ((state is OnboardingPageChanged &&
              (state as OnboardingPageChanged).currentPage <
                  onboardingData.length - 1) ||
          state is OnboardingInitial) {
        emit(
          OnboardingPageChanged(
            (state is OnboardingPageChanged)
                ? (state as OnboardingPageChanged).currentPage + 1
                : 0,
          ),
        );
      }
    });

    on<PreviousOnboardingEvent>((event, emit) {
      if (state is OnboardingPageChanged &&
          (state as OnboardingPageChanged).currentPage > 0) {
        emit(
          OnboardingPageChanged(
            (state as OnboardingPageChanged).currentPage - 1,
          ),
        );
      }
    });
  }
}
