import 'package:flutter/material.dart';
import 'package:test_project/model/app_models.dart';
import 'package:test_project/utils/colors.dart';

class AdaptiveItemList extends StatelessWidget {
  final List<GridItemModel> items;
  final bool isGrid;

  const AdaptiveItemList({
    Key? key,
    required this.items,
    required this.isGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: isGrid
          ? GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250, // Adjust maximum item width
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return RoundedCornerGridItem(
                  text1: items[index].text1,
                  text2: items[index].text2,
                  height: items[index].height,
                  width: items[index].width,
                );
              },
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedCornerGridItem(
                      text1: items[index].text1,
                      text2: items[index].text2,
                      height: items[index].height,
                      width: items[index].width,
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class RoundedCornerGridItem extends StatelessWidget {
  final String text1;
  final String text2;
  final double height;
  final double width;

  const RoundedCornerGridItem({
    super.key,
    required this.text1,
    required this.text2,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColor.cardColor, // Adjust background color as needed
        borderRadius: BorderRadius.circular(20), // Adjust corner radius
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text1,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColor.textWhite)),
          const SizedBox(
            height: 2,
          ),
          Text(text2,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textBlue)),
        ],
      ),
    );
  }
}

class CircleIconWidget extends StatelessWidget {
  final VoidCallback onTap; // Define a parameter for the tap action

  const CircleIconWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Assign the provided tap action
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.lightBlue,
        ),
        child: const Icon(
          Icons.calendar_month_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CircularImageWithPadding extends StatelessWidget {
  final String imageAssetPath; // Change to a String for asset path
  final double padding = 5.0;

  const CircularImageWithPadding({
    Key? key,
    required this.imageAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(imageAssetPath), // Use AssetImage
      ),
    );
  }
}

class InterSectImages extends StatelessWidget {
  String imageOneLink;
  String imageTwoLink;
  InterSectImages(
      {super.key, required this.imageOneLink, required this.imageTwoLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Stack(
        children: [
          Positioned(
              child: CircularImageWithPadding(imageAssetPath: imageOneLink)),
          Positioned(
              right: 20,
              child: CircularImageWithPadding(
                imageAssetPath: imageTwoLink,
              ))
        ],
      ),
    );
  }
}

class CustomWhitePillar extends StatelessWidget {
  const CustomWhitePillar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            right: 40,
            top: 20,
            child: Container(
              height: 20,
              width: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
          ),
          Positioned(
            right: 30,
            top: 10,
            child: Container(
              height: 20,
              width: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
          ),
          Positioned(
            right: 20,
            top: 3,
            child: Container(
              height: 20,
              width: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContourPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xff5362d7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width * 0.6; // Adjust for desired size

    for (double i = 0.0; i < 1.0; i += 0.1) {
      final radius = maxRadius * (1 - i);

      // Ensure contours fit within bounds
      if (radius > center.dx || radius > center.dy) {
        continue;
      }

      canvas.drawCircle(center, radius, paint); // Draw circular contours
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomAppBar extends StatelessWidget {
  Widget leading;
  Widget trailing;
  CustomAppBar({super.key, required this.leading, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [leading, trailing],
    );
  }
}

class RowContainerListBuilder extends StatelessWidget {
  final List<dynamic> itemList; // Can hold any data type
  final Widget Function(BuildContext, int) itemBuilder;

  const RowContainerListBuilder({
    Key? key,
    required this.itemList,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, // Ensure horizontal scrolling
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        // Wrap each item with a Container
        return Container(
          margin: const EdgeInsets.all(10.0), // Adjust spacing as needed
          child: itemBuilder(context, index),
        );
      },
    );
  }
}

class DateContainer extends StatelessWidget {
  String text1;
  String text2;
  Color color;
  Color textColor;

  DateContainer(
      {super.key,
      required this.text1,
      required this.text2,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 60,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w800, fontSize: 20),
          ),
          Text(text2,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w400, fontSize: 12))
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final String imageOneLink;
  final String imageTwoLink;
  final String timeText;

  const CardWidget({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    required this.imageOneLink,
    required this.imageTwoLink,
    required this.timeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleText,
              style: const TextStyle(
                color: AppColor.textWhite,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              subtitleText,
              style: const TextStyle(
                color: AppColor.textBlue,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InterSectImages(
                  imageOneLink: imageOneLink,
                  imageTwoLink: imageTwoLink,
                ),
                Text(
                  timeText,
                  style:
                      const TextStyle(color: AppColor.textBlue, fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TimeCardRow extends StatelessWidget {
  final CardWidget cardWidget;
  final String startTimeText;
  final String endTimeText;

  const TimeCardRow({
    Key? key,
    required this.cardWidget,
    required this.startTimeText,
    required this.endTimeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(startTimeText),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text(endTimeText),
            ],
          ),
        ),
        Expanded(child: cardWidget),
      ],
    );
  }
}
