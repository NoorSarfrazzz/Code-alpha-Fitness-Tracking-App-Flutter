import 'package:flutter/material.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  String _fitnessGoal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF22A6A0),
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 5.0, vertical: 5), // Add left space
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(26),
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: Text(
          'Set Fitness Goal',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Fitness Goal',
                labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                ),
              ),
              onChanged: (value) {
                _fitnessGoal = value;
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _fitnessGoal);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Color(0xFF22A6A0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              child: Text(
                'Save Goal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
