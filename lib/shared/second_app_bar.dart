import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/helper_methods.dart';
import '../screens/filter/view.dart';
import '/../gen/assets.gen.dart';
import '/../gen/fonts.gen.dart';
import 'fileter_dialog.dart';

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
    this.backPage,  this.color = Colors.white,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(65.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color!,
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
                      color: color==Colors.black?Colors.white:Colors.black,
                      height: 18.h,
                      width: 27.41.w,
                    ),
                  ),
                )
              : const SizedBox(),
          const Spacer(),
          Text(title),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
      actions: [
        haveAction
            ? GestureDetector(
                onTap: () {
                  // showFilterDialog(context);
                  navigateTo(page: FilterScreen());

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
            ? SizedBox(
                height: 35.h,
                child: Row(
                  children: List.generate(
                      actions!.length, (index) => actions![index]),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
