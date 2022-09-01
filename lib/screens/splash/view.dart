import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:app_name/generated/locale_keys.g.dart';
import 'package:app_name/screens/home/view.dart';
import 'package:app_name/screens/login/view.dart';
import 'package:app_name/screens/on_boarding/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/cache_helper.dart';
import '../../core/helper_methods.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      navigateTo(
          page: CacheHelper.getIfFirstTime()
              ? const OnBoardingScreen()
              :  const HomeScreen(),
          leaveHistory: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Swing(
                child: Image.asset(
                  Assets.images.appLogo.path,
                  width: 65.46.w,
                  height: 78.33.h,
                ),
              ),
              SizedBox(
                height: 20.9.h,
              ),
              Text(LocaleKeys.appName.tr(),
                  style: TextStyle(
                      fontSize: 23.sp, fontFamily: FontFamily.regular))
            ],
          ),
        ),
      ),
    );
  }
}
