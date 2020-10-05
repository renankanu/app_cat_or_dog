import 'dart:async';

import 'package:appcatordog/app/screen/home/home_screen.dart';
import 'package:appcatordog/app/utils/images.dart';
import 'package:appcatordog/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  final splashDelay = 5;
  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: kNeptune,
        brightness: Brightness.light,
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          color: kNeptune,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cat & Dog Finder",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Lottie.asset(Images.paws),
            ],
          ),
        ),
      ),
    );
  }
}
