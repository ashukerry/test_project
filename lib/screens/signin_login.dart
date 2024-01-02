import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/screens/home.dart';
import 'package:test_project/utils/colors.dart';

class SignInSingUp extends StatelessWidget {
  const SignInSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/splash_image.png",
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "Manage your\ndaily tasks",
                style: GoogleFonts.openSans(
                    color: AppColor.primaryTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Team and Project management with  solution providing App",
                maxLines: 2,
                softWrap: true,
                style: GoogleFonts.nokora(
                    color: AppColor.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 3),
                          child: Text(
                            "Get",
                            style: GoogleFonts.openSans(
                                color: AppColor.primaryTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Started",
                      style: GoogleFonts.openSans(
                          color: AppColor.primaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
