import 'package:fizjo/providers/current-exercise.provider.dart';
import 'package:fizjo/providers/current-notification.provider.dart';
import 'package:fizjo/providers/exercises.provider.dart';
import 'package:fizjo/providers/notifications.provider.dart';
import 'package:fizjo/widgets/bottom_navigation.widget.dart';
import 'package:fizjo/screens/exercises.screen.dart';
import 'package:fizjo/screens/notifications.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'env.dart';
import 'helpers/notification_permission.dart';
import 'models/notification.dart';

Future<void> main() async {
  Hive
    ..initFlutter()
    ..registerAdapter(NotificationConfigAdapter());

  WidgetsFlutterBinding.ensureInitialized();
  configureLocalNotificationsInstance();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CurrentExerciseProvider()),
          ChangeNotifierProvider(create: (_) => NotificationsProvider()),
          ChangeNotifierProvider(create: (_) => ExercisesProvider()),
          ChangeNotifierProvider(create: (_) => CurrentNotificationProvider()),
        ],
        child: const MyApp(),
      ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _selectedPage = const ExercisesScreen();
  Map<int, Widget> mapOfTabPages = {};

  @override
  void initState() {
    super.initState();
    mapOfTabPages[0] = const ExercisesScreen();
    mapOfTabPages[1] = const NotificationsScreen();
  }

  void onTabChange(int index) {
    setState(() {
      _selectedPage = mapOfTabPages[index] ?? Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '5 Minutes for spine',
      theme: ThemeData(
        primarySwatch: themeColor
          ,
        fontFamily: 'Lato'
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        bottomNavigationBar: BottomNavigationWidget(onTabChange: onTabChange),
        body: _selectedPage
      ),
    );
  }
}