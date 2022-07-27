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

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 16.h),
        margin: EdgeInsets.only(bottom: 20.h),
        child: Row(
          children: [
            Image.asset(
              Assets.images.appLogo.path,
              height: 23.h,
              width: 23.w,
            ),
            SizedBox(
              width: 11.w,
            ),
            Text(LocaleKeys.appName.tr(),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontFamily.bold,
                    color: colorPrimary)),
            SizedBox(
              width: 35.w,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // navigateTo(context, page: OnBoardingScreen());
              },
              child: Badge(
                badgeColor: colorPrimary,
                animationType: BadgeAnimationType.scale,
                borderSide: const BorderSide(width: .5, color: Colors.white),
                position: BadgePosition.topStart(start: -1.w),
                showBadge: CacheHelper.getNumOfUnReadNotifications()!=0,
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
                  // decoration: BoxDecoration(
                  //     color: colorPrimary.withOpacity(.1),
                  //     borderRadius: BorderRadius.circular(9.w)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
