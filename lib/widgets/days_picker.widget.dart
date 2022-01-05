import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notification_picker.widget.dart';

class DaysPickerWidget extends StatefulWidget {
  const DaysPickerWidget({ Key? key }) : super(key: key);

  @override
  State<DaysPickerWidget> createState() => _DaysPickerState();
}

class _DaysPickerState extends State<DaysPickerWidget> {
  List<Day> days = [
    Day(DateTime.monday, 'P'),
    Day(DateTime.tuesday, 'W'),
    Day(DateTime.wednesday, 'Ś'),
    Day(DateTime.thursday, 'C'),
    Day(DateTime.friday, 'P'),
    Day(DateTime.saturday, 'S'),
    Day(DateTime.sunday, 'N'),
  ];

  @override
  Widget build(BuildContext context) {
    var currentNotificationProvider = Provider.of<CurrentNotificationProvider>(context, listen: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        return SizedBox(
          height: 30,
          width: 30,
          child: GestureDetector(
            key: Key('day-picker-${day.label}'),
            onTap: () {
              currentNotificationProvider.toggleDayClick(day.value);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: currentNotificationProvider.selectIsDayInCurrentDays(day.value) ? Theme.of(context).primaryColor : Colors.transparent,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Material(
                      child: Text(
                        day.label,
                        style: TextStyle(
                            fontWeight: currentNotificationProvider.selectIsDayInCurrentDays(day.value) ? FontWeight.w600 : FontWeight.w400
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

}