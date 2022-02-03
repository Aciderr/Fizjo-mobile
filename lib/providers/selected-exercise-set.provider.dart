import 'package:fizjo/models/exercise-set-detailed.dart';
import 'package:fizjo/services/exercises_sets_api.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SelectedExerciseSetProvider extends ChangeNotifier {
  String? selectedExerciseSet;
  ExerciseSetDetailed? exerciseSet;

  void setExercisesSets(String exerciseSetId) async {
    selectedExerciseSet = exerciseSetId;
    final ExercisesSetsApi exerciseSetsService = Get.find<ExercisesSetsApi>();
    exerciseSet = await exerciseSetsService.fetchExerciseSet(exerciseSetId);
    notifyListeners();
  }
}