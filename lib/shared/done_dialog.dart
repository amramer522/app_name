import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/fonts.gen.dart';

showDoneDialog(context) {
  showDialog(
      builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 30.w),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 80.sp,
                ),
              ),
              Text("Done",
                  style: TextStyle(
                      fontSize: 28.sp,
                      height: 1.1.h,
                      decoration: TextDecoration.none,
                      fontFamily: FontFamily.extraBold,
                      color: Colors.white)),
              Text("Proceed to your cart",
                  style: TextStyle(
                      fontSize: 16.sp,
                      decoration: TextDecoration.none,
                      fontFamily: FontFamily.regular,
                      color: Colors.white)),
            ],
          ),
      context: context);
}
