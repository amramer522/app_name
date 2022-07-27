import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/screens/home/view.dart';
import 'package:app_name/screens/login/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors.dart';
import '../../gen/fonts.gen.dart';
import '../../generated/locale_keys.g.dart';
import 'controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(34.r),
          children: [
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
                onTap: () {
                  navigateTo(context, page: LoginScreen(), leaveHistory: false);
                },
                child: Text(
                  LocaleKeys.skip.tr(),
                  style: TextStyle(
                      fontSize: 20.sp, fontFamily: FontFamily.regular),
                  textAlign: TextAlign.end,
                )),
            SizedBox(
              height: 60.h,
            ),
            SizedBox(
              height: 294.h,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  controller.images.length,
                  (index) => Image.asset(
                    controller.images[controller.currentIndex],
                    width: 225.44,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              controller.titles[controller.currentIndex],
              style: TextStyle(fontSize: 28.sp, color: const Color(0xff4A4B4D)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 33.h,
            ),
            Text(
              controller.hints[controller.currentIndex],
              style: TextStyle(fontSize: 13.sp, color: const Color(0xff7C7D7E)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.images.length,
                (index) => Container(
                  margin: EdgeInsetsDirectional.only(start: 5.w),
                  height: 9.h,
                  width: index == controller.currentIndex ? 34.w : 8.w,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(25.r),
                    color: Color(index == controller.currentIndex
                        ? 0xffFC6011
                        : 0xffD6D6D6),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.currentIndex != 2) {
                    controller.currentIndex++;
                    setState(() {});
                  } else {
                    navigateTo(context,
                        page: LoginScreen(), leaveHistory: false);
                  }
                },
                child: Text(controller.currentIndex == 2
                    ? LocaleKeys.getStarted.tr()
                    : LocaleKeys.next.tr()))
          ],
        ),
      ),
    );
  }
}
