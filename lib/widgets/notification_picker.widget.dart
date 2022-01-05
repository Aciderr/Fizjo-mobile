import 'package:fizjo/helpers/id_generator.dart';
import 'package:fizjo/helpers/notification_permission.dart';
import 'package:fizjo/models/notification.dart';
import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:fizjo/widgets/days_picker.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Day {
  late int value;
  late String label;

  Day(this.value, this.label);
}

class NotificationPickerWidget extends StatefulWidget {
  const NotificationPickerWidget({ Key? key }) : super(key: key);

  @override
  State<NotificationPickerWidget> createState() => _NotificationPickerState();
}

class _NotificationPickerState extends State<NotificationPickerWidget> {
  DateTime startDate = DateTime.utc(2020, 10, 10, 07, 00);
  String currentTime = '07:00';
  List<String> notificationsTimes = [];

  void _onDateTimeChanged(DateTime dateTime) {
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String hourString = hour.toString();
    String minuteString = minute.toString();
    String extendedHour = hour < 10 ? '0$hourString' : hourString;
    String extendedMinute = minute < 10 ? '0$minuteString' : minuteString;
    String time = '$extendedHour:$extendedMinute';
    currentTime = time;
  }

  void _saveNotification(dynamic context) async {
    var notificationsProvider = Provider.of<NotificationsProvider>(context, listen: false);
    var currentNotificationProvider = Provider.of<CurrentNotificationProvider>(context, listen: false);

    var currentDays = currentNotificationProvider.selectCurrentDays();
    if (currentDays.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    var permissionsGranted = await isNotificationPermissionGranted();
    if (permissionsGranted) {
      notificationsProvider.addNotification(NotificationConfig(time: currentTime, days: currentDays, id: uid()));
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CupertinoButton(
                    child: const Text('ANULUJ', style: TextStyle(letterSpacing: 1),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
              ),
              CupertinoButton(
                child: const Text('DODAJ', style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.w600),),
                onPressed: () {
                  _saveNotification(context);
                },
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30, left: 16, right: 16),
            child: DaysPickerWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              height: 140,
              child: CupertinoDatePicker(
                  initialDateTime: startDate,
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: _onDateTimeChanged
              ),
            )
          ),
        ],
      ),
    );
  }
}