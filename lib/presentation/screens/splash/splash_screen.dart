import 'package:flutter/material.dart';
import 'package:task_app/core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);



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
