import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/pages/onboarding/onboard_pages.dart';

class SplashPage extends StatefulWidget {
  final List<Map<String, String>> onboardingData;

  const SplashPage({super.key, required this.onboardingData});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:
              (context) => OnboardPages(onboardingData: widget.onboardingData),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Image.asset(Images.splash, fit: BoxFit.cover),
      ),
    );
  }
}
