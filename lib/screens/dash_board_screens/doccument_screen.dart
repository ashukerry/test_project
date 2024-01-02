import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_project/model/app_models.dart';
import 'package:test_project/screens/calendar.dart';
import 'package:test_project/utils/colors.dart';
import 'package:test_project/utils/widgets.dart';
import 'dart:math' as math;

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              // Diagonal direction from top-left to bottom-right
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

              // Seamless transition with a slight rotation
              transform: GradientRotation(math.pi / 450),

              // Focused transition in the top 20% of the screen
              stops: [0.0, 0.2, 0.8, 1.0],

              // Colors with a subtle fade
              colors: [
                AppColor.primaryBackgroundColor_7,
                AppColor.primaryBackgroundColor_6,
                AppColor.primaryBackgroundColor_1,
                AppColor
                    .primaryBackgroundColor_1, // Repeated for a more gradual fade
              ],
            ),
          ),
          child: Stack(
            children: [
              // Your background widget or gradient here
              // ...

              // CustomPaint for the contours
              Positioned(
                top: -350,
                right: -100,
                child: CustomPaint(
                  painter: CustomContourPainter(),
                  size: MediaQuery.of(context)
                      .size, // Ensure it covers the full screen
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CustomAppBar(
                        leading: CustomWhitePillar(),
                        trailing: const CircularImageWithPadding(
                          imageAssetPath: "assets/guy.jpeg",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Hi Ghulam",
                        style: TextStyle(
                            color: AppColor.textWhite,
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "6 Tasks are pending",
                        style: TextStyle(
                            color: AppColor.textBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CardWidget(
                      imageOneLink: "assets/guy.jpeg",
                      imageTwoLink: "assets/guy.jpeg",
                      titleText: "Mobile App Design",
                      subtitleText: "Mike and Anita",
                      timeText: "Now",
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monthly Review",
                            style: TextStyle(
                                color: AppColor.textWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          CircleIconWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalendarScreen()),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 270,
                          child: MasonryGridView.builder(
                            itemCount: items.length,
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 20),
                              child: RoundedCornerGridItem(
                                text1: items[index].text1,
                                text2: items[index].text2,
                                height: items[index]
                                    .height, // Use provided heights for item sizes
                                width: items[index]
                                    .width, // Use provided widths for item sizes
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

              // Other widgets in your stack
              // ...
            ],
          )),
    ));
  }
}
