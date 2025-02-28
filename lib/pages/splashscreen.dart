import 'dart:async';
import 'package:TakeIt/pages/onboarding.dart';
import 'package:flutter/material.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
    // fade effect
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double srcheight = MediaQuery.of(context).size.height;
    double srcwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: srcheight,
          width: srcwidth,
          color:  Color.fromRGBO(59,145,242,1.0),
          child: Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 1500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo/takeitlogo.png',
                    // height: srcwidth * 0.35,
                    // width: srcwidth * 0.35,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

