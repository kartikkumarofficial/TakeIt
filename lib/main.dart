import 'package:TakeIt/languages.dart';
import 'package:TakeIt/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    title: 'GetX Theme Demo',
      locale: Locale('en','US'), //default is english
      fallbackLocale: Locale('en','US'),
      // theme: ThemeData.dark(), // Default theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.light, // Initial theme mode
    translations: Languages(),
      // navigatorObservers: [
      //   HeroControllerScope(controller: HeroController(createRectTween: _customTween)..duration = Duration(milliseconds: 1200),)
      // ],
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:OnboardingScreen() ,
    );
  }
}


