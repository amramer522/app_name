import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/../gen/assets.gen.dart';
import '../core/helper_methods.dart';
import '../screens/filter/view.dart';

class SecondAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool haveAction;
  final Color? color;
  final bool haveBack;
  final bool isFilter;
  final Widget? backPage;
  final List<Widget>? actions;

  const SecondAppBar({
    Key? key,
    this.title = "",
    this.haveAction = false,
    this.isFilter = true,
    this.actions,
    this.haveBack = true,
    this.backPage,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(65.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color!,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            haveBack
                ? GestureDetector(
                    onTap: () {
                      if (backPage != null) {
                        navigateTo(page: backPage);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8.r),
                      child: SvgPicture.asset(
                        Assets.icons.backArrow,
                        color:
                            color == Colors.black ? Colors.white : Colors.black,
                        height: 18.h,
                        width: 27.41.w,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            Text(title),
            const Spacer(),
          ],
        ),
        actions: [
          haveAction
              ? GestureDetector(
                  onTap: () {
                    navigateTo(page: const FilterScreen());
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.w),
                    child: SvgPicture.asset(
                      Assets.icons.filter,
                      height: 21.h,
                      width: 21.h,
                    ),
                  ))
              : const SizedBox.shrink(),
          actions != null
              ? Container(
                  height: 35.h,
                  color: Colors.transparent,
                  child: Row(
                    children: List.generate(
                        actions!.length, (index) => actions![index]),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
