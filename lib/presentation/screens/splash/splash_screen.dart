import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_app/core/core.dart';
import 'package:task_app/presentation/presentation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, AppRoutes.galleryScreenRoute);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          color: TaskAppColors.kPrimaryColor,
          child: const Padding(
            padding: EdgeInsets.all(100),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Interview Task',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: TaskAppColors.kWhiteColor),
                    ),
                    TextSpan(text: ''),
                    TextSpan(
                      text: '  implemented by ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: TaskAppColors.kYellowColorAccent),
                    ),
                    TextSpan(
                      text: 'Md. Mehedi Hasan',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: TaskAppColors.kWhiteColor),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
