import 'package:app_name/core/helper_methods.dart';
import 'package:app_name/screens/product_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/fonts.gen.dart';

class ItemCartFree extends StatelessWidget {
  final int index;
  final bool isFree;

  const ItemCartFree({Key? key, required this.index, this.isFree = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(page: ProductDetailsScreen());
      },
      child: Container(
        color: Colors.transparent,
        height: 100.h,
        child: Row(
          children: [
            Container(
              width: 90.w,
              decoration: BoxDecoration(
                  color: Color(0xff034C65 * (index + 1)),
                  borderRadius: BorderRadius.circular(9.r)),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("This product full name",
                      style: TextStyle(
                          fontSize: 13.sp, fontFamily: FontFamily.bold)),
                  Text(isFree ? "Free" : "\$34.00",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: FontFamily.bold,
                          color: const Color(0xff516E00))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
