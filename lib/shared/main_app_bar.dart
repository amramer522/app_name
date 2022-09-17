import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/../gen/assets.gen.dart';
import '/../generated/locale_keys.g.dart';
import 'icon_notifications.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            Assets.images.appLogo.path,
            height: 25.h,
            width: 25.h,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            LocaleKeys.appName.tr(),
            style: TextStyle(
              fontSize: 20.sp,
              height: .7
            ),
          ),
        ],
      ),
      actions: const [
        ItemNotifications(),
      ],
    );
  }
}
