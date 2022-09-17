import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper_methods.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../product_details/view.dart';

class ItemCart extends StatefulWidget {
  final int index;
  const ItemCart({Key? key,required this.index}) : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
                  color: Color(0xff034C65*(widget.index+1)),
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.sp, fontFamily: FontFamily.bold)),
                  Row(
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
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 10.w),
                    child: SvgPicture.asset(
                      "assets/icons/delete.svg",
                      color: const Color(0xff7B7B7B),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (count > 1) {
                            count--;
                            setState(() {});
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          child: Icon(
                            Icons.remove,
                            size: 16.h,
                            color: Colors.black,
                          ),
                          decoration: const BoxDecoration(color: Color(0xffE6E6E6)),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(count.toString(),
                          style: TextStyle(
                              fontSize: 16.sp, fontFamily: FontFamily.bold)),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          count++;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          child: Icon(
                            Icons.add,
                            size: 16.h,
                            color: Colors.black,
                          ),
                          decoration: const BoxDecoration(color: Color(0xffE6E6E6)),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
