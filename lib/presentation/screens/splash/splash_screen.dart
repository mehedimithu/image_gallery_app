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
          color: TaskAppColors.kNeutralColor,
          child: const Padding(
            padding: EdgeInsets.all(100),
            child: Center(
                child: Text(
              'Task app',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 37.0, color: TaskAppColors.kBlack300Color),
            )),
          )),
    );
  }
}
