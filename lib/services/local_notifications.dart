import 'package:fizjo/models/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static const String notificationTitle = 'Czas na ćwiczenia';
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> scheduleNotifications(NotificationConfig item) async {
    for(var i = 0; i < item.days.length; i++ ) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          item.notificationIds.elementAt(i),
          notificationTitle,
          null,
          _nextInstanceOfDateTime(item.days.elementAt(i), item.time),
          const NotificationDetails(
            android: AndroidNotificationDetails(
                'weekly notification channel id',
                'weekly notification channel name',
                channelDescription: 'weekly notification description'
            ),
          ),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
      );
    }
  }

  tz.TZDateTime _nextInstanceOfDateTime(int day, String time) {
    tz.TZDateTime dateWithProperDay = _generateSevenPreviousDateTimes().firstWhere((date) => date.weekday == day);

    int hour = getHourFromTime(time);
    int minute = getMinuteFromTime(time);
    return tz.TZDateTime(tz.local, dateWithProperDay.year, dateWithProperDay.month, dateWithProperDay.day, hour, minute);
  }

  int getHourFromTime(String time) {
    return int.parse(time.split(':')[0]);
  }

  int getMinuteFromTime(String time) {
    return int.parse(time.split(':')[1]);
  }

  List<tz.TZDateTime> _generateSevenPreviousDateTimes() {
    List<tz.TZDateTime> dates = [];
    for(var i = 1; i <= 7; i++ ) {
      tz.TZDateTime generatedDate = tz.TZDateTime.now(tz.local).subtract(Duration(days: i));
      dates.add(generatedDate);
    }
    return dates;
  }
}