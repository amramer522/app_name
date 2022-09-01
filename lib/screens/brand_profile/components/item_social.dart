import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class ItemSocial extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;
  const ItemSocial({Key? key, required this.image,  this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 40.h,
        margin: EdgeInsetsDirectional.only(end: 15.w,top: 13.h),
        child: Padding(
            padding: EdgeInsets.all(10.r),
            child: SvgPicture.asset(
              "assets/icons/$image.svg",
            )),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffD1D9E6), width: .5.w),
            shape: BoxShape.circle),
      ),
    );
  }
}
