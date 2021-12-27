import 'package:flutter/widgets.dart';

class CurrentNotificationProvider extends ChangeNotifier {
  final List<int> initialDays = [
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday
  ];

  late List<int> currentDays;

  CurrentNotificationProvider() {
    currentDays = [...initialDays];
  }

  bool isDayInCurrentDays(int day) {
    return currentDays.contains(day);
  }

  void _addDayToCurrentDays(int day) {
    if (currentDays.contains(day) == false) {
      currentDays.add(day);
    }
  }

  void _removeDayFromCurrentDays(int day) {
    if (currentDays.contains(day)) {
      currentDays.remove(day);
    }
  }

  void resetDays() {
    currentDays = [...initialDays];
  }

  void onDayClick(int day) {
    if (isDayInCurrentDays(day)) {
      _removeDayFromCurrentDays(day);
    } else {
      _addDayToCurrentDays(day);
    }
    notifyListeners();
  }
}