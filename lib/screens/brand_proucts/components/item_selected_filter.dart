import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';

class ItemSelectedFilter extends StatelessWidget {
  const ItemSelectedFilter(
      {Key? key, this.onPress, this.title = "",  this.isSelected=false})
      : super(key: key);
  final VoidCallback? onPress;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 77.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: isSelected?Colors.black:const Color(0xffC1C6C8).withOpacity(.3),
            borderRadius: BorderRadius.circular(8.r)),
        child: Center(
          child: Text(title,
              style: TextStyle(
                  color:  Colors.black,
                  fontSize: 15.sp,
                  fontFamily: FontFamily.bold)),
        ),
      ),
    );
  }
}
