import 'package:fizjo/widgets/bottom_navigation.widget.dart';
import 'package:fizjo/screens/exercises.screen.dart';
import 'package:fizjo/screens/notifications.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

import 'env.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // Provider.of<CurrentUserProvider>(context, listen: false).setLoggedInUserDataIfLoggedIn();
    });
  }

  void onTabChange(int index) {
    _currentIndex = index;
  }

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '5 Minutes for spine',
      theme: ThemeData(
          primarySwatch: themeColor,
          fontFamily: 'Lato'
      ),
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          bottomNavigationBar: BottomNavigationWidget(
            onTabChange: onTabChange,
            pageController: _pageController,
            currentPage: _currentIndex,
          ),
          body: UpgradeAlert(
            child: SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: const <Widget>[
                  ExercisesScreen(),
                  NotificationsScreen(),
                  // const MoreScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}