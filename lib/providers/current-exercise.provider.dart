import 'package:flutter/widgets.dart';

class CurrentExerciseProvider extends ChangeNotifier {
  int currentExercise = 1;

  void changeCurrentExercise(double index) {
    currentExercise = index.toInt();
    notifyListeners();
  }
}