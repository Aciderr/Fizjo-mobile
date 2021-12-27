import 'package:fizjo/models/exercise.dart';
import 'package:flutter/widgets.dart';
import 'package:fizjo/services/exercises_api.dart';

class ExercisesProvider extends ChangeNotifier {
  List<Exercise> exercises = [];

  void setExercises(List<Exercise> value) {
    exercises = value;
    notifyListeners();
  }

  Future<List<Exercise>> fetchExercises() async {
    if (exercises.isNotEmpty) {
      return Future.value(exercises);
    }

    List<Exercise> exercisesResponse = await ExercisesApi.fetchExercises();
    setExercises(exercisesResponse);
    return exercisesResponse;
  }
}