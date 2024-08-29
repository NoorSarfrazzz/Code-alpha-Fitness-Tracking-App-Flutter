import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/workout_list.dart';
import '../widgets/workout_provider.dart';

class ProgressScreen extends StatefulWidget {
  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
          return WorkoutList(
            workouts: workoutProvider.workouts,
            onDelete: (workout) {
              setState(() {
                workoutProvider.workouts.remove(workout);
              });
            },
          )
          ;
        },
      ),
    );
  }
}
