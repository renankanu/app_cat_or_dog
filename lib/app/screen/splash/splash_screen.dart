import 'package:appcatordog/app/screen/home/home_screen.dart';
import 'package:appcatordog/app/utils/images.dart';
import 'package:appcatordog/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatelessWidget {
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
              Lottie.asset(Images.paws, onLoaded: (composition) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
