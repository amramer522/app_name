import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
class ItemNotification extends StatelessWidget {
  const ItemNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsetsDirectional.only(start: 18.w),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text('"Username" liked your Collage',style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
                SizedBox(height: 5.h,),
                Text('7 Aug at 2:30 pm',style: TextStyle(fontSize: 17.sp,fontFamily: FontFamily.regular)),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
