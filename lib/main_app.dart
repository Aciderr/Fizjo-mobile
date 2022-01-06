import 'package:fizjo/providers/current-user.provider.dart';
import 'package:fizjo/screens/more.screen.dart';
import 'package:fizjo/widgets/bottom_navigation.widget.dart';
import 'package:fizjo/screens/exercises.screen.dart';
import 'package:fizjo/screens/notifications.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'env.dart';

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
    mapOfTabPages[2] = const MoreScreen();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<CurrentUserProvider>(context, listen: false).setLoggedInUserDataIfLoggedIn();
    });
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