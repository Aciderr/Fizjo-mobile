import 'package:fizjo/providers/current-user.provider.dart';
import 'package:fizjo/screens/landing-page.screen.dart';
import 'package:fizjo/screens/login.screen.dart';
import 'package:fizjo/screens/registration.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'env.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    String initialRoute() {
      return Provider.of<CurrentUserProvider>(context).isUserLoggedIn() ? '' : '/login';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '5 Minutes for spine',
      initialRoute: initialRoute(),
      routes: {
        '/': (context) => const LandingPageScreen(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen()
      },
      theme: ThemeData(
          primarySwatch: themeColor,
          fontFamily: 'Lato'
      ),
    );
  }
}