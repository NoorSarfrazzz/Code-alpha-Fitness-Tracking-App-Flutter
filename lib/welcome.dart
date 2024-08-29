import 'package:fitness/screens/home.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/images.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            // Transparent black overlay
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.85),
              ),
            ),
            // Centered text
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                  Container(
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.14, // Increased height for the image
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.008,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: 'Welcome to ',
                        ),
                        TextSpan(
                          text: 'Fitness',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color:  Colors.green,
                          ),
                        ),
                        TextSpan(
                          text: ' Tracker',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Your new favorite fitness tracking app.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                  Text(
                    'Terms of use and Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow.shade600,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                    child: Text(
                      'By continuing to use the FitnessTracker app, you represent that you have read and accept both the Terms of Use and Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                  SizedBox(
                    width: 250,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationScreen()));
                      },
                      child: Text(
                        'Accept and Continue',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.green),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.117,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
