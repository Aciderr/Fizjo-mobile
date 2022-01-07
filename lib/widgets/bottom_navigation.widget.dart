import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  final void Function(int) onTabChange;
  final PageController pageController;
  final int currentPage;

  const BottomNavigationWidget({
    Key? key,
    required this.onTabChange,
    required this.pageController,
    required this.currentPage
  }) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationWidget> {
  void onTap(int currentTab) {
    widget.onTabChange(currentTab);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      key: const Key('bottom-navigation-bar'),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      selectedIndex: widget.currentPage,
      onItemSelected: (index) {
        onTap(index);
        widget.pageController.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            activeColor: Colors.black,
            title: const Text('Ćwiczenia'),
            icon: const Icon(Icons.accessibility_new_outlined)
        ),
        BottomNavyBarItem(
            activeColor: Colors.black,
            title: const FittedBox( fit: BoxFit.scaleDown, child: Text( 'Powiadomienia', ), ),
            icon: const Icon(Icons.notifications_none_outlined)
        ),
        // BottomNavyBarItem(
        //     title: const Text('Więcej'),
        //     icon: const Icon(Icons.dehaze_outlined)
        // ),
      ],
    );
  }
}

