import 'package:flutter/material.dart';
import 'package:test_project/utils/colors.dart';

class CustomNavigationListModel {
  Icon icon;
  void Function()? onTap;

  CustomNavigationListModel({required this.icon, required this.onTap});
}

class CustomNavigationList {
  List<BottomNavigationBarItem> customNabarItems(
      List<CustomNavigationListModel> navList) {
    List<BottomNavigationBarItem> navBarItems = [];

    for (var navItem in navList) {
      navBarItems.add(
        BottomNavigationBarItem(
          icon: navItem.icon,
          label: "",
        ),
      );
    }

    return navBarItems;
  }
}

class GridItemModel {
  final String text1;
  final String text2;
  final double height;
  final double width;

  const GridItemModel({
    required this.text1,
    required this.text2,
    required this.height,
    required this.width,
  });
}

final List<GridItemModel> items = [
  const GridItemModel(
    text1: "22",
    text2: "Done",
    height: 120,
    width: 180,
  ),
  const GridItemModel(
    text1: "7",
    text2: "In progress",
    height: 100,
    width: 180,
  ),
  const GridItemModel(
    text1: "10",
    text2: "Ongoing",
    height: 100,
    width: 180,
  ),
  const GridItemModel(
    text1: "12",
    text2: "Waiting for Review",
    height: 120,
    width: 180,
  ),
];

class DateModel {
  final String text1;
  final String text2;
  final Color textColor;
  final Color containerColor;

  const DateModel(
      {required this.text1,
      required this.text2,
      required this.textColor,
      required this.containerColor});
}

final List<DateModel> datedata = [
  DateModel(
      text1: "12",
      text2: "Wed",
      textColor: AppColor.textWhite,
      containerColor: AppColor.primaryBackgroundColor_1),
  DateModel(
      text1: "13",
      text2: "Thus",
      textColor: AppColor.primaryBackgroundColor_1,
      containerColor: AppColor.white),
  const DateModel(
      text1: "14",
      text2: "Fri",
      textColor: AppColor.primaryBackgroundColor_1,
      containerColor: AppColor.white),
  const DateModel(
      text1: "15",
      text2: "Sat",
      textColor: AppColor.primaryBackgroundColor_1,
      containerColor: AppColor.white),
  const DateModel(
      text1: "17",
      text2: "Mon",
      textColor: AppColor.primaryBackgroundColor_1,
      containerColor: AppColor.white),
  const DateModel(
      text1: "18",
      text2: "Tues",
      textColor: AppColor.primaryBackgroundColor_1,
      containerColor: AppColor.white),
];

class AppointmentModel {
  final String startTime;
  final String endTime;
  final String titleText;
  final String subtitleText;
  final String imageOneLink;
  final String imageTwoLink;

  const AppointmentModel(
      {required this.startTime,
      required this.endTime,
      required this.titleText,
      required this.subtitleText,
      required this.imageOneLink,
      required this.imageTwoLink});
}

final List<AppointmentModel> appiontmentList = [
  AppointmentModel(
    startTime: "9 AM",
    endTime: "10 AM",
    titleText: "Mobile App Design",
    subtitleText: "Mike and anita",
    imageOneLink: "assets/lady.jpeg",
    imageTwoLink: "assets/lady.jpeg",
  ),
  AppointmentModel(
    startTime: "10 AM",
    endTime: "",
    titleText: "",
    subtitleText: "",
    imageOneLink: "",
    imageTwoLink: "",
  ),
  AppointmentModel(
    startTime: "11 AM",
    endTime: "12 AM",
    titleText: "Software Testing",
    subtitleText: "Anita and David",
    imageOneLink: "assets/lady.jpeg",
    imageTwoLink: "assets/lady.jpeg",
  ),
  AppointmentModel(
    startTime: "1 PM",
    endTime: "12 AM",
    titleText: "Web Development",
    subtitleText: "Mike and Anita",
    imageOneLink: "assets/lady.jpeg",
    imageTwoLink: "assets/lady.jpeg",
  ),
];
