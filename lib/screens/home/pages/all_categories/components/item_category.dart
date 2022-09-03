import 'package:app_name/core/styles/styles.dart';
import 'package:app_name/screens/brand_proucts/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper_methods.dart';
import '../../../../../gen/fonts.gen.dart';

class ItemCategory extends StatefulWidget {
  final bool fromHome;

  const ItemCategory({Key? key, this.fromHome = false}) : super(key: key);

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.fromHome) {
          isSelected = !isSelected;
          setState(() {});
        } else {
          navigateTo(page: BrandProductScreen(title: "Category Products"));
        }
      },
      child: Container(
        height: 100.h,
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(color: Colors.white, boxShadow: shadowOfItem()),
        child: Row(
          children: [
            Container(
              width: 100.h,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(6.r),
                  bottomStart: Radius.circular(6.r),
                ),
              ),
            ),
            SizedBox(
              width: 24.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Category name",
                    style: TextStyle(
                        fontSize: 18.sp, fontFamily: FontFamily.bold)),
                Text("2140 Items",
                    style: TextStyle(
                        fontSize: 16.sp, fontFamily: FontFamily.regular)),
              ],
            ),
            const Spacer(),
            isSelected
                ? Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: IconButton(
                        onPressed: () {
                          isSelected = false;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Color(0xff516E00),
                        )),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
