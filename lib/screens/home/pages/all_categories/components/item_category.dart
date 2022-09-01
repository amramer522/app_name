import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/fonts.gen.dart';


class ItemCategory extends StatefulWidget {
  const ItemCategory({Key? key}) : super(key: key);

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        setState(() {});
      },
      child: Container(
        height: 100,
        margin: EdgeInsetsDirectional.only(start: 50.w, top: 20.h),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(6.r),
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
                        fontSize: 17.sp, fontFamily: FontFamily.bold)),
                Text("2140 Items",
                    style: TextStyle(
                        fontSize: 13.sp, fontFamily: FontFamily.regular)),
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
