import 'package:fizjo/helpers/id_generator.dart';
import 'package:fizjo/models/notification.dart';
import 'package:fizjo/services/local_notifications.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class NotificationsProvider extends ChangeNotifier {
  static const notificationsTimesKey = 'notifications_v2';
  List<String> times = [];
  List<NotificationConfig> notificationsConfigs = [];
  late LocalNotifications localNotifications;

  NotificationsProvider() {
    localNotifications = LocalNotifications();
    _getNotifications();
  }

  void addNotification(NotificationConfig item) async {
    var box = await Hive.openBox<NotificationConfig>(notificationsTimesKey);
    int numberOfNotificationsIdsToGenerate = item.days.length;
    for(var i = 0; i < numberOfNotificationsIdsToGenerate; i++ ) {
      item.notificationIds.add(uid());
    }
    box.add(item);
    localNotifications.scheduleNotifications(item);
    _getNotifications();
  }

  void removeNotification(NotificationConfig item) async {
    var box = await Hive.openBox<NotificationConfig>(notificationsTimesKey);
    int index = notificationsConfigs.indexWhere((notificationConfig) => notificationConfig.id == item.id);
    item.notificationIds.forEach((notificationId) {
      localNotifications.flutterLocalNotificationsPlugin.cancel(notificationId);
    });
    box.deleteAt(index);
    _getNotifications();
  }

  void _getNotifications() async {
    var box = await Hive.openBox<NotificationConfig>(notificationsTimesKey);

    List<NotificationConfig> tempNotificationConfigs = [];
    for(var i = 0; i < box.length; i++ ) {
      NotificationConfig? notificationConfig = box.getAt(i);
      if (notificationConfig != null) {
        tempNotificationConfigs.add(notificationConfig);
      }
    }
    notificationsConfigs = tempNotificationConfigs;
    notifyListeners();
  }
}