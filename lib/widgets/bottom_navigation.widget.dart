import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  final void Function(int) onTabChange;

  const BottomNavigationWidget({Key? key, required this.onTabChange}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  void onTap(int currentTab) {
    _selectedIndex = currentTab;
    widget.onTabChange(currentTab);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.accessibility_new_outlined),
          label: 'Ćwiczenia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined),
          label: 'Powiadomienia',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: onTap,
    );
  }
}

