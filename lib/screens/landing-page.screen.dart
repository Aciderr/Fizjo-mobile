import 'package:fizjo/providers/current-user.provider.dart';
import 'package:fizjo/screens/categories.screen.dart';
import 'package:fizjo/screens/my-day.screen.dart';
import 'package:fizjo/screens/notifications.screen.dart';
import 'package:fizjo/widgets/bottom_navigation.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  int _currentIndex = 0;
  final _pages = [
    const MyDayScreen(),
    const CategoriesScreen(),
    const NotificationsScreen()
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final isUserLoggedIn = Provider.of<CurrentUserProvider>(context, listen: false).isUserLoggedIn();
      if (isUserLoggedIn) {
        await Provider.of<CurrentUserProvider>(context, listen: false).fetchUser();
      }
    });
  }

  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Colors.transparent,),
      bottomNavigationBar: BottomNavigationWidget(
        onTabChange: onTabChange,
        currentPage: _currentIndex,
      ),
      body: UpgradeAlert(
        child: SizedBox.expand(
          child: _pages.elementAt(_currentIndex),
        ),
      ),
    );
  }
}

