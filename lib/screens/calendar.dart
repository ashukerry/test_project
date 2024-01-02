import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/model/app_models.dart';
import 'package:test_project/providers/calendar_privider.dart';
import 'package:test_project/utils/colors.dart';
import 'package:test_project/utils/widgets.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarProvider calendarProvider;

  @override
  Widget build(BuildContext context) {
    calendarProvider = context.watch<CalendarProvider>();
    calendarProvider.generateMonthDays();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColor.secondaryWhite_1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomAppBar(
                      leading: GestureDetector(
                        onTap: () {
                          // print(formattedDaysOfWeek);
                          // Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColor.creamWhite,
                              border: Border.all(
                                color: AppColor.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                              child: Icon(
                            Icons.arrow_back,
                            color: AppColor.primaryTextColor,
                            size: 30,
                          )),
                        ),
                      ),
                      trailing: const CircularImageWithPadding(
                        imageAssetPath: "assets/guy.jpeg",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              calendarProvider.goToPreviousMonth();
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_back),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  DateFormat.MMM().format(
                                    DateTime(
                                        calendarProvider.selectedDate.year,
                                        calendarProvider.selectedDate.month -
                                            1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          DateFormat.MMMM()
                              .format(calendarProvider.selectedDate),
                          style: const TextStyle(
                              color: AppColor.primaryTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              calendarProvider.goToNextMonth();
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                Text(DateFormat.MMM().format(DateTime(
                                    calendarProvider.selectedDate.year,
                                    calendarProvider.selectedDate.month + 1))),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: DateListBuilder(
                            datedata: calendarProvider.daysAndDates)),
                    height: 80,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 20, bottom: 10),
                    child: Text(
                      "Ongoing",
                      style: TextStyle(
                          color: AppColor.primaryTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  AppointMentListBuilder(
                    AppiontmentList: appiontmentList,
                  )

                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DateListBuilder extends StatelessWidget {
  final List<DateModel> datedata;

  const DateListBuilder({
    Key? key,
    required this.datedata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: datedata.length, // Limit to four items
        padding: EdgeInsets.zero,
        shrinkWrap: true, // Ensure horizontal scrolling only

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DateContainer(
              text1: datedata[index].text1,
              text2: datedata[index].text2,
              color: datedata[index].containerColor,
              textColor: datedata[index].textColor,
            ),
          );
        },
      ),
    );
  }
}

class AppointMentListBuilder extends StatelessWidget {
  final List<AppointmentModel> AppiontmentList;

  const AppointMentListBuilder({
    Key? key,
    required this.AppiontmentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: datedata.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true, // Ensure horizontal scrolling only

        itemBuilder: (context, index) {
          return appiontmentList[index].endTime == ""
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(appiontmentList[index].startTime),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      100), // Add rounded corners for visual clarity
                                ),
                                child: Center(
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          100), // Rounded corners for consistency
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 3,
                                width: MediaQuery.of(context).size.width <=
                                        392.72
                                    ? MediaQuery.of(context).size.width * 0.77
                                    : MediaQuery.of(context).size.width * 0.8,
                                color: Colors.red,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TimeCardRow(
                    cardWidget: CardWidget(
                      imageOneLink: appiontmentList[index].imageOneLink,
                      imageTwoLink: appiontmentList[index].imageTwoLink,
                      titleText: appiontmentList[index].titleText,
                      subtitleText: appiontmentList[index].subtitleText,
                      timeText:
                          "${appiontmentList[index].startTime} - ${appiontmentList[index].endTime}",
                    ),
                    startTimeText: appiontmentList[index].startTime,
                    endTimeText: appiontmentList[index].endTime,
                  ),
                );
        },
      ),
    );
  }
}
