import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/model/app_models.dart';
import 'package:test_project/utils/colors.dart';

class CalendarProvider extends ChangeNotifier {
  // int selectedYear = 2024;
  int selectedMonth = 1;
  List<DateModel> daysAndDates = [];

  DateTime selectedDate = DateTime.now();

  void goToPreviousMonth() {
    selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
    selectedMonth = selectedDate.month; // Update selectedMonth
    generateMonthDays();
    notifyListeners();
  }

  void goToNextMonth() {
    selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
    selectedMonth = selectedDate.month; // Update selectedMonth
    generateMonthDays();
    notifyListeners();
  }

  upDateMonth({required int monthNumber, bool isForward = true}) {
    if (isForward) {
      if (selectedMonth + 1 == 12 || selectedMonth + 1 < 12) {
        selectedMonth + 1;
        notifyListeners();
      } else if (selectedMonth + 1 > 12) {
        selectedMonth = 12;
        notifyListeners();
      }
    } else {
      if (selectedMonth - 1 == 0 || selectedMonth - 1 < 1) {
        selectedMonth;
        notifyListeners();
      } else {
        selectedMonth - 1;
        notifyListeners();
      }
    }

    notifyListeners();
  }

  generateMonthDays() {
    DateTime nowDate = DateTime.now();
    DateFormat todayDay = DateFormat('E');
    DateFormat todayDate = DateFormat('d');
    String formattedDate = todayDate.format(selectedDate);

    DateTime firstDayOfMonth = DateTime(selectedDate.year, selectedMonth);
    firstDayOfMonth =
        firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));
    DateTime lastDayOfMonth = DateTime(selectedDate.year, selectedMonth + 1, 0);

    daysAndDates.clear();

    for (int i = 0; i < lastDayOfMonth.day; i++) {
      DateTime date = firstDayOfMonth.add(Duration(days: i));
      DateFormat dateFormat = DateFormat.E('en_US'); // Adjust locale if needed
      String dayOfWeek = dateFormat.format(date);
      String dateNumber = date.day.toString();

      daysAndDates.add(DateModel(
          text1: dateNumber,
          text2: dayOfWeek,
          textColor: formattedDate == dateNumber &&
                  selectedMonth == nowDate.month &&
                  selectedDate.year == nowDate.year
              ? AppColor.white
              : AppColor.primaryBackgroundColor_1,
          containerColor: formattedDate == dateNumber &&
                  selectedMonth == nowDate.month &&
                  selectedDate.year == nowDate.year
              ? AppColor.primaryBackgroundColor_1
              : AppColor.white));
    }

    notifyListeners();
  }
}
