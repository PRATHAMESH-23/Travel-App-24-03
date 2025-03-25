import 'package:flutter/material.dart';
import 'package:travel_app/pages/auth/sign_in.dart';
import 'package:travel_app/pages/auth/sign_up.dart';
import 'package:travel_app/pages/onboarding/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      //home: SplashPage(onboardingData: _onboardingData),
      home: SignUpPage(),
    );
  }
}
