import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/fonts.gen.dart';

class ItemMyAddress extends StatefulWidget {
  const ItemMyAddress({Key? key}) : super(key: key);

  @override
  State<ItemMyAddress> createState() => _ItemMyAddressState();
}

class _ItemMyAddressState extends State<ItemMyAddress> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148.h,
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsetsDirectional.only(start: 20.w, top: 20.h, end: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurStyle: BlurStyle.outer,
              blurRadius: 5,
              spreadRadius: 1)
        ],
        borderRadius: BorderRadiusDirectional.circular(6.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Khalid Ibn Elwalid st 9th street,Old Maadi, Cairo",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: FontFamily.regular,
                  color: const Color(0xff7B7B7B))),
          SizedBox(
            height: 20.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    isChecked = !isChecked;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 25.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffC9C9C9)),
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Center(
                            child: isChecked
                                ? Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 16.h,
                                  )
                                : const SizedBox.shrink()),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text("Make default address",
                          style: TextStyle(
                              fontSize: 16.sp, fontFamily: FontFamily.regular)),
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/delete.svg",
                  color: Colors.red,
                ),
                SizedBox(
                  width: 20.w,
                ),
                SvgPicture.asset(
                  "assets/icons/edit_pin.svg",
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
