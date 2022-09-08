import 'dart:math';

import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/gen/assets.gen.dart';
import 'package:app_name/screens/product_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/styles/styles.dart';
import '../../../../../gen/fonts.gen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(page: ProductDetailsScreen());
      },
      child: Container(
        height: 135.h,
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            boxShadow: shadowOfItem(), borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(12.r),
                        bottomStart: Radius.circular(12.r))),
                padding:mainPagePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("main title",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: FontFamily.bold,
                            color: Colors.white)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Subtitle",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: FontFamily.regular,
                                color: Colors.white)),
                        SizedBox(
                          width: 10.w,
                        ),
                        Transform.rotate(
                          angle: pi,
                          child: SvgPicture.asset(
                            Assets.icons.forward,
                            height: 20.h,
                            width: 20.w,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 130.w,
              decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(12.r),
                      bottomEnd: Radius.circular(12.r))),
            ),
          ],
        ),
      ),
    );
  }
}
