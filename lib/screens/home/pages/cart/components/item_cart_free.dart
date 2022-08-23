import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../gen/fonts.gen.dart';
class ItemCartFree extends StatelessWidget {
  final int index;
  final bool isFree;
  const ItemCartFree({Key? key,required this.index, this.isFree=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 90.w,
            decoration: BoxDecoration(
                color: Color(0xff034C65*(index+1)),
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
                Text(isFree?"Free":"\$34.00",
                    style: TextStyle(
                        fontSize: 16.sp, fontFamily: FontFamily.bold,color: Color(0xff516E00))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
