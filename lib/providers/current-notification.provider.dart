import 'package:flutter/widgets.dart';

final List<int> initialDays = [
  DateTime.monday,
  DateTime.tuesday,
  DateTime.wednesday,
  DateTime.thursday,
  DateTime.friday
];

class CurrentNotificationProvider extends ChangeNotifier {
  late List<int> currentDays;

  CurrentNotificationProvider() {
    currentDays = [...initialDays];
  }

  bool selectIsDayInCurrentDays(int day) {
    return currentDays.contains(day);
  }

  void resetDays() {
    currentDays = [...initialDays];
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
    if (currentDays.contains(day) == false) {
      currentDays.add(day);
    }
  }

  void removeDayFromCurrentDays(int day) {
    if (currentDays.contains(day)) {
      currentDays.remove(day);
    }
  }
}