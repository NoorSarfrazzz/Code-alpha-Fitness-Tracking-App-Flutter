import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/workout.dart';
import '../widgets/workout_provider.dart';

class AddWorkoutScreen extends StatefulWidget {
  @override
  _AddWorkoutScreenState createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _exerciseType = '';
  int _duration = 0;
  int _caloriesBurned = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF22A6A0),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5), // Add left space
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: Text(
          'Add Workout',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Exercise Type',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,width: 1),
                  ),
                   
                ),
                onSaved: (value) {
                  _exerciseType = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an exercise type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Duration (minutes)',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,width: 1),
                  ),
                   
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _duration = int.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the duration';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Calories Burned',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,width: 1),
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _caloriesBurned = int.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter calories burned';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Workout workout = Workout(
                        type: _exerciseType,
                        duration: _duration,
                        caloriesBurned: _caloriesBurned,
                        date: DateTime.now(),
                      );

                      Provider.of<WorkoutProvider>(context, listen: false).addWorkout(workout);

                      Navigator.pop(context);
                    }
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
                    'Save Workout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
