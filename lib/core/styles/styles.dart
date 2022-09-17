import '/../core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';

final mainPagePadding = EdgeInsets.symmetric(horizontal: 18.w);

TextStyle styleAppBarTitle() {
  return TextStyle(
      fontSize: 22.sp,
      height: 2.5.h,
      fontFamily: FontFamily.bold,
      color: colorPrimary);
}

TextStyle styleMainText() {
  return const TextStyle();
}

TextStyle styleMainTitlesText() {
  return TextStyle(
      fontSize: 18.sp, fontFamily: FontFamily.bold, color: colorPrimary);
}

TextStyle styleButtonsText() {
  return TextStyle(
      fontSize: 19.sp,
      height: 1.5,
      fontFamily: FontFamily.bold,
      color: colorPrimary);
}

List<BoxShadow> shadowOfItem() {
  return [
    BoxShadow(
        color: Colors.grey.withOpacity(.2),
        blurStyle: BlurStyle.outer,
        blurRadius: 5,
        spreadRadius: 1)
  ];
}
