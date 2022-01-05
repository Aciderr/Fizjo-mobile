import 'package:fizjo/helpers/notification_permission.dart';
import 'package:fizjo/models/notification.dart';
import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:fizjo/widgets/notification_picker.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<String> notificationsTimes = [];
  late String currentTime;
  List<Day> days = [
    Day(DateTime.monday, 'P'),
    Day(DateTime.tuesday, 'W'),
    Day(DateTime.wednesday, 'Ś'),
    Day(DateTime.thursday, 'C'),
    Day(DateTime.friday, 'P'),
    Day(DateTime.saturday, 'S'),
    Day(DateTime.sunday, 'N'),
  ];

  bool _isDaySelected(int day, List<int> selectedDays) {
    return selectedDays.contains(day);
  }

  void _onNotificationRemove(NotificationConfig notificationConfig) {
    NotificationsProvider notificationsProvider = Provider.of<NotificationsProvider>(context, listen: false);
    notificationsProvider.removeNotification(notificationConfig);
  }

  void _showDatePicker(ctx) async {
    currentTime = '07:00';
    var currentNotificationProvider = Provider.of<CurrentNotificationProvider>(context, listen: false);
    currentNotificationProvider.resetDays();

    var permissionsGranted = await isNotificationPermissionGranted();
    if (!permissionsGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Odblokuj powiadomienia aplikacji w ustawieniach telefonu.'),
      ));
      return;
    }

    showCupertinoModalPopup(
        context: ctx,
        builder: (ctx) => const NotificationPickerWidget()
    );
  }

  void _showRestoreDialog(BuildContext context, NotificationConfig notificationsConfig) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Text('Usunięto powiadomienie o ${notificationsConfig.time}'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsProvider>(builder: (_, notificationsProvider, child) {
      return Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: ListView.builder(
                itemCount: notificationsProvider.notificationsConfigs.length,
                itemBuilder: (context, index) {
                final notificationsConfig = notificationsProvider.notificationsConfigs[index];

                return Dismissible(
                  key: Key(notificationsConfig.time),
                  onDismissed: (direction) {
                    _onNotificationRemove(notificationsConfig);
                    _showRestoreDialog(context, notificationsConfig);
                  },
                  background: Container(color: Colors.redAccent),
                  child: ListTile(
                    key: const Key('notification-entry'),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(notificationsConfig.time),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: days.map((day) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                day.label,
                                key: Key('selected_day_${day.label}'),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _isDaySelected(day.value, notificationsConfig.days) ? Theme.of(context).primaryColor : Colors.grey,
                                    fontWeight: _isDaySelected(day.value, notificationsConfig.days) ? FontWeight.w700 : FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _onNotificationRemove(notificationsConfig);
                        _showRestoreDialog(context, notificationsConfig);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                    ),
                  ),
                );}
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 32,
            right: 32,
            child: FloatingActionButton(
              key: const Key('add-notification-button'),
              onPressed: () => _showDatePicker(context),
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          )
        ],
      );
    });
  }
}