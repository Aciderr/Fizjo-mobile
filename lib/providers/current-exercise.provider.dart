import 'package:flutter/widgets.dart';

class CurrentExerciseProvider extends ChangeNotifier {
  int _currentExercise = 1;

  int selectCurrentExercise() {
    return _currentExercise;
  }

  void setCurrentExercise(double index) {
    _currentExercise = index.toInt();
    notifyListeners();
  }
}