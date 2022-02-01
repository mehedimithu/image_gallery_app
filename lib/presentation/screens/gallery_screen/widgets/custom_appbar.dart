import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/constants/colors.dart';

PreferredSize customAppBar(
    {required String title,
    String? subTitle,
    String? imgIcon,
    GestureTapCallback? onTap}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(86.h),
    child: Container(
      height: 120.h,
      decoration: const BoxDecoration(
        color: TaskAppColors.kPrimaryColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35.0),
            bottomLeft: Radius.circular(35.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: TaskAppColors.kWhiteColor,
                size: 20,
              ),
            ),*/
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: TaskAppColors.kWhiteColor),
            ),
          ],
        ),
      ),
    ),
  );
}
