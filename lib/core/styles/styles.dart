import 'package:app_name/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';

final mainPagePadding = EdgeInsets.symmetric(horizontal: 18.w);

TextStyle styleAppBarTitle() {
  return TextStyle(
    fontSize: 22.sp,
    fontFamily: FontFamily.bold,
    color: colorPrimary
  );
}

TextStyle styleMainText() {
  return TextStyle();
}

TextStyle styleButtonsText() {
  return TextStyle(
      fontSize: 19.sp,
      height: 1.5,
      fontFamily: FontFamily.bold,
      color: colorPrimary
  );
}
