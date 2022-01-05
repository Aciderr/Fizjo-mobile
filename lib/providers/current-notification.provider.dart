import 'package:flutter/widgets.dart';

final List<int> initialDays = [
  DateTime.monday,
  DateTime.tuesday,
  DateTime.wednesday,
  DateTime.thursday,
  DateTime.friday
];

class CurrentNotificationProvider extends ChangeNotifier {
  late List<int> _currentDays;

  CurrentNotificationProvider() {
    _currentDays = [...initialDays];
  }

  List<int> selectCurrentDays() {
    return _currentDays;
  }

  bool selectIsDayInCurrentDays(int day) {
    return _currentDays.contains(day);
  }

  void resetDays() {
    _currentDays = [...initialDays];
  }

  void toggleDayClick(int day) {
    if (selectIsDayInCurrentDays(day)) {
      removeDayFromCurrentDays(day);
    } else {
      addDayToCurrentDays(day);
    }
    notifyListeners();
  }

  void addDayToCurrentDays(int day) {
    if (_currentDays.contains(day) == false) {
      _currentDays.add(day);
    }
  }

  void removeDayFromCurrentDays(int day) {
    if (_currentDays.contains(day)) {
      _currentDays.remove(day);
    }
  }
}