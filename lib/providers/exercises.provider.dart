import 'package:fizjo/models/exercise.dart';
import 'package:flutter/widgets.dart';
import 'package:fizjo/services/exercises_api.dart';
import 'package:get/get.dart';

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

    final ExercisesApi exerciseService = Get.find<ExercisesApi>();
    List<Exercise> exercisesResponse = await exerciseService.fetchExercises();
    setExercises(exercisesResponse);
    return exercisesResponse;
  }
}