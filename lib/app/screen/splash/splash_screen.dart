import 'package:appcatordog/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: kNeptune));
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: kNeptune,
        brightness: Brightness.light, // or use Brightness.dark
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          color: kNeptune,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cat & Dog Finder"),
              Lottie.asset('assets/lotties/paws.json', onLoaded: (composition) {
                print("Finish");
              }),
            ],
          ),
        ),
      ),
    );
  }
}
