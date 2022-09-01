import 'package:app_name/shared/second_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper_methods.dart';
import '../../core/styles/styles.dart';
import '../../gen/fonts.gen.dart';
import '../../shared/items/item_brand_collage.dart';
import '../editor/view.dart';
import '../home/pages/cart/components/item_cart_free.dart';
import '../payment_methods/view.dart';

class CollageDetailsScreen extends StatelessWidget {
  const CollageDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(title: "Collage Details"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemBrandCollage(
              index: 0,
              withEditCollage: false,
            ),
            const Divider(
              thickness: 6,
              color: Color(0xffEEEEEE),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
              child: Text(
                "Collage Items",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontFamily.bold,
                  color: const Color(0xff516E00),
                ),
              ),
            ),
            ...List.generate(
                3,
                (index) => Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: ItemCartFree(index: index, isFree: false),
                        ),
                        index == 2
                            ? const SizedBox.shrink()
                            : Divider(indent: 100.w, thickness: 1.5.h)
                      ],
                    )),
            Center(
              child: Container(
                height: 57.h,
                width: 351.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text("Collage subtotal",
                        style: TextStyle(
                            fontSize: 18.sp, fontFamily: FontFamily.regular,color: Color(0xff7B7B7B))),
                    const Spacer(),
                    Text("LE 0,00",
                        style: TextStyle(
                            fontSize: 15.sp, fontFamily: FontFamily.bold)),
                    SizedBox(
                      width: 18.w,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    color: Color(0xffEEEEEE)),
              ),
            ),
            Padding(
              padding: mainPagePadding,
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        navigateTo(page: EditorScreen());
                      },
                      child: Text("Edit Collage",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: FontFamily.regular,
                          )))),
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}
