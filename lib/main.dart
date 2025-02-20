import 'package:TakeIt/languages.dart';
import 'package:TakeIt/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:OnboardingScreen() ,
    );
  }
}


