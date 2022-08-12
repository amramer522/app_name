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
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff707070),
              width: 1.sp
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xff707070).withOpacity(.8),
                blurRadius: 1,
                blurStyle: BlurStyle.outer
              ),
            ],
            borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.04),
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(8.r))),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: Color(0xff2F1F2B),
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
                    color: Color(0xff353636))),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
