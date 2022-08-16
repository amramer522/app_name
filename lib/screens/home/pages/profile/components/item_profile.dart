import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/fonts.gen.dart';

class ItemProfile extends StatelessWidget {
  final String title;
  final Widget page;
  final int numberOfItems;

  const ItemProfile(
      {Key? key,
      required this.title,
      required this.page,
      required this.numberOfItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(page: page);
      },
      child: Container(
        height: 90.h,
        margin: EdgeInsetsDirectional.only(start: 20.w, top: 20.h,end: 20.w),
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
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
            Container(
              width: 100.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey)
              ),
            ),
            SizedBox(
              width: 24.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 17.sp, fontFamily: FontFamily.bold)),
                Text("$numberOfItems Items",
                    style: TextStyle(
                        fontSize: 13.sp, fontFamily: FontFamily.regular)),
              ],
            ),
            const Spacer(),
            const Align(
              alignment: AlignmentDirectional.center,
              child: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
            SizedBox(
              width: 11.w,
            )
          ],
        ),
      ),
    );
  }
}
