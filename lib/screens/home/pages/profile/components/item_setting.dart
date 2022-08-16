import 'package:app_name/core/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../gen/fonts.gen.dart';

class ItemSetting extends StatelessWidget {
  final String image;
  final String title;
  final Widget? page;
  final bool isLogout;

  const ItemSetting(
      {Key? key,
      required this.image,
      required this.title,
       this.page,
      this.isLogout = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLogout) {
        } else {
          navigateTo(page: page);
        }
      },
      child: Container(
        height: 60.h,
        margin: EdgeInsetsDirectional.only(start: 20.w, top: 20.h, end: 20.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurStyle: BlurStyle.outer,
                blurRadius: 5,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadiusDirectional.circular(6.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25.w,
            ),
            SvgPicture.asset(image),
            SizedBox(
              width: 25.w,
            ),
            Text(title,
                style:
                    TextStyle(fontSize: 16.sp, fontFamily: FontFamily.regular)),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
            ),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}