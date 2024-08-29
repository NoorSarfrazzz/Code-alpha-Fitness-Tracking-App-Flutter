import 'package:fitness/welcome.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _startSplashScreenTimer();
  }

  _startSplashScreenTimer() async {
    var duration = Duration(seconds: 0);
    Timer(duration, _showContent);
    Timer(Duration(seconds: 3), _navigateToNextScreen);
  }

  _showContent() {
    setState(() {
      _visible = true;
    });
  }

  _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22A6A0),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child:Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold
                    ),
                    children: [
                      TextSpan(text: 'Fitness ', style: TextStyle(color: Colors.white)),
                      TextSpan(text: 'Tracker', style: TextStyle(color: Colors.yellow.shade200)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
