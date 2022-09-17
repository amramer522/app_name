import '/../core/helper_methods.dart';
import '/../screens/product_details/view.dart';
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
        navigateTo(page: const ProductDetailsScreen());
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
                          fontSize: 15.sp, fontFamily: FontFamily.bold)),
                  isFree?Text("Free",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: FontFamily.bold,
                          color: const Color(0xff516E00))):Row(
                    children: [
                      Text("EGP",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.regular)),
                      SizedBox(width: 5.w,),
                      Text("29.00",style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.bold)),
                      SizedBox(width: 10.w,),
                      Text("35.00",style: TextStyle(fontSize: 13.sp,decoration: TextDecoration.lineThrough,decorationThickness: 20.h,fontFamily: FontFamily.bold)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
