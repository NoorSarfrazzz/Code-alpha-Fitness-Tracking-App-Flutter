import 'package:flutter/foundation.dart';

import '../modals/workout.dart';


class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  List<Workout> get workouts => _workouts;

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }
}
