import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/../core/styles/colors.dart';

class AppThemes {
  static ThemeData light() {
    return ThemeData(
      primaryColor: colorPrimary,
      primarySwatch: buildMaterialColor(Colors.black),
      scaffoldBackgroundColor: Colors.white,
      platform: TargetPlatform.iOS,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(264.w, 44.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
          )
        ),
      ),
      sliderTheme: const SliderThemeData(
        valueIndicatorColor: colorPrimary,
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r,),
            borderSide: const BorderSide(width: 0,color: Colors.transparent)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r,),
            borderSide: const BorderSide(width: 0,color: Colors.transparent)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r,),
            borderSide: const BorderSide(width: 0,color: Colors.transparent)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r,),
            borderSide: const BorderSide(width: 0,color: Colors.transparent)
        ),
        fillColor: const Color(0xffE6E6E6).withOpacity(.4),
        filled: true,
        
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          // titleTextStyle: TextStyle(
          //     color: colorLModeAccent,
          //     fontSize: 20.sp,
          //     fontWeight: FontWeight.bold),
          backgroundColor: Colors.transparent),
    );
  }
}
