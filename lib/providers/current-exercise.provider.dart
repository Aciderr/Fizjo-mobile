import 'package:flutter/widgets.dart';

class CurrentExerciseProvider extends ChangeNotifier {
  int currentExercise = 1;

  void setCurrentExercise(double index) {
    currentExercise = index.toInt();
    notifyListeners();
  }
}