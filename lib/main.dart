import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/calendar_privider.dart';

import 'constant/colors.dart';
import 'screens/signin_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CalendarProvider>(
            create: (_) => CalendarProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              scaffoldBackgroundColor: AppColors.backGroundColor,
              useMaterial3: true,
            ),
            home: const SignInSingUp()));
  }
}
