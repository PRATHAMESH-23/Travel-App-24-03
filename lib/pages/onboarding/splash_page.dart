import 'package:flutter/material.dart';
import 'package:travel_app/config/constants.dart';
import 'package:travel_app/pages/onboarding/onboard_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

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
          builder: (context) => OnboardPages(onboardingData: _onboardingData),
        ),
      );
    });
  }

  final List<Map<String, String>> _onboardingData = const [
    {
      'title': 'Explore',
      'description': 'Explore your favourite destination around the world',
      'image': 'assets/images/onboard1.png',
      'element': 'assets/images/element1.png',
    },
    {
      'title': 'Easy Peasy',
      'description': 'Make your travel experience very easy and peasy',
      'image': 'assets/images/onboard2.png',
      'element': 'assets/images/element2.png',
    },
    {
      'title': 'Enjoy Tour',
      'description': 'Enjoy your favourite destination with your love one',
      'image': 'assets/images/onboard3.png',
      'element': 'assets/images/element3.png',
    },
  ];

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
