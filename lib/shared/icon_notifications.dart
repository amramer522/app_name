import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/cache_helper.dart';
import '../core/helper_methods.dart';
import '../core/styles/colors.dart';
import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';
import '../screens/notifications/view.dart';
class ItemNotifications extends StatelessWidget {
  const ItemNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navigateTo(page: NotificationsScreen());
      },
      icon: Badge(
        badgeColor: colorPrimary,
        animationType: BadgeAnimationType.scale,
        borderSide: const BorderSide(width: .5, color: Colors.white),
        position: BadgePosition.topStart(start: -1.w),
        showBadge: CacheHelper.getNumOfUnReadNotifications() != 0,
        badgeContent: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: colorPrimary,
            ),
            child: Text(
                CacheHelper.getNumOfUnReadNotifications().toString(),
                style: TextStyle(
                    fontSize: 8.sp,
                    fontFamily: FontFamily.bold,
                    height: .8,
                    color: Colors.white))),
        child: Container(
          height: 33.h,
          width: 33.w,
          padding: EdgeInsets.all(6.r),
          child: SvgPicture.asset(
            Assets.icons.notifications,
            color: colorPrimary,
          ),
        ),
      ),
    );
  }
}
