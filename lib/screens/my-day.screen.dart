import 'package:fizjo/widgets/header.widget.dart';
import 'package:fizjo/widgets/permissions.widget.dart';

import 'package:fizjo/providers/current-user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDayScreen extends StatefulWidget {
  const MyDayScreen({Key? key}) : super(key: key);

  @override
  State<MyDayScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<MyDayScreen> {
  String? _token;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(builder: (_, currentUserProvider, child) {
      final user = currentUserProvider.user;
      if (user == null) {
        return Container();
      }

      return Column(children: [
        Header(title: 'Hello!', customLeftWidget: GestureDetector(
          onTap: () {
            currentUserProvider.logOut();
            Navigator.pushNamed(context, '/login');
          },
          child: const Icon(Icons.person_outline, color: Colors.black),
        ),),
        Column(
            children: user.dateTimes.map((dateTime) => Row(children: [
              Text(dateTime.time.toString())
            ],)).toList()
        )
      ],);
    });
  }
}

