import 'package:flutter/material.dart';
import '../modals/workout.dart';
import 'package:intl/intl.dart';

class WorkoutList extends StatelessWidget {
  final List<Workout> workouts;
  final void Function(Workout) onDelete; // Callback function for delete action

  WorkoutList({required this.workouts, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return workouts.isEmpty
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFF22A6A0),
            ),
            child: const Icon(Icons.show_chart, color: Colors.white, size: 50),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'You don\'t have any progress reports yet.',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 05),
        Text(
          'Add some workouts.',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF22A6A0),
          ),
        ),
      ],
    )
        : ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return Card(
          color: Colors.red.shade500,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: Icon(Icons.fitness_center, color: Colors.white),
            title: Text(
              workout.type,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${workout.duration} min - ${workout.caloriesBurned} kcal',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd').format(workout.date),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    onDelete(workout); // Call the delete function
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
