import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/../gen/assets.gen.dart';
import '/../gen/fonts.gen.dart';
import 'fileter_dialog.dart';

class SecondAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool haveAction;
  final bool haveBack;
  final bool isFilter;
  final List<Widget>? actions;

  const SecondAppBar({
    Key? key,
    this.title = "",
    this.haveAction = false,
    this.isFilter = true,
    this.actions,
    this.haveBack = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(65.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          haveBack
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    Assets.icons.backArrow,
                    height: 18.h,
                    width: 27.41.w,
                  ),
                )
              : const SizedBox(),
          const Spacer(),
          Text(title),
          const Spacer(),
        ],
      ),
      actions: [
        haveAction
            ? GestureDetector(
                onTap: () {
                  showFilterDialog(context);
                },
                child: SvgPicture.asset(
                  Assets.icons.filter,
                  height: 21.h,
                  width: 21.h,
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
