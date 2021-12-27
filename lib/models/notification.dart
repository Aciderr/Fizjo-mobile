import 'package:hive/hive.dart';
part 'notification.g.dart';

@HiveType(typeId: 0)
class NotificationConfig {
  @HiveField(0)
  final String time;

  @HiveField(1)
  final List<int> days;

  @HiveField(2)
  final int id;

  @HiveField(3)
  List<int> notificationIds = [];

  NotificationConfig({ required this.time, required this.days, required this.id });
}