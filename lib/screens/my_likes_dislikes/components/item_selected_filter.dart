import 'package:app_name/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';

class ItemSelectedFilter extends StatelessWidget {
  const ItemSelectedFilter(
      {Key? key, this.onPress, this.isSelected = false, this.title = ""})
      : super(key: key);
  final VoidCallback? onPress;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 77.w,
        decoration: BoxDecoration(
            color: isSelected ? colorPrimary : const Color(0xffC1C6C8).withOpacity(.3),
            borderRadius: BorderRadius.circular(8.r)),
        child: Center(
          child: Text(title,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 17.sp,
                  height: 2.h,
                  fontFamily: FontFamily.bold)),
        ),
      ),
    );
  }
}
