import 'package:flutter/material.dart';

import 'package:test_project/model/app_models.dart';
import 'package:test_project/screens/dash_board_screens/doccument_screen.dart';

import 'dart:math' as math;

import 'package:test_project/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final VoidCallback onTap;

  CustomBottomNavigationBarItem({
    required this.iconData,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(iconData, color: color),
    );
  }
}

// Usage:

class _MyHomePageState extends State<MyHomePage> {
  CustomNavigationList _customNavigationLis = CustomNavigationList();
  List<Widget> screens = [
    Center(
        child: Container(
      child: const Text("Home"),
    )),
    const DocumentScreen(),
    Center(
        child: Container(
      child: const Text("Person"),
    )),
    Center(
        child: Container(
      child: const Text("Notification"),
    ))
  ];
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryBackgroundColor_1,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: AppColor.lightBlue, // Color for selected items
          unselectedItemColor:
              AppColor.creamWhite, // Color for unselected items
          elevation: 0,
          backgroundColor: AppColor.primaryBackgroundColor_1,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: _customNavigationLis.customNabarItems([
            CustomNavigationListModel(
                icon: const Icon(Icons.home_outlined), onTap: () {}),
            CustomNavigationListModel(
                icon: const Icon(Icons.description_outlined), onTap: () {}),
            CustomNavigationListModel(
                icon: const Icon(Icons.person_outlined), onTap: () {}),
            CustomNavigationListModel(
                icon: const Icon(Icons.notifications_outlined), onTap: () {})
          ]),
        ),
        body: screens[_selectedIndex]);
  }
}
