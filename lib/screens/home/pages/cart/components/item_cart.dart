import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../gen/fonts.gen.dart';

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
    return Container(
      height: 100,
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
                    style: TextStyle(
                        fontSize: 13.sp, fontFamily: FontFamily.bold)),
                Text("\$29.00",
                    style: TextStyle(
                        fontSize: 16.sp, fontFamily: FontFamily.bold)),
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
                        decoration: BoxDecoration(color: Color(0xffE6E6E6)),
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
                        decoration: BoxDecoration(color: Color(0xffE6E6E6)),
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
    );
  }
}
