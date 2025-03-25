// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:travel_app/bloc/onboard_bloc.dart';
import 'package:travel_app/config/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardPages extends StatelessWidget {
  final List<Map<String, String>> onboardingData;
  final Widget? homeScreen; // Added: To navigate to home

  const OnboardPages({
    super.key,
    required this.onboardingData,
    this.homeScreen, // Added to navigate
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(onboardingData: onboardingData),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          int currentPage = 0;
          if (state is OnboardingPageChanged) {
            currentPage = state.currentPage;
          }

          final onboardingBloc = BlocProvider.of<OnboardingBloc>(context);

          return Scaffold(
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        onboardingData[currentPage]['element']!,

                        height: 600,
                      ),
                      Image.asset(
                        onboardingData[currentPage]['image']!,
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onboardingData[currentPage]['title']!,
                          style: const TextStyle(
                            fontFamily: Fonts.regular,
                            fontSize: WidgetSize.fontSize_28,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          onboardingData[currentPage]['description']!,
                          style: const TextStyle(
                            fontFamily: Fonts.medium,
                            fontSize: WidgetSize.fontSize_16,
                            color: AppColors.subText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:
                              currentPage > 0
                                  ? () => onboardingBloc.add(
                                    PreviousOnboardingEvent(),
                                  )
                                  : null,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              color: AppColors.textFieldBorder,
                            ),
                          ),
                        ),
                        Row(
                          children: List.generate(
                            onboardingData.length,
                            (index) => buildDot(index, currentPage),
                          ),
                        ),
                        InkWell(
                          onTap:
                              currentPage < onboardingData.length - 1
                                  ? () =>
                                      onboardingBloc.add(NextOnboardingEvent())
                                  : () {
                                    //   Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const MyHomePage())); // Replace MyHomePage
                                    if (homeScreen != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => homeScreen!,
                                        ),
                                      );
                                    }
                                  },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: AppColors.textFieldBorder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildDot(int index, int currentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color:
            currentPage == index
                ? AppColors
                    .orange // Active color.
                : AppColors.subText.withValues(alpha: 0.5), // Inactive color.
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
