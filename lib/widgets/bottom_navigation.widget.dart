import 'package:fizjo/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends StatefulWidget {
  final void Function(int) onTabChange;
  final int currentPage;

  const BottomNavigationWidget({
    Key? key,
    required this.onTabChange,
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
    return BottomNavigationBar(
      key: const Key('bottom-navigation-bar'),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/calendar.svg'),
          label: 'Plan dnia',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/exercise.svg'),
          label: 'Ćwiczenia',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/time.svg'),
          label: 'Powiadomienia',
        ),
      ],
      currentIndex: widget.currentPage,
      selectedItemColor: AppColors.black,
      onTap: (index) {
        onTap(index);
      },
    );
  }
}

