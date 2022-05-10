import 'package:fizjo/models/notification.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FizjoHive {
  FizjoHive() {
    var notificationConfigAdapter = NotificationConfigAdapter();
    var isInitialized = Hive.isAdapterRegistered(notificationConfigAdapter.typeId);

    if (!isInitialized) {
      Hive.initFlutter();
      Hive.registerAdapter(notificationConfigAdapter);
    }
  }
}
