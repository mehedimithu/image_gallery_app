import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_app/core/core.dart';
import 'package:task_app/presentation/presentation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: Padding(
            padding: EdgeInsets.all(80.0.r),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'INTERVIEW TASK',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25.0.sp,
                          color: TaskAppColors.kWhiteColor),
                    ),
                    TextSpan(
                      text: ' Implemented by ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0.sp,
                          color: TaskAppColors.kYellowColorAccent),
                    ),
                    TextSpan(
                      text: 'Md.Mehedi Hasan',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0.sp,
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
