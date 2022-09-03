import 'package:app_name/core/styles/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
import '../../../shared/show_category_images_dialog.dart';

class ItemEditorCategory extends StatelessWidget {
  const ItemEditorCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showCategoryImagesDialog(context);
      },
      child: Container(
        width: 103.w,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            boxShadow: shadowOfItem(),
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(8.r))),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: const Color(0xff2F1F2B),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CachedNetworkImage(
              imageUrl:
                  "https://www.cips.org/supply-management-jobs/getasset/63f90cc8-0778-4023-80b9-85246ce586b0/",
              height: 60.h,
              width: 60.h,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Text("Category",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: FontFamily.bold,
                    color: const Color(0xff353636))),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
