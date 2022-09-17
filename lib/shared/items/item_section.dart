import '/../core/helper_methods.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/fonts.gen.dart';

class ItemSection extends StatelessWidget {
  final String image;
  final String title;
  final int index;
  final Widget page;

  const ItemSection({Key? key, required this.image, required this.title,required this.index,required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(page: page);
      },
      child: Container(
        width: 100.w,
        height: 106.w,
        margin: EdgeInsetsDirectional.only(start: index!=0?20.w:0),
        decoration: BoxDecoration(
          color: const Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(12.r)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/$image.svg",
              height: 47.25.w,
              width: 47.25.w,
            ),
            SizedBox(
              height: 9.h,
            ),
            Text(title,
                style: TextStyle(fontSize: 15.sp, fontFamily: FontFamily.bold))
          ],
        ),
      ),
    );
  }
}
