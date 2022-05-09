import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizjo/screens/categories.screen.dart';
import 'package:fizjo/screens/login.screen.dart';
import 'package:fizjo/widgets/bottom_navigation.widget.dart';
import 'package:fizjo/screens/notifications.screen.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'env.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _pages = [
    Container(),
    const CategoriesScreen(),
    const NotificationsScreen()
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // Provider.of<CurrentUserProvider>(context, listen: false).setLoggedInUserDataIfLoggedIn();
    });

    FirebaseAuth.instance.userChanges().listen((event) {
      print('user' + event.toString());
    });
    FirebaseAuth.instance.idTokenChanges().listen((event) {
      print("token" + event.toString());
    });
  }

  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '5 Minutes for spine',
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          bottomNavigationBar: BottomNavigationWidget(
            onTabChange: onTabChange,
            currentPage: _currentIndex,
          ),
          body: UpgradeAlert(
            child: SizedBox.expand(
              child: _pages.elementAt(_currentIndex),
            ),
          ),
        ),
        '/login': (context) => const LoginScreen()
      },
      theme: ThemeData(
          primarySwatch: themeColor,
          fontFamily: 'Lato'
      ),
    );
  }
}