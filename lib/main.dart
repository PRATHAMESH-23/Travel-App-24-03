import 'package:flutter/material.dart';
import 'package:travel_app/pages/auth/sign_in.dart';
import 'package:travel_app/pages/auth/sign_up.dart';
import 'package:travel_app/pages/choicedate_page.dart';
import 'package:travel_app/pages/dashboard_page.dart';
import 'package:travel_app/pages/discover_page.dart';
import 'package:travel_app/pages/explore_page.dart';
import 'package:travel_app/pages/explorelist_page.dart';
import 'package:travel_app/pages/hotplaces_page.dart';
import 'package:travel_app/pages/map_page.dart';
import 'package:travel_app/pages/onboarding/splash_page.dart';
import 'package:travel_app/pages/profile_page.dart';
import 'package:travel_app/pages/selectdate_page.dart';
import 'package:travel_app/pages/setting_page.dart';
import 'package:travel_app/pages/tourdetails_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      home: SettingPage(),
    );
  }
}
