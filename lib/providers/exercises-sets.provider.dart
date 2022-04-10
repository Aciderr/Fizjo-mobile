import 'package:fizjo/models/exercise-set.dart';
import 'package:fizjo/services/exercises_sets_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExercisesSetsProvider extends ChangeNotifier {
  List<ExerciseSet> exercisesSets = [];

  void setExercisesSets(List<ExerciseSet> value) {
    exercisesSets = value;
    notifyListeners();
  }

  Future<List<ExerciseSet>> fetchExercisesSets() async {
    if (exercisesSets.isNotEmpty) {
      return exercisesSets;
    }

    final ExercisesSetsApi exerciseSetsService = Get.find<ExercisesSetsApi>();
    List<ExerciseSet> exercisesSetsResponse = await exerciseSetsService.fetchExercisesSets();
    setExercisesSets(exercisesSetsResponse);
    return exercisesSets;
  }
}