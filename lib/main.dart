import 'package:TakeIt/languages.dart';
import 'package:TakeIt/pages/onboarding.dart';
import 'package:TakeIt/pages/splashscreen.dart';
import 'package:cloudinary_url_gen/util/environment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:cloudinary/cloudinary.dart';
// import 'package:cloudinary_url_gen/cloudinary.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

//Global Cloudinary instance (key is public rn)
final cloudinary = Cloudinary.signedConfig(
  apiKey: "651289662435328",
  apiSecret: "qu8z8Ets52zW9SAb4X-B524zoZc",
  cloudName: "dwfowhzwn",
);

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
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      // theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    translations: Languages(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        popupMenuTheme: PopupMenuThemeData(
          color:Color.fromRGBO(255, 179, 0, 1),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Splashscreen() ,
    );
  }
}


