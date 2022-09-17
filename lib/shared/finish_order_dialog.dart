import 'dart:async';

import '/../core/helper_methods.dart';
import '/../screens/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/fonts.gen.dart';

finishOrderDialog(context) {
  showDialog(
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            content: Container(
              height: 200.h,
              width: 350.w,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/finish_order.svg",
                      height: 111.h,
                      width: 111.h,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text("Congrats!",
                        style: TextStyle(
                            fontSize: 20.sp,
                            height: 1.1.h,
                            decoration: TextDecoration.none,
                            fontFamily: FontFamily.extraBold,
                            color: Colors.black)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("Your order was placed\nsuccessfully",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp,
                            height: 1.1.h,
                            decoration: TextDecoration.none,
                            fontFamily: FontFamily.regular,
                            color: Colors.black)),
                    SizedBox(
                      height: 17.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
      context: context).then((value) {
        Timer(const Duration(seconds: 2), () {
          navigateTo(page: HomeScreen(), leaveHistory: false);
        });
  });
}
