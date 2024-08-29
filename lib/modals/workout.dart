class Workout {
  final String type;
  final int duration; // in minutes
  final int caloriesBurned;
  final DateTime date;

  Workout({
    required this.type,
    required this.duration,
    required this.caloriesBurned,
    required this.date,
  });
}
