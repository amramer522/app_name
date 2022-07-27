import 'package:app_name/screens/on_boarding/view.dart';
import 'package:badges/badges.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/../core/cache_helper.dart';
import '/../core/styles/colors.dart';
import '/../gen/assets.gen.dart';
import '/../gen/fonts.gen.dart';
import '/../generated/locale_keys.g.dart';
import '../core/helper_methods.dart';

class SecondAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool haveAction;
  final bool isFilter;

  const SecondAppBar({
    Key? key,
    required this.title,
    this.haveAction = false,
    this.isFilter = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 16.h),
        margin: EdgeInsets.only(bottom: 20.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                Assets.icons.backArrow,
                height: 18.h,
                width: 27.41.w,
              ),
            ),
            const Spacer(),
            Text(title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontFamily: FontFamily.bold,
                )),
            const Spacer(),
            haveAction
                ? GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      Assets.icons.filter,
                      height: 21.h,
                      width: 21.h,
                    ))
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
