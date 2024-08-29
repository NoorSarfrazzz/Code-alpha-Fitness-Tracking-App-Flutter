import 'package:flutter/material.dart';
import 'add_workout.dart';
import 'goal.dart';
import 'progress.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _fitnessGoal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/fitness.avif',
              fit: BoxFit.cover,
            ),
          ),
          // Transparent black overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Fitness Goal Display
          if (_fitnessGoal.isNotEmpty)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white.withOpacity(0.06),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'My Fitness Goal: $_fitnessGoal',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _fitnessGoal = '';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          // Centered buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add Workout Button
                _buildElevatedButton(
                  context,
                  label: 'Add Workout',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddWorkoutScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20), // Spacing between buttons

                // Set Fitness Goals Button
                _buildElevatedButton(
                  context,
                  label: 'Set Fitness Goals',
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoalsScreen(),
                      ),
                    );
                    if (result != null && result is String) {
                      setState(() {
                        _fitnessGoal = result;
                      });
                    }
                  },
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        backgroundColor: Colors.white, // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        elevation: 5, // Button shadow
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black, // Text color
        ),
      ),
    );
  }
}
