import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
class ItemSpecifications extends StatelessWidget {
  final String title,value;
  const ItemSpecifications({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 5.h),
      child: Row(
        children: [
          Text(title,style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.regular,color: const Color(0xff7B7B7B))),
          const Spacer(),
          Text(value,style: TextStyle(fontSize: 16.sp,fontFamily: FontFamily.regular,color: const Color(0xff000000))),
        ],
      ),
    );
  }
}
